package dnn
import chisel3._
import chiseltest._
import org.scalatest._
import scala.util.Random._
import utils._
import scala.math._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation
class PEArrayTester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "PE"
  def PEArrayTester[T <: ProcessingCore](dut: T, nPEs: Int, scrathPadMemDepth: Int,
                             InputVectorDepth: Int, dataWidth: Int,
                             binaryPoint: Int): Unit = {
    println("------------------------------------------------------------------")
    val matrixRow = 32
    val matrixColum = 512
    val randomWeightMatrix = Array.ofDim[Int](matrixRow, matrixColum) // create a ref random matrix

    for(row <- 0 until(matrixRow)){
      for(col <- 0 until(matrixColum)){
        randomWeightMatrix(row)(col) = nextInt(scala.math.pow(2, 10).toInt)
      }
    }
    dut.io.valid.poke(false.B)
    dut.clock.step(700)

    for(row <- 0 until(matrixRow)){
      for(col <- 0 until(matrixColum)){
        var instruction = ((1.toLong<<30)|(2<<28)|row<<23|col<<13|randomWeightMatrix(row)(col))
        while(!dut.io.ready.peek().litToBoolean){
          dut.clock.step(1)
        }
        dut.io.instruction.poke(instruction.U)
        println(s"value of instruction is ${instruction}")
        dut.io.valid.poke(true.B)
        dut.clock.step(1)
      }
    }
    println("write matrix to the memory successfully")
    println("begin reading all weights from the matrix memory and validate")

    dut.io.valid.poke(false.B)
    dut.clock.step(800)

    for(col<- 0 until(matrixColum)){
      var instruction = ((1.toLong<<30)|(1<<28)|(matrixRow-1)<<23|col<<13|0)
      while(!dut.io.ready.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.io.instruction.poke(instruction.U)
      dut.io.valid.poke(true.B)
      dut.clock.step(1)
      while(!dut.io.dataValid.peek().litToBoolean){ // wait for data to be read out
        dut.clock.step(1)
      }
      dut.clock.step(1) // step one clock
      for(row <- 0 until(matrixRow)){
        println(s"reading col ${col}, row ${row} ref=${randomWeightMatrix(row)(col)} get=${dut.io.dataOut(row).peek().litValue()}")
        dut.io.dataOut(row).expect(randomWeightMatrix(row)(col).S)
      }
    }
  }

  // ============ test main ================//
//  it should " an PEArray of 32 PEs should pass" in {
//    test(new ProcessingCore(32, 1024, 32, 16, 8))
//    {dut => PEArrayTester(dut, 4, 1024,
//      128, 16, 8)}
//  }

  "PEArray waveform " should "pass" in{
    test(new ProcessingCore(32, 1024, 32, 16, 8)).withAnnotations(Seq(WriteVcdAnnotation)){
      dut => PEArrayTester(dut,32, 1024, 32, 16, 8)
    }
  }
}

 // syntax for test only one main: sbt "test:testOnly package.class"
