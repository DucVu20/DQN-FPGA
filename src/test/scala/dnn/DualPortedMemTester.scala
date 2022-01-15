package dnn

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest._
import scala.util.Random._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation
import chisel3.internal.firrtl.KnownBinaryPoint

class DualPortedMemTester extends FlatSpec with ChiselScalatestTester {
  behavior of "Dual Ported Memory"
  def DualPortedMemTester[T <: DualPortedMem[UInt]](dut: T): Unit = {

    val randomData = Array.fill(scala.math.pow(2, dut.io.writeAddr.getWidth).toInt){nextInt(scala.math.pow(2, dut.io.wrData.getWidth).toInt)}

    dut.clock.step(5)
    for(addr <- 0 until(scala.math.pow(2, dut.io.writeAddr.getWidth)).toInt){
      dut.io.wrEna.poke(true.B)
      dut.io.writeAddr.poke(addr.U)
      dut.io.wrData.poke(randomData(addr).U)
      dut.clock.step(1)
      dut.io.wrEna.poke(false.B)
      dut.clock.step(2)
    }
    dut.io.wrEna.poke(false.B)
    dut.clock.step(10)

    // read data from the mem and check
    for(rdAddr <- 0 until(scala.math.pow(2, dut.io.writeAddr.getWidth).toInt)){
      dut.io.rdEna.poke(true.B)
      dut.io.readAddr.poke(rdAddr.U)
      dut.clock.step(2)
      dut.io.rdEna.poke(false.B)
      dut.clock.step(5)
//      dut.io.rdData.expect(randomData(rdAddr).U)
      println(s"data address: ${rdAddr} get: ${dut.io.rdData.peek().litValue()} ref:${randomData(rdAddr)}")
    }

    for(rdAddr <- 0 until(scala.math.pow(2, dut.io.writeAddr.getWidth).toInt)){
      dut.io.rdEna.poke(false.B)
      dut.io.readAddr.poke(rdAddr.U)
      dut.clock.step(1)
      //dut.io.rdData.expect(0.U)
//      println(s"data address: ${rdAddr} get: ${dut.io.rdData.peek().litValue()} ref:${0}")
    }
  }

  it should "test Dual Ported Ram with depth of 256, UInt" in {
    test(new DualPortedMem(UInt(16.W), 256)){dut => DualPortedMemTester(dut)}
  }
  
  // it should "test Dual Ported Ram with depth of 256, SInt16" in {
  //   test(new DualPortedMem(SInt(16.W), 256)){dut => DualPortedMemTester(dut)}
  // }

   "Dual Ported Ram Wave " should "pass" in {
     test(new DualPortedMem(UInt(16.W), 256)).withAnnotations(Seq(WriteVcdAnnotation)){
       dut => DualPortedMemTester(dut)
     }
   }
}
