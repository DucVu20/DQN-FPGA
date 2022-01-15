package dnn
import chisel3._
import chiseltest._
import org.scalatest._
import scala.util.Random._
import scala.math._

class ActivationBlockTester extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "PE"
  def ActivationBlock[T<: ActivationBlock](dut: T, nInputAct: Int): Unit = {
    dut.io.ena.poke(false.B)
    for(activationFunc <- 0 until(2)){
      dut.io.activationFunc.poke(activationFunc.U)
      for(n <- 0 until(nInputAct)){
        dut.io.weightedSum(n).poke(3.S)
      }
      dut.clock.step(1)
      for(n<- 0 until(nInputAct)){
        println(s"activation=${activationFunc} get=${dut.io.activation(n).peek().litValue()}")
      }
    }
    println("Enable the block")
    dut.io.ena.poke(true.B)
    for(activationFunc <- 0 until(2)){
      dut.io.activationFunc.poke(activationFunc.U)
      for(n <- 0 until(nInputAct)){
        dut.io.weightedSum(n).poke(-3.S)
      }
      dut.clock.step(1)
      for(n<- 0 until(nInputAct)){
        println(s"activation=${activationFunc} get=${dut.io.activation(n).peek().litValue()}")
      }
    }
  }
  it should "pass the ActivationUnit" in {
    test(new ActivationBlock(16,4)){dut => ActivationBlock(dut, 4)}
  }
}
