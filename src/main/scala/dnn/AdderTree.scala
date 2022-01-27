package dnn
import chisel3._
import chisel3.util._
import scala.math._

class AdderTree(nInputs: Int = 32, width: Int) extends Module{
  val io = IO(new Bundle{
    val in = Input(Vec(nInputs, SInt(width.W)))
    val sum = Output(SInt(width.W))
    val sumValid = Output(Bool())
    val cal = Input(Bool())
  })

  val registerArray0 = Wire(Vec(16, SInt(width.W)))
  val registerArray1 = Wire(Vec(8, SInt(width.W)))
  val registerArray2 = Reg(Vec(4, SInt(width.W)))
  val registerArray3 = Wire(Vec(2, SInt(width.W)))
  val sumRegister    = Wire(SInt(width.W))

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

  io.sumValid := RegNext(io.cal)
  io.sum      := sumRegister
}

object AdderTree{
  def apply(nInputs: Int, width: Int): AdderTree = Module(new AdderTree(nInputs, width))
}
