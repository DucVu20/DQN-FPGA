package dnn
import chisel3._
import chisel3.util._
import scala.math._
import scala.math.BigInt._
// Pure combonational logic circuit, no registers are added
class Adder(width: Int) extends Module{
  val io = IO(new Bundle{
    val a = Input(SInt(width.W))
    val b = Input(SInt(width.W))
    val out = Output(SInt(width.W))
//    val overflow = Output(Bool())
  })
//  val sum = Wire(dataType)
  io.out := io.a + io.b

}

object Adder{
  def apply(width: Int): Adder = Module(new Adder(width ))
}

class Multiplier(width: Int) extends Module{
  val io = IO(new Bundle{
    val a = Input(SInt(width.W))
    val b = Input(SInt(width.W))
    val out = Output(SInt((2*width).W))
//    val overflow = Output(Bool())
  })
  io.out := io.a * io.b
//  io.overflow
}

object Multiplier{
  def apply(width: Int): Multiplier = Module(new Multiplier(width))
}


///////////////////////////////////////////////////////////////////////////////////////////////
// PEDecoder takes nPEs as the number of Processing Elements to be used for processing data  //
// and decodes that to the number of consecutive 1. For example, the maximum number of PE is //
// 32 and the decoder takes 5 as the input and outputs 00000000000011111                     //
///////////////////////////////////////////////////////////////////////////////////////////////

class EnableSignalDecoder(nPEs: Int) extends Module{
  val numberOfPE = nPEs
  val io = IO(new Bundle{
    val activatedSignals = Output(Vec(nPEs, Bool()))
    val PEs = Input(UInt((log2Ceil(nPEs) + 1).W))
  })

  val activatedSignals = WireInit(0.U(nPEs.W))
  for(pe <- 0 to(nPEs)){
    when(io.PEs === pe.U){
      activatedSignals := (pow(2, pe) - 1).toInt.U
    }
  }

  for(idx <- 0 until(nPEs)){
    io.activatedSignals(idx) := activatedSignals(idx).asBool()
  }
}

object EnableSignalDecoder{
  def apply(nPEs: Int): EnableSignalDecoder = Module(new EnableSignalDecoder(nPEs))
}
