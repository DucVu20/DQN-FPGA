package dnn

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest._
import scala.util.Random._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation
import chisel3.internal.firrtl.KnownBinaryPoint

class SinglePortedMemTester extends FlatSpec with ChiselScalatestTester {
  behavior of "Single Ported Memory"
  def SinglePortedMemTester[T <: SinglePortedRam[UInt]](dut: T): Unit = {

    val randomData = Array.fill(scala.math.pow(2, dut.io.addr.getWidth).toInt){nextInt(scala.math.pow(2,
      dut.io.dataIn.getWidth).toInt)}

    dut.clock.step(5)
    for(addr <- 0 until(scala.math.pow(2, dut.io.addr.getWidth)).toInt){
      dut.io.wrEna.poke(true.B)
      dut.io.addr.poke(addr.U)
      dut.io.dataIn.poke(randomData(addr).U)
      dut.clock.step(1)
      dut.io.wrEna.poke(false.B)
      dut.clock.step(2)
    }
    dut.io.wrEna.poke(false.B)
    dut.clock.step(100)

    // read data from the mem and check
    for(rdAddr <- 0 until(scala.math.pow(2, dut.io.addr.getWidth).toInt) - 3){
      dut.io.rdEna.poke(true.B)
      dut.io.addr.poke(rdAddr.U)
      dut.clock.step(2)
      dut.io.rdEna.poke(false.B)
      dut.clock.step(5)
//      dut.io.rdData.expect(randomData(rdAddr).U)
      println(s"data address: ${rdAddr} get: ${dut.io.dataOut.peek().litValue()} ref:${randomData(rdAddr)}")
    }

    for(rdAddr <- 0 until(scala.math.pow(2, dut.io.addr.getWidth).toInt)){
      dut.io.rdEna.poke(false.B)
      dut.io.addr.poke(rdAddr.U)
      dut.clock.step(1)
    }
  }

  
  // it should "test Dual Ported Ram with depth of 256, SInt16" in {
  //   test(new DualPortedMem(SInt(16.W), 256)){dut => DualPortedMemTester(dut)}
  // }

   "Single Ported Ram Wave " should "pass" in {
     test(new SinglePortedRam(UInt(16.W), 256)).withAnnotations(Seq(WriteVcdAnnotation)){
       dut => SinglePortedMemTester(dut)
     }
   }
}
