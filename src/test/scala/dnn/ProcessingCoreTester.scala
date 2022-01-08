package dnn
import chisel3._
import chiseltest._
import org.scalatest._
import scala.util.Random._
import utils._
import mfunc._
import dfunc._
import opcode._
import MatrixTools._
import scala.math._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation

class ProcessingCoreTester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "PE"
  def ProcessingCoreTester[T <: ProcessingCore](dut: T, nPEs: Int, scrathPadMemDepth: Int,
                                         nRowVector: Int, dataWidth: Int,
                                         binaryPoint: Int): Unit = {
    println("------------------------------------------------------------------")
    val matrixRow = 32
    val matrixColum = 128
    val nVectorElem = matrixRow
    var col = 2 // the row of the vector matrix
    val vinAddr = col
    val voutAddr = 4
    val vinSize = matrixColum
    val voutSize = matrixRow
    val randomWeightMatrix = Array.ofDim[Int](matrixRow, matrixColum) // create a ref random matrix
    var activation = Array.fill(nVectorElem){nextInt(10)}

    for(row <- 0 until(matrixRow)){
      for(col <- 0 until(matrixColum)){
        randomWeightMatrix(row)(col) = nextInt(10).toInt
      }
    }
    println("to map the matrix into the matrix memory, the matrix is written to the memory bank" +
      "in the transpose order")
    dut.io.valid.poke(false.B)
    dut.clock.step(400)
    var instruction = 0.toLong
    for(row <- 0 until(matrixRow)){
      for(col <- 0 until(matrixColum)){
        instruction = ((1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|randomWeightMatrix(row)(col))
        while(!dut.io.ready.peek().litToBoolean){
          dut.clock.step(1)
        }
        dut.io.instruction.poke(instruction.U)
//        println(s"value of the instruction is ${instruction}")
        dut.io.valid.poke(true.B)
        dut.clock.step(1)
      }
    }

    dut.io.valid.poke(false.B)
    dut.clock.step(400)

    println("write matrix to the memory successfully")
    println("begin reading all weights from the matrix memory and validate")

    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }
    for(row<- 0 until(matrixRow)){
      var instruction = ((1.toLong<<30)|(MREAD<<27)|((matrixColum - 1))<<22|row<<12|0)
      dut.io.instruction.poke(instruction.U)
      dut.io.valid.poke(true.B)
      dut.clock.step(1)
      while(!dut.io.dataValid.peek().litToBoolean){ // wait for data to be read out
        dut.clock.step(1)
      }
      for(col <- 0 until(matrixColum)){
        println(s"reading row ${row}, col ${col} ref=${randomWeightMatrix(row)(col)} get=${dut.io.dataOut(col).peek().litValue()}")
        dut.io.dataOut(col).expect(randomWeightMatrix(row)(col).S)
      }
    }
    dut.io.valid.poke(false.B)
    dut.clock.step(400)

    // ================================ Test Vector Memory ============================//
    println("*********************************************")
    println("finishing writing data to the matrix memory")
    println("test the input activation vector memory now")

    for(row <- 0 until(nVectorElem)){
      instruction = ((1.toLong<<30)|(VLOAD<<27)|row<<22|col<<12|activation(row))
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
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }
    instruction = ((1.toLong<<30)|(VREAD<<27)|(nVectorElem-1)<<22|col<<12|0)
    dut.io.instruction.poke(instruction.U)
    dut.io.valid.poke(true.B)
    dut.clock.step(1)
    dut.io.valid.poke(false.B)
    while(!dut.io.dataValid.peek().litToBoolean){ // wait for data to be read out
      dut.clock.step(1)
    }
    for(row <- 0 until(nVectorElem)){
      println(s"reading col ${col}, row ${row} ref=${activation(row)} get=${dut.io.dataOut(row).peek().litValue()}")
      dut.io.dataOut(row).expect(activation(row).S)
    }
    dut.clock.step(500)

    // ================================ Test MMV Instruction ============================//
    println("**********************************")
    println("write configuration of the matrix into control registers")
    instruction = (memoryInstruction<<30|MMVC<<27|(vinSize)<<13|(voutSize))
    dut.io.valid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    println(s"Perform the matrix multiplication vector and check for the results")
    instruction = (dataProcessing<<30|MMV<<27|0<<12|vinAddr<<7|voutAddr)
    dut.io.valid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.valid.poke(false.B)
    while(!dut.io.weightedSumValid.peek().litToBoolean){
      dut.clock.step(1)
      println("waiting for data to be valid")
    }
    val MMVRefVal = MMVRef(randomWeightMatrix, activation)
    println("ref result is")
    MMVRefVal.foreach(a => println(a))
    var idx = 0
    while(dut.io.weightedSumValid.peek().litToBoolean){
      println(s"MMV result=${dut.io.weightedSum.peek().litValue()} ref=${MMVRefVal(idx)} idx=${idx}")
      dut.io.weightedSum.expect(MMVRefVal(idx).S)
      dut.clock.step(1)
      idx = idx + 1
    }
    dut.clock.step(100)

  }


//  it should " an PEArray of 32 PEs should pass" in {
//    test(new ProcessingCore(32, 1024, 32, 16, 0))
//    {dut => ProcessingCoreTester(dut, 32, 1024,32, 16, 0)}
//  }

  "ProcessingCoreWaveform" should "pass" in{
    test(new ProcessingCore(32, 1024, 32, 16, 0)).withAnnotations(Seq(WriteVcdAnnotation)){
      dut => ProcessingCoreTester(dut,32, 1024, 32, 16, 0)
    }
  }
}

 // syntax for test only one main: sbt "test:testOnly package.class"
