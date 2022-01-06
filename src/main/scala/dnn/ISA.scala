package dnn
import chisel3._

object mfunc{
  val MMVC = 0.U // matrix multiply vector configuration
  val MREAD = 1.U // read a matrix from the matrix memory
  val MLOAD = 2.U // load matrix
  val VLOAD = 3.U
  val VREAD = 4.U
}

object opcode{
  val dataProcessing = 0.U
  val memoryInstruction = 1.U
  val branching = 2.U
}

object dfunc{
  val MMV = 0.U // matrix multiply vector
  val CMP = 1.U
  val RELU = 2.U
  val LINEAR = 3.U
}
