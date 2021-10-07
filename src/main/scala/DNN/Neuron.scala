package sislab.dnn
import chisel3._
import chisel3.util._

class Neuron(inputs: Int, act: FixedPoint => FixedPoint, bitsBeforeDecimal: Int,
bitsAfterDecimal: Int) extends Module{
  val io        = IO(new Bundle{
    val in      = Input(Vec( inputs, FixedPoint(bitsBeforeDecimal.W, bitsAfterDecimal.W)))
    val weights = Intput(Vec(inputs, FixedPoint(bitsBeforeDecimal.W, bitsAfterDecimal.W)))
    val out     = Output(FixedPoint(bitsBeforeDecimal.W, bitsAfterDecimal.W))
    val perform = Input(Bool())
  })
  val macResult = RegInit(0.U(FixedPoint(bitsBeforeDecimal.W, bitsAfterDecimal.W)))
  when(io.perform){
    for(a <- 0 util(inputs)){
      macResult := io.in(a)*io.weights(a) + macResult
    }
  }
  io.out := macResult
}
