package dnn
import chisel3._
import chisel3.util._

//////////////////////////////////////////////////////////////////////////////////////////////////
// The PEArray contains multiple processing elements (PEs) to perform various operations needed //
// for DNN processing, including MMV, VMM, MMS, MAM, MSB, VLOAD, VSTORE.                        //
//             Designed and written in ChiselHDL by Vu D. Le                                    //
//                               at ITI-VNU                                                     //
//                             date: Dec 2021                                                   //
//////////////////////////////////////////////////////////////////////////////////////////////////

class PEArray(nPEs: Int, WeightMemDepth: Int, PEOutMemDepth: Int,
              InputVectorDepth: Int, dataWidth: Int, binaryPoint: Int ) extends Module{
  val io = IO(new Bundle{
    val instruction = Input(UInt(32.W))
    val start       = Input(Bool()) // start instruction
    val done        = Output(Bool()) // instruction done
    val dataIn      = Input(UInt(16.W)) // data bus for random number, write
                                        // into the matrix buffer
  })

  val weightBanks    = Vec(nPEs, DualPortedMem(SInt(dataWidth.W), bufferDepth))
  val PECore         = Vec(nPEs, PE(dataWidth, binaryPoint))
  val PEOutMem       = Vec(nPEs, DualPortedMem(SInt(dataWidth.W), PEOutMemDepth)) // used for holding temp, z1, a1, ..
  val InputVectorMem = DualPortedMem(SInt(dataWidth.W), InputVectorDepth)

  val memWriteDecoder     = EnableSignalDecoder(nPEs) // this decoder is used for decoding the number of consecutive
                                                      // memory banks to be read out or to be written to. Since
                                                      //  write and read of all banks share the same bus
  val memReadDecoder      = EnableSignalDecoder(nPEs)
  // define the interface for the weight banks
  val WeightRdAddrNode = WireInit(UInt(log2Ceil(WeightMemDepth).W))
  val WeightWrAddrNode = WireInit(UInt(log2Ceil(WeightMemDepth).W))
  val WeightWrDataBus  = Vec(nPEs, WireInit(SInt(dataWidth.W)))

  // Extract fields from the instruction register
  val instructionRegister = RegInit(0.U((io.instruction.getWidth).W))
  val opcode   = instructionRegister(31, 28) // instruction fiel
  val MinAddr  = instructionRegister(27, 26)
  val VinAddr  = instructionRegister(25, 23)
  val VoutAddr = instructionRegister(22, 21)
  val VinSize  = instructionRegister(20, 18)
  val VoutSize = instructionRegister(18, 22)

  val colCounter = RegInit(UInt(log2Ceil(bufferDepth)).W)

  val idle::MMV::MAM::VLOAD:VSTORE:MSM:VMS::Nil = Enum(10)
  val PEArrayController = RegInit(idle)

  // connect the PEs with the memory and mem banks with the read and write decoder
  for(PE <- 0 until(nPEs)){
    // connect weight banks with the PEs
    weightBanks(PE).io.wrEna     := memWriteDecoder.io.activatedSignals
    weightBanks(PE).io.rdEna     := memReadDecoder.io.activatedSignals
    PECore(PE).io.weight         := weightBanks(PE).io.rdData
    weightBanks(PE).io.wrData    := WeightWrDataBus(PE)
    weightBanks(PE).io.writeAddr := WeightWrAddrNode

    // connect the vector memory to the PEs
    PECore(PE).io.inputAct := InputVectorMem.io.rdData

  }

  // PEArray Controller
  switch(PEArrayController){
    is(idle){
      when(io.start){
        when(opcode === MMV){
          PEArrayController := MMV
        }
      }
    }
    is(MMV){

    }

  }
}
