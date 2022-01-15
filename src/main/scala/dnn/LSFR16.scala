package dnn

import chisel3._
import chisel3.util._
import chisel3.util.random._

class ControllableLFSR10 extends Module{
  val io      = IO(new Bundle{
    val shift = Input(Bool())
    val rand  = Output(UInt(10.W))
  })
  val reg1  = RegInit(1.U(1.W))
  val reg2  = RegInit(0.U(1.W))
  val reg3  = RegInit(0.U(1.W))
  val reg4  = RegInit(0.U(1.W))
  val reg5  = RegInit(0.U(1.W))
  val reg6  = RegInit(0.U(1.W))
  val reg7  = RegInit(0.U(1.W))
  val reg8  = RegInit(0.U(1.W))
  val reg9  = RegInit(0.U(1.W))
  val reg10 = RegInit(0.U(1.W))

  when(io.shift){
    reg1  := reg7^reg10
    reg2  := reg1
    reg3  := reg2
    reg4  := reg3
    reg5  := reg4
    reg6  := reg5
    reg7  := reg6
    reg8  := reg7
    reg9  := reg8
    reg10 := reg9
  }
  val rand = Cat(reg10,reg9,reg8,reg7,reg6,reg5,reg4,reg3,reg2,reg1)
  io.rand := rand.asUInt()
}

     //////////////////////////////////////////////////////////////////
     // Linear Feedback Shift Register 16 bit version for generating //
     //     pseudorandom number generator. Chisel Implementation     //
     //////////////////////////////////////////////////////////////////

class ControllableLFSR16 extends Module{
  val io      = IO(new Bundle{
    val shift = Input(Bool())
    val rand  = Output(UInt(16.W))
  })

  val reg1  = RegInit(1.U(1.W))
  val reg2  = RegInit(0.U(1.W))
  val reg3  = RegInit(0.U(1.W))
  val reg4  = RegInit(0.U(1.W))
  val reg5  = RegInit(0.U(1.W))
  val reg6  = RegInit(0.U(1.W))
  val reg7  = RegInit(0.U(1.W))
  val reg8  = RegInit(0.U(1.W))
  val reg9  = RegInit(0.U(1.W))
  val reg10 = RegInit(0.U(1.W))
  val reg11 = RegInit(0.U(1.W))
  val reg12 = RegInit(0.U(1.W))
  val reg13 = RegInit(0.U(1.W))
  val reg14 = RegInit(0.U(1.W))
  val reg15 = RegInit(0.U(1.W))
  val reg16 = RegInit(0.U(1.W))  


  when(io.shift){
    reg1  := (reg11^(reg13^(reg14^reg16)))
    reg2  := reg1
    reg3  := reg2
    reg4  := reg3
    reg5  := reg4
    reg6  := reg5
    reg7  := reg6
    reg8  := reg7
    reg9  := reg8
    reg10 := reg9
    reg11 := reg10
    reg12 := reg11
    reg13 := reg12
    reg14 := reg13
    reg15 := reg14
    reg16 := reg15
  }
  val rand = Cat(reg16, reg15, reg14, reg13, reg12, reg11, reg10,reg9,reg8,reg7,reg6,reg5,reg4,reg3,reg2,reg1)
  io.rand := rand.asUInt()
}

object ControllableLFSR16{
  def apply(): ControllableLFSR16 = Module(new ControllableLFSR16)
}
class LFSR16Demo extends Module{
  val io = IO(new Bundle{
    val shift     = Input(Bool())
    val randShift = Output(UInt(16.W))
    val rand      = Output(UInt(16.W))
  })
  val LFSR16  = ControllableLFSR16()
  val LFSRRef = LFSR(16)

  LFSR16.io.shift := io.shift
  io.randShift    := LFSR16.io.rand
  io.rand         := LFSRRef

}
