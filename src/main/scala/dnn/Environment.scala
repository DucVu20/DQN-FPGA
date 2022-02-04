package dnn

import chisel3._
import chisel3.util._
// show paren mode
class Environment(maxSize: Int) extends Module{
  val io = IO(new Bundle{
    val state    = Input(UInt(log2Ceil(maxSize).W))
    val rewardIn = Input(SInt(3.W))
    val wrEna    = Input(Bool())
    val rdEna    = Input(Bool())
    val reward   = Output(SInt(3.W))
  })
  val environment = SyncReadMem(maxSize, SInt(3.W))
  when(io.wrEna){
    environment.write(io.state, io.rewardIn)
  } 
  io.reward := environment.read(io.state, io.rdEna)
}
