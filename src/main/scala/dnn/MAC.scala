package dnn

import chisel3._
import chisel3.util._
import chiseltest._
import chisel3.experimental.{FixedPoint => FP}
import org.scalatest._
import chisel3.internal.firrtl.KnownBinaryPoint

class MAC(inputs: Int, width: Int, binaryPoint: Int) extends Module {

  val io = IO(new Bundle {
    val in      = Input(Vec(inputs, FP(width.W, binaryPoint.BP)))
    val weights = Input(Vec(inputs, FP(width.W, binaryPoint.BP)))
    val out     = Output(FP(width.W, binaryPoint.BP))
    val cal = Input(Bool())
  })
  val mac = io.in.zip(io.weights).map{ case(a:FP, b:FP) => a*b}.reduce(_+_)
  val macReg = RegInit(0.F(width.W, binaryPoint.BP))

  when(io.cal){
    macReg := mac
  }
  io.out := macReg
}
object MAC{
  def apply(inputs: Int, width: Int, binaryPoint: Int): MAC = Module(new MAC(inputs, width, binaryPoint))
}
