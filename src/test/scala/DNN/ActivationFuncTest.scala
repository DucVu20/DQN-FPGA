package dnn
import chisel3._
import chisel3.iotesters._
import org.scalatest._

class ActivationFuncTester(dut: ActivationFunc) extends PeekPokeTester(dut){
  step(10)
  val binaryPoint = dut.io.in.binaryPoint
  for( activation <- 0 until(3)){
    poke(dut.io.activationType, activation)
    pokeFixedPoint(dut.io.in, -15)
    println("activation: "+activation + " value: " + peekFixedPoint(dut.io.out).toString)
  }

}

object ActivationFuncTester extends App {
  chisel3.iotesters.Driver (() => new ActivationFunc(16, 8)) { c =>
    new ActivationFuncTester(c)
  }
}