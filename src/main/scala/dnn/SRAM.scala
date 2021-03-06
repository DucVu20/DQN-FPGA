package dnn

import chisel3._
import chisel3.util._
import chisel3.stage.ChiselStage

class DualPortedMem[T <: Data](dataType: T, memDepth: Int
                              )extends Module{
  val io = IO(new Bundle{
    val wrData = Input(dataType)
    val rdData = Output(dataType)
    val readAddr = Input(UInt(log2Ceil(memDepth).W))
    val writeAddr = Input(UInt(log2Ceil(memDepth).W))
    val wrEna = Input(Bool())
    val rdEna = Input(Bool())
//    val mask = Input(Vec(mask_len, Bool()))
  })

  assert(!(io.wrEna && io.rdEna && io.readAddr === io.writeAddr), "undefined behavior in dual-ported SRAM ")
  val mem = SyncReadMem(memDepth, dataType)
  when(io.wrEna){
    mem.write(io.writeAddr, io.wrData)
  }
  io.rdData := mem.read(io.readAddr, io.rdEna)
}

class SinglePortedRam[T <: Data](dataType: T, memDepth: Int) extends Module {
  val io = IO(new Bundle {
    val addr    = Input(UInt(log2Ceil(memDepth).W))
    val dataIn  = Input(dataType)
    val dataOut = Output(dataType)
    val wrEna   = Input(Bool())
    val rdEna   = Input(Bool())
  })
  val mem = SyncReadMem(memDepth, dataType)
  when(io.wrEna) {
    mem.write(io.addr, io.dataIn)
  }
  io.dataOut := mem.read(io.addr, io.rdEna)
}

object DualPortedMem{
  def apply[T <: Data](dataType : T, memDepth: Int): DualPortedMem[T] = Module(new DualPortedMem(dataType, memDepth))
}

object SinglePortedRam{
  def apply[T <: Data](dataType : T, memDepth: Int): SinglePortedRam[T] = Module(new SinglePortedRam(dataType, memDepth))
}
