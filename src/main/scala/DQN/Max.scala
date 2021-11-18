import chisel3._
import chisel3.util._

// Max2 finds the largest numbers between two numebrs
// The max2 module is a combinational logic design
class Max2[T <: Data](dataType: T) extends Module{
  val io = IO(new Bundle{
    val a = Input(dataType)
    val b = Input(dataType)
    val max = Output(dataType)
  })

  io.max := Mux(io.a > io.b, io.a, io.b)
}

// MaxN finds the largest numbers in a vector sequentially
// This design is pretty much the same as how the software finds the largest numbers
// in a list or a vector sequentially.
class MaxN[T: Data](dataType: T, nElements: Int) extends Module{
  val io = IO(new Bundle{
    val in = Input(Vec(nElements, dataType))
    val max = Output(dataType)
    val start = Input(Bool())
  })
  val counter = RegInit(0.U(log2Ceil(nElements).W))
  val maxVal = Reg(dataType)
  when(io.start){
    maxVal := 0.asTypeOf(dataType)
    counter := 0.U
  }
}
