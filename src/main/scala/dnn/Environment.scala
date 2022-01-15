import chisel3._
import chisel3.util._
// show paren mode
class Environment(maxSize: Int) extends Module{
  val io = IO(new Bundle{
    val state = Input(UInt(log2Ceil(maxSize).W))
    val dataIn = Input(UInt(2.W))
    val wrEna = Input(Bool())
    val rdEna = Input(Bool())
    val reward = Output(UInt(2.W))
  })
  val environment = SyncReadMem(maxSize, UInt(2.W))
  when(io.wrEna){
    environment.write(io.state, io.dataIn)
  }
  io.reward := environment.read(io.state, io.rdEna)
}
