package sislab.dnn

import chisel3._
import chisel3.util._
import scala.math._

class Timer(frequency: Int, maxSecond: Int) extends Module{

  val period = (math.pow(10,9)/(frequency*math.pow(10,6))) // ns
  val io=IO(new Bundle{
    val count = Input(Bool())
    val timeValue = Output(UInt(20.W))
    val timeUnit = Output(UInt(2.W))
  })
  // 4 possible time units are p, u, m, and s
  val counter = RegInit(frequency.U(log2Ceil(frequency)))
  val ns = RegInit(0.U(10.W))
  val us = RegInit(0.U(10.W))
  val ms = RegInit(0.U(10.W))
  val secs = RegInit(0.U(10.W))

  val nsOverflow =
  val overflowCounter = RegInit(0.U(10.W))
  val interrupt = WireInit(false.B)
  val overflow = WireInit(false.B)

  when(io.count){
    counter := counter - 1.U
    overflow := Mux(!(counter.orR), true.B, false.B)
  }

}