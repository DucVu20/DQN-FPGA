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

//  when(io.rdEna){
//    io.rdData := mem.read(io.readAddr).asTypeOf(dataType)
//  }.otherwise{
//    io.rdData := 0.U.asTypeOf(dataType)
//  }
}

object DualPortedMem{
  def apply[T <: Data](dataType : T, memDepth: Int): DualPortedMem[T] = Module(new DualPortedMem(dataType, memDepth))
}

object DualPortedMemGenerator extends App{
  new (ChiselStage).emitVerilog(new DualPortedMem(SInt(16.W), 2048), Array("--target-dir","generated"))
  // new (ChiselStage).emitVerilog(new DualPortedMem(SInt(16.W), 240*320), Array("--target-dir","generated"))
}
