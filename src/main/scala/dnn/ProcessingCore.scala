package dnn                                                                                                            
import chisel3._                                                                                                       
import chisel3.util._                                                                                                  
import mfunc._
import dfunc._
import opcode._

//////////////////////////////////////////////////////////////////////////////////////////////////
// The PEArray contains multiple processing elements (PEs) to perform various operations needed //
//             Designed and written in ChiselHDL by Vu D. Le                                    //
//                               at ITI-VNU                                                     //
//                             date: Dec 2021                                                   //
//////////////////////////////////////////////////////////////////////////////////////////////////

class ProcessingCore(nWeightBanks: Int, sratchPadMemDepth: Int, nRowVector: Int,
                         dataWidth: Int, binaryPoint: Int ) extends Module{
  val io = IO(new Bundle{
    val instruction = Input(UInt(32.W))
    val valid       = Input(Bool()) // start instruction
    val ready       = Output(Bool()) // instruction done
    val dataValid   = Output(Bool())
    val dataOut     = Vec(nWeightBanks, Output(SInt(dataWidth.W))) // this should be optional
    val weightedSum = Output(SInt(dataWidth.W))
    val weightedSumValid = Output(Bool())
  })

  val weightBanks    = Array.fill(nWeightBanks){ DualPortedMem(SInt(dataWidth.W), sratchPadMemDepth)}
  val inputVectorMem = Array.fill(nWeightBanks){ DualPortedMem(SInt(dataWidth.W), nRowVector)}

  //  define the interface for the weight banks
  val rdDataMatrixValid = DelayBoolNCycles(0)
  val rdDataVecValid    = DelayBoolNCycles(0)
  val weightRdAddrNode  = WireInit(0.U(log2Ceil(sratchPadMemDepth).W))
  val weightWrAddrNode  = WireInit(0.U(log2Ceil(sratchPadMemDepth).W))
  val weightWrDataBus   = Array.fill(nWeightBanks){WireInit(0.S(dataWidth.W))}
  val writeSignalBus    = Array.fill(nWeightBanks){WireInit(false.B)}
  val readSignalBus     = Array.fill(nWeightBanks){WireInit(false.B)}

  // define counter for the matrix memory
  val colBanksCounter = RegInit(0.U(13.W)) // count which row of a matrix is read out
  val matrixRowCounter = RegInit(0.U(13.W)) // count which row of a matrix has been MACed
  val VinSizeReg = RegInit(0.U(14.W))
  val VoutSizeReg = RegInit(0.U(13.W))

  val oneHotDecoder  = OneHotEncoder(nWeightBanks)
  val memReadDecoder = EnableSignalDecoder(nWeightBanks)

  val adderTree      = AdderTree((nWeightBanks).toInt, 2*dataWidth)
  val mulResults = Reg(Vec(nWeightBanks, SInt((dataWidth*2).W)))
  val quantizedSum = adderTree.io.sum(dataWidth + binaryPoint, binaryPoint).asSInt()

  // ******************** DEFAULT VALUES FOR ALL **********************//
  rdDataVecValid.io.signal2delay    := false.B
  rdDataMatrixValid.io.signal2delay := false.B
  oneHotDecoder.io.enable           := false.B
  memReadDecoder.io.enable          := false.B
  oneHotDecoder.io.memRow           := 0.U
  memReadDecoder.io.PEs             := 0.U
  // default connections
  adderTree.io.cal := RegNext(rdDataMatrixValid.io.delayedSignal) // delay by 1 cycle because
                                                                  // of 1 cycle delay in the multiplier
  // Connect the memory bank interface with the memory bank
  for(pe <- 0 until(nWeightBanks)){
    weightBanks(pe).io.wrData    := weightWrDataBus(pe)
    weightBanks(pe).io.writeAddr := weightWrAddrNode
    weightBanks(pe).io.readAddr  := weightRdAddrNode
    weightBanks(pe).io.rdEna     := readSignalBus(pe)
    weightBanks(pe).io.wrEna     := writeSignalBus(pe)
    readSignalBus(pe)            := false.B // by default don't read

    inputVectorMem(pe).io.writeAddr := 0.U
    inputVectorMem(pe).io.readAddr  := 0.U
    inputVectorMem(pe).io.rdEna     := false.B
    inputVectorMem(pe).io.wrEna     := false.B
    inputVectorMem(pe).io.wrData    := 0.S

    // Connect multipliers with the matrix and vector memory bank, and adder tree
    mulResults(pe) := weightBanks(pe).io.rdData * inputVectorMem(pe).io.rdData
    adderTree.io.in(pe) := mulResults(pe)

    when(rdDataVecValid.io.delayedSignal){
      io.dataOut(pe) := inputVectorMem(pe).io.rdData
    }.elsewhen(rdDataMatrixValid.io.delayedSignal){
      io.dataOut(pe) := weightBanks(pe).io.rdData
    }.otherwise{
      io.dataOut(pe) := 0.S
    }
  }
  // ******************** DEFAULT VALUES FOR ALL **********************//

  // Extract fields from the instruction register
  val instructionRegister = RegInit(0.U((io.instruction.getWidth).W))
  val op          = instructionRegister(31, 30).asUInt()
  val func        = instructionRegister(29, 27).asUInt()
  val cond        = instructionRegister(26, 24).asUInt()

                   //**** Memory Instruction ****//
  // MLOAD
  val matrixCol   = instructionRegister(26, 22).asUInt()
  val matrixRow   = instructionRegister(21, 12).asUInt()
  val weightValue = instructionRegister(11, 0).asSInt() // 13 bit weights
  // VLOAD
  val rowVector   = instructionRegister(26, 22).asUInt()
  val colVector   = instructionRegister(21, 12).asUInt()
  val activation  = instructionRegister(11, 0).asSInt()
  // MMVC
  val VinSize     = instructionRegister(26, 13) // col of a matrix
  val VoutSize    = instructionRegister(12, 0) // row of a matrix

              //**** Data Processing Instruction ****//
  //  MMV
  val MinAddr  = instructionRegister(23, 12).asUInt()
  val VinAddr  = instructionRegister(11, 7).asUInt()
  val VoutAddr = instructionRegister(6, 0).asUInt() // VoutAddr specifies the row address of the vector mem

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
    when(func === MMV.U){
      colBanksCounter := 0.U
      matrixRowCounter := 0.U
    }
  }

  //========================= Data Path ==================================//
  when(Controller === executing){
    // ***** Memory Instruction ***** //
    when(op === memoryInstruction.asUInt()){
      switch(func){
        // ================ LOAD A MATRIX INTO THE MEMORY ===================//
        is(MMVC.U){
          VinSizeReg  := VinSize.asUInt()
          VoutSizeReg := VoutSize.asUInt()
          instructionDone := true.B
        }
        // ======================READ WEIGHTS FROM THE MATRIX MEMORY =====================//
        is(MLOAD.U){
          oneHotDecoder.io.enable := true.B
          oneHotDecoder.io.memRow := matrixCol.asUInt()
          weightWrAddrNode        := matrixRow.asUInt()
          instructionDone         := true.B
          for(pe <- 0 until(nWeightBanks)){
            weightWrDataBus(pe) := weightValue.asSInt()
            writeSignalBus(pe)  := oneHotDecoder.io.writeSignal(pe)
          }
        }
        is(MREAD.U){
          memReadDecoder.io.PEs    := matrixCol.asUInt()
          weightRdAddrNode         := matrixRow.asUInt()
          memReadDecoder.io.enable := true.B
          instructionDone          := true.B
          rdDataMatrixValid.io.signal2delay := true.B
          for(pe <- 0 until(nWeightBanks)){
            readSignalBus(pe) := memReadDecoder.io.activatedSignals(pe)
          }
        }

        // ======================LOAD INPUT ACTIVATION INTO THE VECTOR =====================//
        is(VLOAD.U){
          oneHotDecoder.io.enable := true.B
          oneHotDecoder.io.memRow := rowVector.asUInt()
          instructionDone := true.B
          for(col <- 0 until(nWeightBanks)){
            inputVectorMem(col).io.wrEna     := oneHotDecoder.io.writeSignal(col)
            inputVectorMem(col).io.writeAddr := colVector.asUInt()
            inputVectorMem(col).io.wrData    := activation.asSInt()
          }
        }
        // ======================READ INPUT ACTIVATION INTO THE VECTOR =====================//
        is(VREAD.U){
          memReadDecoder.io.enable := true.B
          memReadDecoder.io.PEs    := rowVector.asUInt()
          for(col <- 0 until(nWeightBanks)){
            inputVectorMem(col).io.rdEna    := memReadDecoder.io.activatedSignals(col)
            inputVectorMem(col).io.readAddr := colVector.asUInt()
          }
          rdDataVecValid.io.signal2delay := true.B
          instructionDone                := true.B
        }
      }
      // ***** Data Processing Instruction ***** //
    }.elsewhen(op === dataProcessing.U){
      switch(func){
        // Matrix multiply vector and write the result back to the vector memory
        // For a matrix that fits perfectly into the matrix memory bank, VinSize is connected
        // to the memReadDecoder to read multiple elements in a column of a matrix, or multiple
        // bank rows.
        is(MMV.U){
          memReadDecoder.io.PEs := VinSizeReg // the column size of a matrix
          oneHotDecoder.io.memRow := matrixRowCounter
          when(adderTree.io.sumValid){
            matrixRowCounter := matrixRowCounter + 1.U
            oneHotDecoder.io.enable := true.B
          }
          when((colBanksCounter === VoutSizeReg)){
            when(matrixRowCounter === VoutSizeReg){
              instructionDone := true.B
            }
          }.otherwise{
            rdDataMatrixValid.io.signal2delay := true.B
            memReadDecoder.io.enable := true.B
            colBanksCounter := colBanksCounter + 1.U
          }
          for(idx <- 0 until(nWeightBanks)){
            weightBanks(idx).io.readAddr := (MinAddr + colBanksCounter)
            weightBanks(idx).io.rdEna := memReadDecoder.io.activatedSignals(idx)
            inputVectorMem(idx).io.rdEna := memReadDecoder.io.activatedSignals(idx)
            inputVectorMem(idx).io.readAddr := VinAddr
            inputVectorMem(idx).io.wrData := quantizedSum.asSInt()
            inputVectorMem(idx).io.writeAddr := VoutAddr // the row of the vector mem
            inputVectorMem(idx).io.wrEna := oneHotDecoder.io.writeSignal(idx)
          }
        }
      }
    }
    // ======================READ WEIGHTS FROM THE MATRIX MEMORY =====================//
  }
  // ============================= Connect IO ===============================//
  // testing
  io.weightedSumValid := adderTree.io.sumValid
  io.weightedSum := quantizedSum
  io.ready := instructionDone
  io.dataValid := (rdDataMatrixValid.io.delayedSignal || rdDataVecValid.io.delayedSignal)
}