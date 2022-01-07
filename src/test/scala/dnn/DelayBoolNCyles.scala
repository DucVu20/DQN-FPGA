package dnn
import chisel3._
import chiseltest._
import org.scalatest._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation

class DelayBoolNCyles extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "DelayNCyle"

  def DelayNCycleTester(dut: DelayBoolNCycles): Unit = {
    println("Enable the module")
    dut.clock.step(10)
    dut.io.signal2delay.poke(false.B)
    dut.clock.step(10)
    dut.io.signal2delay.poke(true.B)
    dut.clock.step(1)
    dut.io.signal2delay.poke(false.B)
    dut.clock.step(30)
  }

  "DelayNCyclesWaveform" should "pass" in{
    test(new DelayBoolNCycles(16)).withAnnotations(Seq(WriteVcdAnnotation)){
      dut => DelayNCycleTester(dut)
    }
  }
}