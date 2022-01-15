package dnn

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest._

class LFSRTester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "LFSR"
  def LFSRTester[T <: LFSR16Demo](dut : T): Unit = {
    println("--------------------------------------------------")

    for(a <- 0 until(50)){
      dut.io.shift.poke(true.B)
      dut.clock.step(1)
      println(s"ref: ${dut.io.rand.peek().litValue()} controllable LFSR ${dut.io.randShift.peek().litValue()}")
    }
  }

  it should " test LFSR16" in {
    test(new LFSR16Demo()){dut => LFSRTester(dut)}
  }
}
