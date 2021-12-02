package dnn
import chisel3._
import chiseltest._
import org.scalatest._
import scala.util.Random._
import scala.math._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation
import chisel3.internal.firrtl.KnownBinaryPoint

class PETester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "PE"
  def PETester[T <: PESInt](dut: T, numberOfNeurons: Int): Unit = {
    val dataWidth = dut.width
    val fractionWidth = dut.BP
    dut.io.clear.poke(false.B)
    dut.io.weightValid.poke(true.B)
    dut.io.inputActValid.poke(true.B)
    val weights = Array.fill(numberOfNeurons)(8)
    val inputActi = Array.fill(numberOfNeurons)(9)
    var refResult = 0.toFloat
    for (a <- 0 until (numberOfNeurons)) {
      dut.io.weight.poke(weights(a).S)
      dut.io.inputAct.poke(inputActi(a).S)
      dut.clock.step(1)
      refResult = weights(a)*inputActi(a) + refResult
    }
    dut.clock.step(1)
    dut.io.weightValid.poke(false.B)
    dut.io.inputActValid.poke(false.B)
    dut.clock.step(10)

//    println(s"expected result is 129 while get ${dut.io.testPort.peek.litValue} and the overflow bit is ${dut.io.overflow.litToBoolean}")

    println(s"weighted sum is ${dut.io.weightedSum.peek.litValue().toDouble.F(8.BP)}" +
      s" ref: ${refResult.toDouble.F(8.BP)}")
  }

  def PETesterFP[T <: PE](dut: T, numberOfNeurons: Int): Unit = {
    val dataWidth = dut.width
    val fractionWidth = dut.BP
    dut.io.clear.poke(false.B)
    dut.io.weightValid.poke(true.B)
    dut.io.inputActValid.poke(true.B)
//    dut.io
    val weights = Array.fill(numberOfNeurons)(nextFloat()*3)
    val inputActi = Array.fill(numberOfNeurons)(nextFloat()*3)
    var refResult = 0.toFloat
    for (a <- 0 until (numberOfNeurons)) {
      dut.io.weight.poke(weights(a).F(fractionWidth.BP))
      dut.io.inputAct.poke(inputActi(a).F(fractionWidth.BP))
      dut.io.in.poke(a.S)
      dut.clock.step(1)
      refResult = weights(a)*inputActi(a) + refResult
      println(s"expected result is 129 while get ${dut.io.testPort.peek().litValue()} and the overflow bit is ${dut.io.overflow.peek.litToBoolean}")

    }
    dut.clock.step(1)
    dut.io.weightValid.poke(false.B)
    dut.io.inputActValid.poke(false.B)
    dut.clock.step(10)


    println(s"weighted sum is ${dut.io.weightedSum.peek.litToDouble.F(fractionWidth.BP)}" +
      s" ref: ${refResult}")
  }


   it should "test 1 PE with 32 neurons" in {
     test(new PESInt(16, 8)){dut => PETester(dut, 32)}
   }
  it should "test 1 PE fixed point ver with 32 neurons" in {
    test(new PE(16, 8)){dut => PETesterFP(dut, 32)}
  }

  "PE fixed point " should "pass" in{
    test(new PE(16, 8)).withAnnotations(Seq(WriteVcdAnnotation)){
      dut => PETesterFP(dut, 32)
    }
  }
}
