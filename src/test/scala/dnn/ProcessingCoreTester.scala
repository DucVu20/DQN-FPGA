package dnn
import chisel3._
import chiseltest._
import org.scalatest._
import scala.util.Random._
import utils._
import scala.math._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation
class ProcessingCoreTester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "PE"
  def PEArrayTester[T <: ProcessingCore](dut: T, nPEs: Int, scrathPadMemDepth: Int,
                                         nRowVector: Int, dataWidth: Int,
                                         binaryPoint: Int): Unit = {
    println("------------------------------------------------------------------")
    val matrixRow = 32
    val matrixColum = 32
    val nVectorElem = 32
    var row = 2 // the row of the vector matrix
    val randomWeightMatrix = Array.ofDim[Int](matrixRow, matrixColum) // create a ref random matrix

    for(row <- 0 until(matrixRow)){
      for(col <- 0 until(matrixColum)){
        randomWeightMatrix(row)(col) = nextInt(scala.math.pow(2, 10).toInt)
      }
    }
    dut.io.valid.poke(false.B)
    dut.clock.step(700)
    var instruction = 0.toLong
    for(row <- 0 until(matrixRow)){
      for(col <- 0 until(matrixColum)){
        instruction = ((1.toLong<<30)|(2<<27)|row<<22|col<<12|randomWeightMatrix(row)(col))
        while(!dut.io.ready.peek().litToBoolean){
          dut.clock.step(1)
        }
        dut.io.instruction.poke(instruction.U)
        println(s"value of the instruction is ${instruction}")
        dut.io.valid.poke(true.B)
        dut.clock.step(1)
      }
    }
    println("write matrix to the memory successfully")
    println("begin reading all weights from the matrix memory and validate")

    dut.io.valid.poke(false.B)
    dut.clock.step(800)

    for(col<- 0 until(matrixColum)){
      var instruction = ((1.toLong<<30)|(1<<27)|(matrixRow-1)<<22|col<<12|0)
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
    dut.io.valid.poke(false.B)
    dut.clock.step(500)

    println("*********************************************")
    println("finishing writing data to the matrix memory")
    println("test the input activation vector memory now")

    var activation = Array.fill(nVectorElem){nextInt(1024)}
    for(col <- 0 until(nVectorElem)){
      instruction = ((1.toLong<<30)|(3<<27)|col<<22|row<<12|activation(col))
      while(!dut.io.ready.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.io.instruction.poke(instruction.U)
      println(s"value of the instruction is ${instruction}")
      dut.io.valid.poke(true.B)
      dut.clock.step(1)
    }
    dut.io.valid.poke(false.B)
    dut.clock.step(800)

    println("begin reading data from the vector memory")
    instruction = ((1.toLong<<30)|(4<<27)|(nPEs - 1)<<22|row<<12|0)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }
    dut.io.instruction.poke(instruction.U)
    dut.io.valid.poke(true.B)
    dut.clock.step(1)
    while(!dut.io.dataValid.peek().litToBoolean){ // wait for data to be read out
      dut.clock.step(1)
    }
    dut.io.valid.poke(false.B)
    dut.clock.step(1) // step one clock
    for(col <- 0 until(nVectorElem)){
      println(s"reading col ${col}, row ${row} ref=${activation(col)} get=${dut.io.dataOut(col).peek().litValue()}")
      dut.io.dataOut(row).expect(randomWeightMatrix(row)(col).S)
    }
    dut.clock.step(500)
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
