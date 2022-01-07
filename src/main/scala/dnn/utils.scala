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
    val PEs = Input(UInt(log2Ceil(nPEs) .W)) //
    val enable = Input(Bool())
  })
  val activatedSignals = WireInit(0.U(nPEs.W))
  for(pe <- 1 to(nPEs)){
    when(io.PEs  === (pe - 1).U){
      activatedSignals := (pow(2, pe) - 1).toLong.U
    }
  }

  for(idx <- 0 until(nPEs)){
    when(io.enable){
      io.activatedSignals(idx) := activatedSignals(idx).asBool()
    }.otherwise{
      io.activatedSignals(idx) := false.B
    }

  }
}

object EnableSignalDecoder{ 
  def apply(nPEs: Int): EnableSignalDecoder = Module(new EnableSignalDecoder(nPEs))
}

//////////////////////////////////////////////////////////////////////////////////////////
// The MemWriteSignalDecoder is basically a one hot decoder. It output the write signal //
// for a particular memory row. This is necessary for random weights initialization.    //
//////////////////////////////////////////////////////////////////////////////////////////

class OneHotEncoder(nMemRows: Int) extends Module{
  val io = IO(new Bundle{
    val memRow = Input(UInt(log2Ceil(nMemRows).W))
    val enable = Input(Bool())
    val writeSignal = Output(Vec(nMemRows, Bool()))
  })

  val writeSignal = (1.U << io.memRow)
  for(row <- 0 until(nMemRows)){
    when(io.enable){
      io.writeSignal(row) := writeSignal(row).asBool()
    }.otherwise{
      io.writeSignal(row) := false.B
    }
  }
}
object OneHotEncoder{
  def apply(nMemRows: Int): OneHotEncoder = Module(new OneHotEncoder(nMemRows))
}

class DelayBoolNCycles(nCycles: Int) extends Module{
  val io = IO(new Bundle{
    val signal2delay = Input(Bool())
    val delayedSignal = Output(Bool())
  })
  var temp = RegNext(io.signal2delay)
  for(cycle <- 0 until(nCycles - 1)){
    temp = RegNext(temp)
  }
  io.delayedSignal := temp
}

object DelayBoolNCycles{
  def apply(nCycles: Int): DelayBoolNCycles = Module(new DelayBoolNCycles(nCycles))
}