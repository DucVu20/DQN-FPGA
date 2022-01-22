package dnn
import chisel3._
import chisel3.util._

class Agent extends Module{
  val io = IO(new Bundle{
    val x_initial       = Input(UInt(3.W))
    val y_initial       = Input(UInt(3.W))
    val loadInitalState = Input(Bool())
    val mazeSize        = Input(UInt(3.W))
    val action          = Input(UInt(2.W))
    val actionValid     = Input(Bool())
    val reward          = Input(UInt(2.W))
    val terminate       = Output(Bool())
    val state           = Output(UInt(6.W))
    val newStateFound   = Output(Bool())
  })
  val terminate = RegInit(false.B)
  val mazeSize  = RegInit(0.U(3.W))
  val x         = RegInit(0.U(3.W))
  val y         = RegInit(0.U(3.W))

  when(io.loadInitalState){
    x         := io.x_initial
    y         := io.y_initial
    terminate := false.B
    mazeSize  := io.mazeSize
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
    io.newStateFound := true.B
  }.otherwise{
    io.newStateFound := false.B
  }

  when(io.reward === 2.U){
    terminate := true.B
  }

  io.state     := x + y*mazeSize
  io.terminate := terminate
}
