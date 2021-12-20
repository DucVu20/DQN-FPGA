package dnn
import chisel3._

object ISA{
  val MMV = 0 // matrix multiply vector
  val VMM = 1 // vector multiply matrix, used for transpose matrix multiplication
  val MSM = 2 // matrix subtract matrix
  val MAM = 3 // matrix add matrix
  val MMS = 3 // matrix multiply scala
  val VLD = 4 // vector load
  val VSTR = 5 // vector store
  val EWVM = 6 // element-wise vector multiplication
  val MLD = 7 // matrix load
  val MSTR = 8 // matrix store
}

