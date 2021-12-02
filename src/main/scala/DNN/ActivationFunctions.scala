package dnn
import chisel3._
import chisel3.util._
import chisel3.experimental.{FixedPoint => FP}

object Activation{
  val NONE  = 0.U
  val RELU  = 1.U
  val RELU6 = 2.U
}

import Activation._
class ActivationFunc(dataWidth: Int, fractionWidth: Int) extends Module{
  val io = IO(new Bundle{
    val activationType = Input(UInt(2.W))
    val in = Input(FP(dataWidth.W, fractionWidth.BP))
    val out = Output(FP(dataWidth.W, fractionWidth.BP))
  })
  when(io.activationType === NONE){
    io.out := io.in
  }.elsewhen(io.activationType === RELU){
    io.out := Mux(io.in(io.in.getWidth-1).asBool(), 0.F(fractionWidth.BP), io.in)
  }.otherwise{ // RELU6
    io.out := Mux(io.in(io.in.getWidth-1).asBool(), 0.F(fractionWidth.BP), Mux(io.in >= 6.F(fractionWidth.BP), 6.F(fractionWidth.BP), io.in))
  }
}
