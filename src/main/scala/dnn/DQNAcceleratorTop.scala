package dnn
import chisel3._
import chisel3.util._
import opcode._
import dfunc._
import chisel3.stage.ChiselStage

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file incorporates all components in the design, including the DNNProcessingCore, the matrix memory, //
//  vector memory, multiple high signal decoder, one hot encoder, instruction memory, instruction pointer,  //
//                  action, activation block, reward table and an agent for gridworld demo                  //
//                                   Designed and implemented by Vu D. Le,                                  //
//            at The Information Technology Institute (ITI), Vietnam National University, Hanoi,            //
//                                               January 2022.                                              //
//                                         ChiselHDL implementation                                         //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////


case class DQNAcceleratorParams(
  address             : BigInt  = 0x10020000,
  useAXI4             : Boolean = false,
  dataWidth           : Int     = 12,
  binaryPoint         : Int     = 6,
  nWeightBanks        : Int     = 32,
  activationMemDepth  : Int     = 8,   // must be <= 32
  scratchPadMemDepth  : Int     = 64, // <= 1024
  instructionMemDepth : Int     = 1024, // 4 kb
  maxMazeSize         : Int     = 25,
  dev                 : Boolean = false
)

class DQNAccelertorTop(val p: DQNAcceleratorParams) extends Module{
  val io = IO(new Bundle{
    val instruction     = Input(UInt(32.W))
    val wrEna           = Input(Bool())
    val instructionAddr = Input(UInt(log2Ceil(p.instructionMemDepth).W))
    val pointIR         = Input(Bool()) // use software to point IR to a particular addr
    val runProgram      = Input(Bool())
    val doneInference   = Output(Bool())

    // for on chip environment maze
    val rewardIn        = Input(SInt(3.W))
    val state           = Input(UInt(log2Ceil(p.maxMazeSize).W))
    val wrEnaEnv        = Input(Bool())

    val x_initial       = Input(UInt(3.W))
    val y_initial       = Input(UInt(3.W))
    val loadInitalState = Input(Bool())
    val mazeSize        = Input(UInt(3.W))
    val newStateFound   = Output(Bool())
    val nextState       = Output(UInt(log2Ceil(p.maxMazeSize).W))



    // optional IO used in the development process for check values in the sratchpad memory
    // These signals will be ommitted when run synthesis when "dev" in DQNAccelertorParams is false

    val dataValid        = if(p.dev) Some(Output(Bool())) else None
    val dataOut          = if(p.dev) Some(Vec(p.nWeightBanks, Output(SInt(p.dataWidth.W)))) else None
    val weightedSum      = if(p.dev) Some(Output(SInt(p.dataWidth.W))) else None
    val weightedSumValid = if(p.dev) Some(Output(Bool())) else None
  })

  val DQNCore = Module(new ProcessingCore(p.nWeightBanks, p.scratchPadMemDepth,
  p.activationMemDepth, p.dataWidth, p.binaryPoint, true))

  val instructionMemory  = SinglePortedRam(UInt(32.W), p.instructionMemDepth)
  val agent              = Module(new Agent)
  val environment        = Module(new Environment(p.maxMazeSize))
  val instructionPointer = RegInit(0.U(log2Ceil(p.instructionMemDepth).W))
  val instructionValid   = RegInit(false.B)
  val rdEna              = WireInit(false.B)

  // ========================= Instruction Pointer =====================//

  when(io.pointIR){
    instructionPointer := io.instructionAddr
  }.elsewhen(DQNCore.io.jumpIP){
    instructionPointer := DQNCore.io.IPAddress
    rdEna              := true.B
    instructionValid   := true.B
  }.elsewhen(DQNCore.io.increaseIP){
    instructionPointer := instructionPointer + 1.U
    rdEna              := true.B
    instructionValid   := true.B
  }.elsewhen(io.runProgram){
    instructionPointer := instructionPointer + 1.U
    rdEna              := true.B
    instructionValid   := true.B
  }.elsewhen(DQNCore.io.ready){
    instructionValid := false.B
  }

  when(io.wrEna){
    instructionMemory.io.addr := io.instructionAddr
  }.otherwise{
    instructionMemory.io.addr := instructionPointer
  }


  instructionMemory.io.wrEna  := io.wrEna
  instructionMemory.io.dataIn := io.instruction
  instructionMemory.io.rdEna  := rdEna

  // ========================= Connect modules together =====================//
  environment.io.wrEna        := io.wrEnaEnv
  environment.io.rewardIn     := io.rewardIn

  when(io.wrEnaEnv){
    environment.io.state := io.state
  }.otherwise{
    environment.io.state := agent.io.state
  }

  agent.io.reward          := environment.io.reward
  agent.io.x_initial       := io.x_initial
  agent.io.y_initial       := io.y_initial
  agent.io.loadInitalState := io.loadInitalState
  agent.io.mazeSize        := io.mazeSize
  environment.io.rdEna     := agent.io.observe

  agent.io.actionValid        := DQNCore.io.actionValid
  agent.io.action             := DQNCore.io.action
  DQNCore.io.terminate        := agent.io.terminate
  DQNCore.io.state            := agent.io.state
  DQNCore.io.instruction      := instructionMemory.io.dataOut
  DQNCore.io.instructionValid := instructionValid

  // ==============IO Connections =================== //
  io.doneInference := agent.io.terminate
  io.nextState     := agent.io.state
  io.newStateFound := agent.io.newStateFound

  if(p.dev){
    io.weightedSumValid.get := DQNCore.io.weightedSumValid.get
    io.weightedSum.get      := DQNCore.io.weightedSum.get
    io.dataValid.get        := DQNCore.io.dataValid.get
    io.dataOut.get          := DQNCore.io.dataOut.get
  }
}

object DQNAcceleratorTopGenerator extends App{
  new (ChiselStage).emitVerilog(new DQNAccelertorTop(DQNAcceleratorParams.apply()),
    Array("--target-dir","generatedVerilog"))
}
// sbt "runMain dnn.DQNAcceleratorTopGenerator"
