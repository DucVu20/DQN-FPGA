package dnn
import chisel3._
import chisel3.util._
import mfunc._
import dfunc._
import opcode._
import chisel3.stage.ChiselStage

//////////////////////////////////////////////////////////////////////////////////////////////////
//   The ProcessingCore is basically a matrix vector, vector vector operations accelerator. It  //
// contains an adderTree, a matrix memory banks and a vector memory bank for fast matrix vector //
//     multiplication, vector add vector operation. The architecture of this core is located    //
//         in ISA.pdf. The ISA also features the ReLU, LINEAR activation, MAX operation.        //
//                          Matrix Vector Multiplication - DSP Version                          //
//                         Designed and written in ChiselHDL by Vu D. Le                        //
//                                at ITI-VNU and SISLAB-UET-VNU,                                //
//                                           Dec 2021                                           //
//////////////////////////////////////////////////////////////////////////////////////////////////

class ProcessingCore(nWeightBanks: Int, sratchPadMemDepth: Int, activationMemDepth: Int,
                         dataWidth: Int, binaryPoint: Int, dev: Boolean ) extends Module{
  val io = IO(new Bundle{
    val instruction      = Input(UInt(32.W))
    val instructionValid = Input(Bool()) // start instruction
    val state            = Input(UInt(6.W))
    val terminate        = Input(Bool())

    val ready            = Output(Bool()) // instruction done
    val jumpIP           = Output(Bool()) // jump instruction pointer
    val IPAddress        = Output(UInt(10.W))
    val increaseIP       = Output(Bool())

    val action           = Output(UInt(2.W))
    val actionValid      = Output(Bool())

    val dataValid        = if(dev) Some(Output(Bool())) else None
    val dataOut          = if(dev) Some(Vec(nWeightBanks, Output(SInt(dataWidth.W)))) else None
    val weightedSum      = if(dev) Some(Output(SInt(dataWidth.W))) else None
    val weightedSumValid = if(dev) Some(Output(Bool())) else None
    // these optional signals are used for debugging, and should be omitted when prototype on FPGA
  })

  val instructionRegister = RegInit(0.U((io.instruction.getWidth).W))
  val weightBanks         = Array.fill(nWeightBanks){ DualPortedMem(SInt(dataWidth.W), sratchPadMemDepth)}
  val activationMemBank   = Array.fill(nWeightBanks){ DualPortedMem(SInt(dataWidth.W), activationMemDepth)}

  // functional blocks
  val activationBlock = ActivationBlock(dataWidth, nWeightBanks)
  val oneHotDecoder   = OneHotEncoder(nWeightBanks)
  val memReadDecoder  = EnableSignalDecoder(nWeightBanks)
  val adderTree       = AdderTree((nWeightBanks).toInt, 2*dataWidth)
  val mulResults      = Reg(Vec(nWeightBanks, SInt((dataWidth*2).W)))
  val quantizedSum    = adderTree.io.sum(dataWidth + binaryPoint, binaryPoint).asSInt()
  val actionBlock     = Module(new Max4(dataWidth)) // return the best action and its max Q value

//  val VAVResult      = Array.fill(32){WireInit(0.U(8.W))} // vector vector result

  //  define the interface for the weight banks
  val rdDataMatrixValid = DelayBoolNCycles(0)
  val rdDataVecValid    = DelayBoolNCycles(0)
  val weightRdAddrNode  = WireInit(0.U(log2Ceil(sratchPadMemDepth).W))
  val weightWrAddrNode  = WireInit(0.U(log2Ceil(sratchPadMemDepth).W))
  val weightWrDataBus   = Array.fill(nWeightBanks){WireInit(0.S(dataWidth.W))}
  val writeSignalBus    = Array.fill(nWeightBanks){WireInit(false.B)}
  val readSignalBus     = Array.fill(nWeightBanks){WireInit(false.B)}
  val rdWrEnaFlip       = RegInit(false.B)

  val increaseIP        = WireInit(false.B)
  val jumpIP            = WireInit(false.B)
  val IPAddress         = WireInit(0.U(10.W))


  // define counter for the matrix memory
  val colBanksCounter  = RegInit(0.U(13.W)) // count which row of a matrix is read out
  val matrixRowCounter = RegInit(0.U(13.W)) // count which row of a matrix has been MACed
  val VinSizeReg       = RegInit(0.U(14.W))
  val VoutSizeReg      = RegInit(0.U(13.W))

  // ******************** DEFAULT VALUES FOR ALL **********************//
  rdDataVecValid.io.signal2delay    := false.B
  rdDataMatrixValid.io.signal2delay := false.B
  oneHotDecoder.io.enable           := false.B
  memReadDecoder.io.enable          := false.B
  oneHotDecoder.io.memRow           := 0.U
  memReadDecoder.io.PEs             := 0.U
  activationBlock.io.ena            := false.B
  activationBlock.io.activationFunc := instructionRegister(26, 25).asUInt()

  // default connections
  adderTree.io.cal := RegNext(rdDataMatrixValid.io.delayedSignal) // delay by 1 cycle because
                                                                  // of 1 cycle delay in the multiplier
  (actionBlock.io.in, activationMemBank).zipped.foreach((in, mem) => {in := mem.io.rdData})

  // Connect the memory bank interface with the memory bank
  for(pe <- 0 until nWeightBanks){
    weightBanks(pe).io.wrData    := weightWrDataBus(pe)
    weightBanks(pe).io.writeAddr := weightWrAddrNode
    weightBanks(pe).io.readAddr  := weightRdAddrNode
    weightBanks(pe).io.rdEna     := readSignalBus(pe)
    weightBanks(pe).io.wrEna     := writeSignalBus(pe)
    readSignalBus(pe)            := false.B // by default don't read

    activationMemBank(pe).io.writeAddr := 0.U
    activationMemBank(pe).io.readAddr  := 0.U
    activationMemBank(pe).io.rdEna     := false.B
    activationMemBank(pe).io.wrEna     := false.B
    activationMemBank(pe).io.wrData    := 0.S
    activationBlock.io.weightedSum(pe) := activationMemBank(pe).io.rdData

    // Connect multipliers with the matrix and vector memory bank, and adder tree
    mulResults(pe)      := weightBanks(pe).io.rdData * activationMemBank(pe).io.rdData
    adderTree.io.in(pe) := mulResults(pe)

    if(dev){
      when(rdDataVecValid.io.delayedSignal){
        io.dataOut.get(pe) := activationMemBank(pe).io.rdData
      }.elsewhen(rdDataMatrixValid.io.delayedSignal){
        io.dataOut.get(pe) := weightBanks(pe).io.rdData
      }.otherwise{
        io.dataOut.get(pe) := 0.S
      }
    }
  }

  // ******************** Extract fields from instruction register **********************//

  val op   = instructionRegister(31, 30).asUInt()
  val func = instructionRegister(29, 27).asUInt()
  val cond = instructionRegister(26, 24).asUInt()

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

//  val VabAddr = instructionRegister(16, 12) // the address of the result of A.B in the memory register
//  val VbAddr  = instructionRegister(11, 7)  // allocate 5 bits for the bias, stored in the matrix memory
//                                             // The first 32 col in the matrix memory should be preserved for
//                                             // vector B
  // Activation
  val activationType = instructionRegister(26, 24).asUInt()
  val vinAddr        = instructionRegister(24, 15).asUInt()
  val vinSize        = instructionRegister(14, 10).asUInt()

  //======================= PEArray Controller =========================//
  val idle::fetch::decode::executing::Nil = Enum(4)
  val Controller      = RegInit(idle)
  val instructionDone = WireInit(false.B)

  // FMS control loop
  switch(Controller){
    is(idle){
      instructionDone   := true.B
      when(io.instructionValid){
        Controller      := fetch
      }
    }
    is(fetch){
      Controller        := decode
      instructionDone   := false.B
    }
    is(decode){
      Controller        := executing
      instructionDone   := false.B
      when(op === nop.U){
        increaseIP      := false.B
      }.otherwise{
        increaseIP      := true.B
      }
    }
    is(executing){
      when(instructionDone){
        when(io.instructionValid){
          Controller    := fetch
        }.otherwise{
          Controller    := idle
        }
      }
    }
  }

  when(Controller === fetch){
    instructionRegister := io.instruction
  }
  when(Controller === decode){
    when(func === MMV.U){
      colBanksCounter   := 0.U
      matrixRowCounter  := 0.U
    }
  }

  //========================= Data Path ==================================//
  when(Controller === executing){
    // ***** Memory Instruction ***** //
    when(op === memoryInstruction.asUInt()){
      switch(func){
        // ================ LOAD A MATRIX INTO THE MEMORY ===================//
        is(MMVC.U){
          VinSizeReg      := VinSize.asUInt()
          VoutSizeReg     := VoutSize.asUInt()
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
        // ======================LOAD INPUT ACTIVATION INTO THE VECTOR =====================//
        is(SLOAD.U){
          // the onehotdecoder will be used as as a decoder to decode the current state of the agent
          // to one hot input for the neural network. Thus the I/O may not sound apparent.
          memReadDecoder.io.enable := true.B
          memReadDecoder.io.PEs    := io.state
          oneHotDecoder.io.enable  := true.B
          oneHotDecoder.io.memRow  := io.state
          for(idx <- 0 until(nWeightBanks)){
            activationMemBank(idx).io.wrEna     := memReadDecoder.io.activatedSignals(idx)
            activationMemBank(idx).io.writeAddr := instructionRegister(21, 12).asUInt()
            activationMemBank(idx).io.wrData    := (Cat(0.U, oneHotDecoder.io.writeSignal(idx).asUInt())<<binaryPoint).asSInt()
          }
          instructionDone := true.B
        }

        is(VLOAD.U){
          oneHotDecoder.io.enable := true.B
          oneHotDecoder.io.memRow := rowVector.asUInt()
          instructionDone := true.B
          for(col <- 0 until(nWeightBanks)){
            activationMemBank(col).io.wrEna     := oneHotDecoder.io.writeSignal(col)
            activationMemBank(col).io.writeAddr := colVector.asUInt()
            activationMemBank(col).io.wrData    := activation.asSInt()
          }
        }

        // ======================READ INPUT ACTIVATION FROM THE VECTOR MEMORY =====================//
        is( if(dev) Some(VREAD.U) else None){
          memReadDecoder.io.enable := true.B
          memReadDecoder.io.PEs    := rowVector.asUInt()
          for(col <- 0 until nWeightBanks){
            activationMemBank(col).io.rdEna    := memReadDecoder.io.activatedSignals(col)
            activationMemBank(col).io.readAddr := colVector.asUInt()
          }
          rdDataVecValid.io.signal2delay := true.B
          instructionDone                := true.B
        }
        is(if(dev) Some(MREAD.U) else None){
          memReadDecoder.io.PEs             := matrixCol.asUInt()
          weightRdAddrNode                  := matrixRow.asUInt()
          memReadDecoder.io.enable          := true.B
          instructionDone                   := true.B
          rdDataMatrixValid.io.signal2delay := true.B
          for(pe <- 0 until nWeightBanks){
            readSignalBus(pe) := memReadDecoder.io.activatedSignals(pe)
          }
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
          memReadDecoder.io.PEs     := VinSizeReg // the column size of a matrix
          oneHotDecoder.io.memRow   := matrixRowCounter
          when(adderTree.io.sumValid){
            matrixRowCounter        := matrixRowCounter + 1.U
            oneHotDecoder.io.enable := true.B
          }
          when((colBanksCounter === VoutSizeReg)){
            when(matrixRowCounter === VoutSizeReg){
              instructionDone := true.B
            }
          }.otherwise{
            rdDataMatrixValid.io.signal2delay := true.B
            memReadDecoder.io.enable          := true.B
            colBanksCounter                   := colBanksCounter + 1.U
          }

          for(idx <- 0 until nWeightBanks){
            weightBanks(idx).io.readAddr        := MinAddr + colBanksCounter
            weightBanks(idx).io.rdEna           := memReadDecoder.io.activatedSignals(idx)
            activationMemBank(idx).io.rdEna     := memReadDecoder.io.activatedSignals(idx)
            activationMemBank(idx).io.readAddr  := VinAddr
            activationMemBank(idx).io.wrData    := quantizedSum.asSInt()
            activationMemBank(idx).io.writeAddr := VoutAddr // the row of the vector mem
            activationMemBank(idx).io.wrEna     := oneHotDecoder.io.writeSignal(idx)
          }
        }
        is(ACT.U){
          rdWrEnaFlip              := (~rdWrEnaFlip)
          activationBlock.io.ena   := rdWrEnaFlip
          memReadDecoder.io.enable := true.B
          memReadDecoder.io.PEs    := vinSize

          for(idx <- 0 until nWeightBanks){
            when(rdWrEnaFlip){ 
              activationMemBank(idx).io.wrData    := activationBlock.io.activation(idx)
              activationMemBank(idx).io.wrEna     := memReadDecoder.io.activatedSignals(idx)
              activationMemBank(idx).io.writeAddr := vinAddr
              instructionDone := true.B
            }.otherwise{ // read vector mem
              activationMemBank(idx).io.rdEna    := memReadDecoder.io.activatedSignals(idx)
              activationMemBank(idx).io.readAddr := vinAddr
            }
          }
        }
        is(ACTION.U){
          instructionDone                := ~rdWrEnaFlip // 2 cycles
          rdDataVecValid.io.signal2delay := ~rdWrEnaFlip
          memReadDecoder.io.enable       := true.B
          memReadDecoder.io.PEs          := instructionRegister(16, 14).asUInt() // number of actions
          for(idx <- 0 until nWeightBanks){
            activationMemBank(idx).io.readAddr := instructionRegister(26, 17).asUInt()
            activationMemBank(idx).io.rdEna    := memReadDecoder.io.activatedSignals(idx)
          }
        }
        is(INFER.U){
          jumpIP := true.B
          when(io.terminate){
            IPAddress := instructionRegister(26, 17).asUInt()
          }.otherwise{
            IPAddress := instructionRegister(16, 7).asUInt()
          }
          instructionDone := true.B
        }
      }
    }.otherwise{
      instructionDone := true.B
    }
  }

  // ============================= Connect IO ===============================//
  io.jumpIP      := jumpIP
  io.increaseIP  := increaseIP
  io.IPAddress   := IPAddress
  io.action      := actionBlock.io.index
  io.actionValid := rdDataVecValid.io.delayedSignal
  io.ready       := instructionDone

  if(dev){
    io.weightedSumValid.get := adderTree.io.sumValid
    io.weightedSum.get      := quantizedSum
    io.dataValid.get        := (rdDataMatrixValid.io.delayedSignal || rdDataVecValid.io.delayedSignal)
  }
}

object ProcessingCoreGenerator extends App{
  new (ChiselStage).emitVerilog(new ProcessingCore(32, 128, 16,
    10, 7, false), Array("--target-dir","generated"))
}
// sbt "runMain dnn.processingCoreGenerator"
