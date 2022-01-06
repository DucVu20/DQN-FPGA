package dnn
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest._
import utils._
import scala.util.Random._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation
import Console.{GREEN, RED, RESET}

class AdderTreeTester extends FlatSpec with ChiselScalatestTester with Matchers{
    behavior of "AdderTree"
  def AdderTreeTester[T <: AdderTree](dut: T, numberOfInputs: Int,
                                     binaryPoint: Int, nTests: Int ): Unit = {
    println("=====================================================")
    val refResult = Array.fill(nTests+1)(0.toFloat)
    val result = Array.fill(nTests+1)(0.toFloat)
    var idx = 0

    for(test <- 0 until(nTests)){
      var inputs = Array.fill(numberOfInputs)(nextFloat())
      dut.io.cal.poke(true.B)
      for(idx <- 0 until numberOfInputs){
        dut.io.in(idx).poke(FPConverter.Float2SInt(inputs(idx), dut.io.sum.getWidth, binaryPoint).asSInt)
      }
      dut.clock.step(1)
      refResult(test) = inputs.sum
      if(dut.io.sumValid.peek.litToBoolean){
        result(idx) = FPConverter.SInt2Float(dut.io.sum.peek.litValue, binaryPoint)
        idx = idx + 1
      }
    }
    dut.io.cal.poke(false.B)
    while(dut.io.sumValid.peek.litToBoolean){
      dut.clock.step(1)
      result(idx) = FPConverter.SInt2Float(dut.io.sum.peek.litValue, binaryPoint).toFloat
      idx = idx + 1

    }

    dut.clock.step(10)

    for(test <- 0 until(nTests)){
      println(s"(dataWidth: ${dut.io.sum.getWidth} binaryPoint: ${binaryPoint})"
        + s" nInputs=${numberOfInputs} testNo ${test} ${GREEN} AdderTree result=${result(test)}"
        + s" reference value=${refResult(test)} discrepancy=${(result(test)-refResult(test)).abs}"
        + s" ${RESET}")
    }
  }

  it should "pass with w=22 BP=10" in {
    test(new AdderTree(32, 22)){dut => AdderTreeTester(dut, 32, 10, 8)}
  }

  it should "pass with w=16 BP=10" in {
    test(new AdderTree(32, 16)){dut => AdderTreeTester(dut, 32, 10, 8)}
  }

  it should "pass with w=16 BP=9" in {
    test(new AdderTree(32, 16)){dut => AdderTreeTester(dut, 32, 9, 8)}
  }

  "AdderTree waveform w=16, BP=8 " should "pass" in{
    test(new AdderTree(32, 16)).withAnnotations(Seq(WriteVcdAnnotation)){
      dut => AdderTreeTester(dut, 32, 8, 8)
    }
  }
}
