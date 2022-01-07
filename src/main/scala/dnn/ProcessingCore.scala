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
  val inputVectorMem = Array.fill(nWeightBanks){ DualPortedMem(SInt(dataWidth.W), nRowVector)}

  //  define the interface for the weight banks
  val rdDataMatrixValid = DelayBoolNCycles(0)
  val rdDataVecValid = DelayBoolNCycles(0)
  val weightRdAddrNode = WireInit(0.U(log2Ceil(sratchPadMemDepth).W))
  val weightWrAddrNode = WireInit(0.U(log2Ceil(sratchPadMemDepth).W))
  val weightWrDataBus  = Array.fill(nWeightBanks){WireInit(0.S(dataWidth.W))}
  val writeSignalBus   = Array.fill(nWeightBanks){WireInit(false.B)}
  val readSignalBus    = Array.fill(nWeightBanks){WireInit(false.B)}

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
  rdDataVecValid.io.signal2delay := false.B
  rdDataMatrixValid.io.signal2delay := false.B

  // Connect the memory bank interface with the memory bank
  for(pe <- 0 until(nWeightBanks)){
    weightBanks(pe).io.wrData    := weightWrDataBus(pe)
    weightBanks(pe).io.writeAddr := weightWrAddrNode
    weightBanks(pe).io.readAddr  := weightRdAddrNode
    weightBanks(pe).io.rdEna     := readSignalBus(pe)
    weightBanks(pe).io.wrEna     := writeSignalBus(pe)
    readSignalBus(pe)            := false.B // by default don't read
//    io.dataOut(pe)               := weightRdDataBus(pe)

    inputVectorMem(pe).io.writeAddr := 0.U
    inputVectorMem(pe).io.readAddr := 0.U
    inputVectorMem(pe).io.rdEna := false.B
    inputVectorMem(pe).io.wrEna := false.B
    inputVectorMem(pe).io.wrData := 0.S

    when(rdDataVecValid.io.delayedSignal){
      io.dataOut(pe) := inputVectorMem(pe).io.rdData
    }.elsewhen(rdDataMatrixValid.io.delayedSignal){
      io.dataOut(pe) := weightBanks(pe).io.rdData
    }.otherwise{
      io.dataOut(pe) := 0.S
    }
  }
  // ******************** DEFAULT VALUES FOR ALL **********************//

  //===================Connect Weight Banks and Input Activation Bank to Mul =======================//
  val mulResults = Reg(Vec(nWeightBanks, SInt((dataWidth*2).W)))
  for(pe <- 0 until(nWeightBanks)){
    //mulResults(pe) := weightBanks(pe).io.rdData * inputVectorMem(pe).io.rdData
    adderTree.io.in(pe) := mulResults(pe)
  }

  // ========== Extract fields from the instruction register ========//
  val instructionRegister = RegInit(0.U((io.instruction.getWidth).W))
  val op          = instructionRegister(31, 30).asUInt()
  val func        = instructionRegister(29, 27).asUInt()
  val cond        = instructionRegister(26, 24).asUInt()
  // Data Processing: MMV
  val MinAddr     = instructionRegister(23, 12).asUInt()
  val VinAddr     = instructionRegister(11, 7).asUInt()
  val VoutAddr    = instructionRegister(6, 0).asUInt() // VoutAddr specifies the row address of the vector mem

  // Memory Instruction: MLOAD.
  val matrixRow   = instructionRegister(26, 22).asUInt()
  val matrixCol   = instructionRegister(21, 12).asUInt()
  val weightValue = instructionRegister(11, 0).asSInt() // 13 bit weights
  // VLOAD
  val colVector   = instructionRegister(26, 22).asUInt()
  val rowVector   = instructionRegister(21, 12).asUInt()
  val activation = instructionRegister(11, 0).asSInt()
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
//      when(func === MMVC){
//        VinSizeReg  := instructionRegister(26, 13).asUInt()
//        VoutSizeReg := instructionRegister(12, 0).asUInt()
//      }
    }
  }

  //========================= Data Path ==================================//
  when(Controller === executing){
    when(op === memoryInstruction){
      switch(func){
        // ================ LOAD A MATRIX INTO THE MEMORY ===================//
        is(MLOAD){
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
        is(MREAD){
          memReadDecoder.io.PEs := matrixRow.asUInt()
          weightRdAddrNode := matrixCol.asUInt()
          memReadDecoder.io.enable := true.B
          instructionDone  := true.B
          for(pe <- 0 until(nWeightBanks)){
            readSignalBus(pe) := memReadDecoder.io.activatedSignals(pe)
          }
          rdDataMatrixValid.io.signal2delay := true.B
        }
        // ======================LOAD INPUT ACTIVATION INTO THE VECTOR =====================//
        is(VLOAD){
          oneHotDecoder.io.enable := true.B
          oneHotDecoder.io.memRow := colVector.asUInt()
          instructionDone := true.B
          for(colVector <- 0 until(nWeightBanks)){
            inputVectorMem(colVector).io.wrEna := oneHotDecoder.io.writeSignal(colVector)
            inputVectorMem(colVector).io.writeAddr := rowVector.asUInt()
            inputVectorMem(colVector).io.wrData := activation.asSInt()
          }
        }
        is(VREAD){
          memReadDecoder.io.enable := true.B
          memReadDecoder.io.PEs := colVector.asUInt()
          for(colVector <- 0 until(nWeightBanks)){
            inputVectorMem(colVector).io.rdEna := memReadDecoder.io.activatedSignals(colVector)
            inputVectorMem(colVector).io.readAddr := rowVector.asUInt()
          }
          instructionDone := true.B
          rdDataVecValid.io.signal2delay := true.B
        }
      }
    }
    // ======================READ WEIGHTS FROM THE MATRIX MEMORY =====================//
  }
  // ============================= Connect IO ===============================//
  io.ready := instructionDone
  io.dataValid := (rdDataMatrixValid.io.delayedSignal || rdDataVecValid.io.delayedSignal)
}