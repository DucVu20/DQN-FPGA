package dnn                                                                                                            
import chisel3._                                                                                                       
import chisel3.util._                                                                                                  
import mfunc._
import dfunc._
import opcode._
//////////////////////////////////////////////////////////////////////////////////////////////////
// The PEArray contains multiple processing elements (PEs) to perform various operations needed //
// for DNN processing, including MMV, VMM, MMS, MAM, MSB, VLOAD, VSTORE.                        //
//             Designed and written in ChiselHDL by Vu D. Le                                    //
//                               at ITI-VNU                                                     //
//                             date: Dec 2021                                                   //
//////////////////////////////////////////////////////////////////////////////////////////////////

class ProcessingCore(nWeightBanks: Int, sratchPadMemDepth: Int, nRowVector: Int,
                         dataWidth: Int, binaryPoint: Int ) extends Module{
  val io = IO(new Bundle{
    val instruction = Input(UInt(32.W))
    val valid       = Input(Bool()) // start instruction
    val ready        = Output(Bool()) // instruction done
    val dataValid = Output(Bool())
    val dataOut     = Vec(nWeightBanks, Output(SInt(dataWidth.W)))
    val dataIn      = Input(SInt(dataWidth.W)) // data bus for random number, write into the matrix buffer
  })
  
  val weightBanks    = Array.fill(nWeightBanks){ DualPortedMem(SInt(dataWidth.W), sratchPadMemDepth)}
  //val inputVectorMem = Array.fill(nWeightBanks){ DualPortedMem(SInt(dataWidth.W), nRowVector)}

  //  define the interface for the weight banks
  val weightRdAddrNode = WireInit(0.U(log2Ceil(sratchPadMemDepth).W))
  val weightWrAddrNode = WireInit(0.U(log2Ceil(sratchPadMemDepth).W))
  val weightWrDataBus  = Array.fill(nWeightBanks){WireInit(0.S(dataWidth.W))}
  val weightRdDataBus  = Array.fill(nWeightBanks){WireInit(0.S(dataWidth.W))}
  val writeSignalBus   = Array.fill(nWeightBanks){WireInit(false.B)}
  val readSignalBus    = Array.fill(nWeightBanks){WireInit(false.B)}
  val rdDataValid = WireInit(false.B)

  // define counter for the matrix memory
  val colCounter = RegInit(0.U(log2Ceil(sratchPadMemDepth).W))
  val rowCounter = RegInit(0.U(log2Ceil(nWeightBanks).W))

  val adderTree      = AdderTree((nWeightBanks).toInt, 2*dataWidth)
  val oneHotDecoder  = OneHotEncoder(nWeightBanks)
  val memReadDecoder = EnableSignalDecoder(nWeightBanks)

  val quantizedSum = adderTree.io.sum(dataWidth, 0).asSInt()
  val VinSizeReg   = RegInit(0.U(log2Ceil(sratchPadMemDepth).W)) // row of the matrix
  val VoutSizeReg  = RegInit(0.U(log2Ceil(nWeightBanks).W)) // column of the matrix

  // ******************** DEFAULT VALUES FOR ALL **********************//
  oneHotDecoder.io.enable := false.B
  memReadDecoder.io.enable := false.B
  adderTree.io.cal        := false.B
  oneHotDecoder.io.memRow := 0.U
  memReadDecoder.io.PEs   := 0.U

//  rdDataValid             := false.B

  // Connect the memory bank interface with the memory bank
  for(pe <- 0 until(nWeightBanks)){
    weightBanks(pe).io.wrData    := weightWrDataBus(pe)
    weightBanks(pe).io.writeAddr := weightWrAddrNode
    weightBanks(pe).io.readAddr  := weightRdAddrNode
    weightBanks(pe).io.rdEna     := readSignalBus(pe)
    weightBanks(pe).io.wrEna     := writeSignalBus(pe)
    weightRdDataBus(pe)          := weightBanks(pe).io.rdData
    readSignalBus(pe)            := false.B // by default don't read
    io.dataOut(pe)               := weightRdDataBus(pe)
    when(oneHotDecoder.io.writeSignal(pe)){
      io.dataOut(pe) := weightRdDataBus(pe)
    }
  }
  // ******************** DEFAULT VALUES FOR ALL **********************//

  //===================Connect Weight Banks and Input Activation Bank to Mul =======================//
  val mulResults = Reg(Vec(nWeightBanks, SInt((dataWidth*2).W)))
  for(pe <- 0 until(nWeightBanks)){
    //mulResults(pe) := weightBanks(pe).io.rdData * inputVectorMem(pe).io.rdData
    adderTree.io.in(pe) := mulResults(pe)
  }

             //////////////////////////////////////////////////
             // Extract fields from the instruction register //
             //////////////////////////////////////////////////
  val instructionRegister = RegInit(0.U((io.instruction.getWidth).W))

  val op          = instructionRegister(31, 30)
  val func        = instructionRegister(29, 28)
  val cond        = instructionRegister(27, 25)
  // Data Processing: MMV
  val MinAddr     = instructionRegister(24, 13)
  val VinAddr     = instructionRegister(12, 8)
  val VoutAddr    = instructionRegister(7, 0) // VoutAddr specifies the row address of the vector mem

  // Memory Instruction: MLOAD.
  val matrixRow   = instructionRegister(27, 23)
  val matrixCol   = instructionRegister(22, 13)
  val weightValue = instructionRegister(12, 0) // 13 bit weights
  // VLOAD
  val colVector   = instructionRegister(27, 23)
  val rowVector   = instructionRegister(22,13)
  // CMP

  //======================= PEArray Controller =========================//
  val idle::fetch::decode::executing::Nil = Enum(4)
  val Controller = RegInit(idle)
  val instructionDone = WireInit(false.B)

  // FMS control loop
  switch(Controller){
    is(idle){
      instructionDone := true.B
      when(io.valid){
        Controller := fetch
      }
    }
    is(fetch){
      Controller := decode
      instructionDone := false.B
    }
    is(decode){
      Controller := executing
      instructionDone := false.B
    }
    is(executing){
      when(instructionDone){
        when(io.valid){
          Controller := fetch
        }.otherwise{
          Controller := idle
        }
      }
    }
  }

  when(Controller === fetch){
    instructionRegister := io.instruction
  }
  when(Controller === decode){
    // ===== update the information of a matrix into these registers =====//
    when(op === 0.U){ // data processing
      when(func === MMVC){
        VinSizeReg  := instructionRegister(27, 14).asUInt()
        VoutSizeReg := instructionRegister(13, 0).asUInt()
      }
    }
  }

  //========================= Data Path ==================================//
  when(Controller === executing){
    // ================ LOAD A MATRIX INTO THE MEMORY ===================//
    when(op === memoryInstruction){
      when(func === MLOAD){ // load a matrix into the matrix memory
        oneHotDecoder.io.enable := true.B
        oneHotDecoder.io.memRow := matrixRow.asUInt()
        weightWrAddrNode        := matrixCol.asUInt()
        instructionDone         := true.B
        for(pe <- 0 until(nWeightBanks)){
          weightWrDataBus(pe) := weightValue.asSInt()
          writeSignalBus(pe)  := oneHotDecoder.io.writeSignal(pe)
        }
      }
      // ======================READ WEIGHTS FROM THE MATRIX MEMORY =====================//
      when(func === MREAD){
        memReadDecoder.io.PEs := matrixRow.asUInt()
        weightRdAddrNode := matrixCol.asUInt()
        memReadDecoder.io.enable := true.B
        instructionDone  := true.B
        for(pe <- 0 until(nWeightBanks)){
          readSignalBus(pe) := memReadDecoder.io.activatedSignals(pe)
        }
        rdDataValid := RegNext(RegNext(true.B))
      }
    }
    // ======================READ WEIGHTS FROM THE MATRIX MEMORY =====================//
  }
  // ============================= Connect IO ===============================//
  io.ready := instructionDone
  io.dataValid := rdDataValid
}
