package dnn
import chisel3._
import chisel3.util._

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This file incorporates all components in the design, including the DNNProcessingCore, the matrix memory, //
// vector memory, multiple high signal decoder, one hot encoder, instruction memory, instruction, pointer,  //
//                                    max4 block, divider and modulus.                                      //
//                                 Designed and implemented by Vu D. Le,                                    //
//                       at The Information Technology Institute (ITI), and SISLAB,                         //
//                                  Vietnam National University, Hanoi,                                     //
//                                             January 2022.                                                //
//                                        ChiselHDL implementation                                          //
//////////////////////////////////////////////////////////////////////////////////////////////////////////////

case class DQNAceleratorParams(
  address             : BigInt  = 0x10020000,
  useAXI4             : Boolean = false,
  dataWidth           : Int     = 8,
  binaryPoint         : Int     = 4,
  nWeightBanks        : Int     = 32,
  activationMemDepth          : Int     = 8,   // must be <= 32
  scratchPadMemDepth  : Int     = 128, // <= 1024
  instructionMemDepth : Int     = 1024,
  maxMazeSize         : Int     = 25
)

class DQNAccelertorTop(val p: DQNAceleratorParams) extends Bundle{
  val io = IO(new Bundle{
    val instruction     = Input(UInt(32.W))
    val instructionAddr = Input(UInt(log2Ceil(instructionMemDepth).W))
    val wrEna           = Input(Bool())

    val rewardIn        = Input(UInt(2.W))
    val wrEna           = Input(Bool())
    val state           = Input(UInt(log2Ceil(p.maxMazeSize).W))
  })

  val DQNCore = Module(new ProcessingCore(p.nWeightBanks, p.sratchPadMemDepth,
  p.activationMemDepth, p.dataWidth, p.binaryPoint))

  val instructionMemory = SinglePortedMem(UInt(32.W), p.instructionMemDepth)
  val agent = Modul(new Agent)
  val environment = Module(new Environment(p.maxMazeSize))
  val instructionPointer = RegInit(0.U(32.W))


  environment.io.wrEna := io.wrEna
  environment.io.rewardIn := io.rewardIn
  environment.io.state := io.state

}
