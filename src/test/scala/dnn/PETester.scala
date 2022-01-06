package dnn
import chisel3._
import chiseltest._
import org.scalatest._
import chisel3.experimental.FixedPoint._
import scala.util.Random._
import utils._
import scala.math._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation

class PETester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "PE"
  def PETester[T <: PE](dut: T, numberOfNeurons: Int): Unit = {
    println("------------------------------------------------------------------------------------------------------------------")
    val dataWidth = dut.width
    val binaryPoint = dut.BP

    val weights = Array.fill(numberOfNeurons)(nextFloat())
    val inputActivations = Array.fill(numberOfNeurons)(nextFloat())
    var ref = 0.toFloat
    println("================Disable the PE======================")
    dut.io.PEControl.activate.poke(false.B)
    dut.clock.step(1)
    for(arthimetic <- 0 until 4){
      dut.io.PEControl.opcode.poke(arthimetic.U)
      for(idx <- 0 until(weights.length)){
        dut.io.weight.poke(FPConverter.Float2SInt(weights(idx), dataWidth, binaryPoint).S)
        dut.io.inputAct.poke(FPConverter.Float2SInt(inputActivations(idx), dataWidth, binaryPoint).S)
        if(arthimetic == 0){ // MUL
          ref = weights(idx)*inputActivations(idx)
        }
        else if(arthimetic == 1){ // ADD
          ref = weights(idx)+inputActivations(idx)
        }
        else if(arthimetic ==2){ // MAC
          ref = ref + weights(idx)*inputActivations(idx) 
        }
        else{
          ref = 0
        }

        dut.clock.step(1)
        println(s"PE value when performing ${arthimetic} is ${dut.io.result.peek.litValue()} while reference value: ${ref}")
      }
    }
    println("==================Enable the PE to work======================")
    dut.io.PEControl.activate.poke(true.B)
    dut.clock.step(1)
    for(arthimetic <- 0 until 4){
      if(arthimetic == 2){
        ref = 0.toFloat
        dut.io.PEControl.clearWeightedSum.poke(true.B)
        dut.clock.step(1)
        dut.io.PEControl.clearWeightedSum.poke(false.B)
        dut.clock.step(1)
      }
      ref = 0.toFloat
      dut.io.PEControl.opcode.poke(arthimetic.U)
      for(idx <- 0 until(weights.length)){
        dut.io.weight.poke(FPConverter.Float2SInt(weights(idx), dataWidth, binaryPoint).S)
        dut.io.inputAct.poke(FPConverter.Float2SInt(inputActivations(idx), dataWidth, binaryPoint).S)
        if(arthimetic == 0){ // MUL
          ref = weights(idx)*inputActivations(idx)
        }
        else if(arthimetic == 1){ // ADD
          ref = weights(idx)+inputActivations(idx)
        }
        else if(arthimetic ==2){ // MAC
          ref = ref + weights(idx)*inputActivations(idx) 
        }
        else{
          ref = 0.toFloat
        }

        dut.clock.step(1)
        println(s"performing arthimetic ${arthimetic} with weight ${weights(idx)} and" +
          s" inputAct ${inputActivations(idx)} get " +
          s"${FPConverter.SInt2Float(dut.io.result.peek().litValue().toInt, binaryPoint)} " +
          s"while reference value: ${ref}")
      }
    }
  }

   it should " pass 1 PE with 32 neurons" in {
     test(new PE(16, 8)){dut => PETester(dut, 4)}
   }


  "PE waveform " should "pass" in{
    test(new PE(16, 8)).withAnnotations(Seq(WriteVcdAnnotation)){
      dut => PETester(dut, 4)
    }
  }
}

// syntax for test only one main: sbt "test:testOnly package.class"
