package dnn
import chisel3._
import chisel3.util._

class Agent extends Module{
  val io = IO(new Bundle{
    val action          = Input(UInt(2.W))
    val x_initial       = Input(UInt(3.W))
    val y_initial       = Input(UInt(3.W))
    val loadInitalState = Input(Bool())
    val mazeSize        = Input(UInt(3.W))
    val actionValid     = Input(Bool())
    val reward          = Input(UInt(2.W))
    val terminate       = Output(Bool())
    val state           = Output(UInt(6.W))
  })
  val x = Reg(UInt(3.W))
  val y = Reg(UInt(3.W))

  when(io.loadInitalState){
    x := io.x_initial
    y := io.y_initial
  }

  when(io.actionValid){
    when(io.action === 0.U){ // right
      x := x + 1.U
    }.elsewhen(io.action === 1.U){ // up
      y := y - 1.U
    }.elsewhen(io.action === 2.U){ // left
      x := x - 1.U
    }.otherwise{ // down
      y := y + 1.U
    }
  }

  when(io.reward === 2.U){
    io.terminate := true.B
  }.otherwise{
    io.terminate := false.B
  }
  io.state := x + y*io.mazeSize
}
