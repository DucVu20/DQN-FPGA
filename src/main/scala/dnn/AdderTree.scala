package dnn
import chisel3._
import chisel3.util._
import scala.math._

// This AdderTree is designed to add the number of inputs that is the power of 2. Ex: 8, 16, 32
class AdderTree(nInputs: Int, width: Int) extends Module{
  val io = IO(new Bundle{
    val in = Input(Vec(nInputs, SInt(width.W)))
    val sum = Output(SInt(width.W))
    val sumValid = Output(Bool())
    val cal = Input(Bool())
  })

  val numberOfLayer = log2Ceil(nInputs)
//  val registerArray = Array.ofDim[](numberOfLayer, numberOfLayer)
//  for(layer <- 0 until(numberOfLayer)){
//    for(idx <- 0 until(nInputs/pow(2, layer + 1).toInt)){
//      registerArray(layer)(idx) = Reg(dataType)
//    }
//  }
//
//  for(layer <- 0 until(numberOfLayer)){
//    if (layer == 0){
//      for(index <- 0 until(nInputs/pow(2, layer + 1).toInt)){
//        registerArray(layer)(index) := (io.in(index) + io.in(index -1)).asTypeOf(dataType)
//      }
//    }
//    else{
//      for(index <- 0 until(nInputs/pow(2, layer + 1).toInt)){
//        registerArray(layer)(index) := registerArray(layer - 1)(index)
//      }
//    }
//  }
//  io.sum := registerArray(numberOfLayer)(0)

  // This code is used for an adder of 32 inputs
  val registerArray0 = Reg(Vec(16, SInt(width.W)))
  val registerArray1 = Reg(Vec(8, SInt(width.W)))
  val registerArray2 = Reg(Vec(4, SInt(width.W)))
  val registerArray3 = Reg(Vec(2, SInt(width.W)))
  val sumRegister = Reg(SInt(16.W))

  for(idx <- 0 until(nInputs) by 2){
    registerArray0(idx/2) := io.in(idx) + io.in(idx + 1)
  }

  for(idx <- 0 until(16) by 2){
    registerArray1(idx/2) := registerArray0(idx) + registerArray0(idx+1)
  }
  for(idx <- 0 until(8) by 2){
    registerArray2(idx/2) := registerArray1(idx) + registerArray1(idx+1)
  }
  for(idx <- 0 until(4) by 2){
    registerArray3(idx/2) := registerArray2(idx) + registerArray2(idx+1)
  }
  sumRegister := registerArray3(0) + registerArray3(1)

  io.sumValid := RegNext(RegNext(RegNext(RegNext(RegNext(io.cal)))))
  io.sum := sumRegister
}

object AdderTree{
  def apply(nInputs: Int, width: Int): AdderTree = Module(new AdderTree(nInputs, width))
}