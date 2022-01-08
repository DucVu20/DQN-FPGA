package dnn
import chisel3._

object mfunc{
  val MMVC = 0 // matrix multiply vector configuration
  val MLOAD = 1 // load matrix
  val MREAD = 2 // read a matrix from the matrix memory
  val VLOAD = 3
  val VREAD = 4
}

object opcode{
  val dataProcessing = 0
  val memoryInstruction = 1
  val branching = 2
}

object dfunc{
  val MMV = 0 // matrix multiply vector
  val CMP = 1
  val RELU = 2
  val LINEAR = 3
}
