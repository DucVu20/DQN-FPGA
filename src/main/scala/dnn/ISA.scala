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
  val VAV    = 1 // vector add vector, can be omitted
  val CMP    = 2
  val ACT    = 3 // activation
  val ACTION = 4
  val INFER  = 5 // inference
}

object mfunc {
  val MMVC = 0 // matrix multiply vector configuration
  val MLOAD = 1 // load matrix
  val MREAD = 2 // read a matrix from the matrix memory
  val VLOAD = 3
  val VREAD = 4
  val SLOAD = 5 // load state to the mem bank in paralell
}
