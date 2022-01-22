package dnn
import chisel3._

object opcode{
  val dataProcessing    = 0
  val memoryInstruction = 1
  val branching         = 2
  val nop               = 3
}

object dfunc{
  val MMV    = 0 // matrix multiply vector
  val ACT    = 1 // activation
  val ACTION = 2
  val INFER  = 3 // inference
}

object mfunc {
  val MMVC =  0 // matrix multiply vector configuration
  val MLOAD = 1 // load matrix
  val VLOAD = 2
  val SLOAD = 3 // load state to the mem bank in paralell
  val VREAD = 4 // used in dev
  val MREAD = 5 // used in dev
}
