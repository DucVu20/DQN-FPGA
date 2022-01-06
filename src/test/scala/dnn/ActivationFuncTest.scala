package dnn
import chisel3._
import chisel3.iotesters._
import org.scalatest._

class ActivationFuncTester(dut: ActivationFunc) extends PeekPokeTester(dut){
  val binaryPoint = dut.io.in
  for( activation <- 0 until(3)){
    poke(dut.io.activationFunc, activation)
    poke(dut.io.in, (15).S)
    println("activation: "+activation + " value: " + peek(dut.io.activation).toString)
  }

}

object ActivationFuncTester extends App {
  chisel3.iotesters.Driver (() => new ActivationFunc(16, 8)) { c =>
    new ActivationFuncTester(c)
  }
}
