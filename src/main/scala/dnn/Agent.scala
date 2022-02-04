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
    val reward          = Input(SInt(3.W))
    val state           = Output(UInt(6.W))
    val observe         = Output(Bool())
    val terminate       = Output(Bool())
    val newStateFound   = Output(Bool())
  })
  val mazeSize  = RegInit(0.U(3.W))
  val x         = RegInit(0.U(3.W))
  val y         = RegInit(0.U(3.W))
  val observe   = Wire(Bool())

  when(io.loadInitalState){
    x         := io.x_initial
    y         := io.y_initial
    mazeSize  := io.mazeSize
  }

  when(io.actionValid){
    observe := true.B
    when(io.action === 0.U){ // right
      x := x + 1.U
    }.elsewhen(io.action === 1.U){ // up
      y := y - 1.U
    }.elsewhen(io.action === 2.U){ // left
      x := x - 1.U
    }.otherwise{ // down
      y := y + 1.U
    }
  }.otherwise{
    observe := false.B
  }

  when(io.reward === 2.S){
    io.terminate := true.B
  }.otherwise{
    io.terminate := false.B
  }
  io.observe := RegNext(observe)
  io.state     := x + y*mazeSize
  io.newStateFound := RegNext(io.actionValid)
}
