package dnn
import chisel3._
import chisel3.util._
import chisel3.experimental.{FixedPoint => FP}

object Activation{
  val LINEAR = 0.U
  val RELU   = 1.U
  val RELU6  = 2.U
}

import Activation._
class ActivationFunc(dataWidth: Int, fractionWidth: Int) extends Module{
  val io = IO(new Bundle{
    val activationFunc  = Input(UInt(2.W))
    val in              = Input(SInt(dataWidth.W))
    val activation      = Output(SInt(dataWidth.W))
    val valid = Output(Bool())
  })
  when(io.activationFunc === LINEAR){
    io.activation      := io.in
    io.valid := true.B
  }.elsewhen(io.activationFunc === RELU){
    io.activation      := Mux(io.in(io.in.getWidth-1).asBool(), 0.S, io.in)
    io.valid := true.B
  }.otherwise{ // RELU6
    io.activation      := Mux(io.in(io.in.getWidth-1).asBool(), 0.S, Mux(io.in >= 6.S, 6.S, io.in))
    io.valid := true.B    
  }
}

object ActivationFunc{
  def apply(dataWidth: Int, fractionWidth: Int): ActivationFunc =
    Module(new ActivationFunc(dataWidth, fractionWidth))
}
