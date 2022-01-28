package sislab.dnn

import chisel3._
import chisel3.util._

class Divisor(bitWidth :Int) extends Module{
  val io = IO(new Bundle{
    val dividend  = Input(UInt(bitWidth.W))
    val divisor   = Input(UInt(bitWidth.W))
    val quotient  = Output(UInt(bitWidth.W))
    val remainder = Output(UInt(bitWidth.W))
    val start     = Input(Bool())
    val done      = Output(Bool())
  })
  val divisor     = RegInit(0.U(bitWidth.W))
  val remainder   = Reg(UInt((2*bitWidth).W))
  val remainderHI = remainder(2*bitWidth - 1, bitWidth)
  val remainderLO = remainder(bitWidth - 1, 0)
  val counter     = RegInit(0.U(log2Ceil(bitWidth + 1).W)) // + 1 to add enough bit to span to 2^bitWidth + 1
  val done        = RegInit(false.B)

  val idle::shiftRemainderReg::subtract::testRemainder::lsbTo0::checkIteration::Nil = Enum(6)
  val controlUnit = RegInit(idle)

  switch(controlUnit){
    is(idle){
      when(io.start){
        controlUnit := shiftRemainderReg
        done        := false.B
        divisor     := io.divisor
        remainder   := Cat(0.U, io.dividend)
        counter     := 0.U
      }
    }
    is(shiftRemainderReg){
      controlUnit := subtract
      remainder   := remainder << 1
    }
    is(subtract){
      remainder   := Cat(remainderHI - divisor, remainderLO)
      counter     := counter + 1.U
      controlUnit := testRemainder
    }
    is(testRemainder){
      when(remainderHI(bitWidth - 1).asBool()){ // if remainderHI < 0
        remainder   := Cat(divisor + remainderHI, remainderLO)
        controlUnit := lsbTo0
      }.otherwise{
        val temp = remainder << 1
        remainder   := Cat(temp(2*bitWidth - 1, 1), 1.U)
        controlUnit := checkIteration
      }
    }
    is(lsbTo0){
      val temp = remainder << 1
      remainder   := Cat(temp(2*bitWidth - 1, 1), 0.U)
      controlUnit := checkIteration
    }
    is(checkIteration){
      when(counter === bitWidth.U){
        remainder   := Cat(remainderHI >> 1, remainderLO)
        done        := true.B
        controlUnit := idle
      }.otherwise{
        controlUnit := subtract
      }
    }
  }
  io.quotient  := remainderLO
  io.remainder := remainderHI
  io.done      := done
}
