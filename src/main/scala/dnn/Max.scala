package dnn
import chisel3._
import chisel3.util._

////////////////////////////////////////////////////////////////////////////////////////
// MaxN finds the largest number in a vector in parallel and return the maximum value //
//                  among with the index of that number.                              //
////////////////////////////////////////////////////////////////////////////////////////

class MaxN(width: Int, nElements: Int) extends Module{
  val io = IO(new Bundle{
    val in = Input(Vec(nElements, SInt(width.W)))
    val max = Output(SInt(width.W))
    val index = Output(SInt(width.W))
  })
  private def Max2(x: SInt, y: SInt) = Mux(x > y, x, y)
  io.max   := io.in.reduceLeft(Max2)
  io.index := io.in.indexWhere(x => x === io.in.reduceLeft(Max2))
}


class Max4(width: Int) extends Module{
  val io = IO(new Bundle{
    val in    = Input(Vec(4, SInt(width.W)))
    val max   = Output(SInt(width.W))
    val index = Output(UInt(2.W))
  })
  private def Max2(x: SInt, y: SInt) = Mux(x > y, x, y)
  io.max   := io.in.reduceLeft(Max2)
  io.index := io.in.indexWhere(x => x === io.in.reduceLeft(Max2))
}
