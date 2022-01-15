package dnn
import chisel3._
import chiseltest._
import org.scalatest._
import scala.util.Random._
import mfunc._
import dfunc._
import opcode._
import Activation._
import utils.matrixUtils._
import utils.activationFunc._
import utils.fixedPointUtils._
import scala.math._
import java.io._
import scala.io.Source
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation

class ProcessingCoreTester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "PE"
  def ProcessingCoreTester[T <: ProcessingCore](dut: T, nPEs: Int, scrathPadMemDepth: Int,
                                         nRowVector: Int, dataWidth: Int,
                                         binaryPoint: Int): Unit = {
    println("------------------------------------------------------------------")
    val matrixRow      = 32 // must be < 32
    val matrixColum    = 6 // must be < 32
    val nVectorElem    = matrixColum
    val matrixBaseAddr = 10
    var col            = 2 // the row of the vector matrix
    val vinAddr        = col
    val voutAddr       = 4
    val vinSize        = matrixColum
    val voutSize       = matrixRow
    val maxValue       = 20
    val minValue       = -20

    val randomWeightMatrix = Array.ofDim[Int](matrixRow, matrixColum) // create a ref random matrix
    var activation         = Array.fill(nVectorElem){(nextInt(maxValue - minValue) + minValue)}
    
    val b1 = Array.fill(25){0.toDouble}
    val b1_source = Source.fromResource("weights/bias_layer1_maze_5.txt").getLines.toArray
    for(idx <- 0 until(25)){
      b1(idx) = b1_source(idx).toDouble
    }

    // writing random numbers into the matrix memory
    for(row <- 0 until(matrixRow)){
      for(col <- 0 until(matrixColum)){
        randomWeightMatrix(row)(col) = (nextInt(maxValue - minValue) + minValue)
      }
    }
    println("to map the matrix into the matrix memory, the matrix is written to the memory bank" +
      "in the transpose order")
    dut.io.valid.poke(false.B)
    dut.clock.step(50)
    var instruction = 0.toLong
    for(row <- matrixBaseAddr until(matrixBaseAddr + matrixRow)){
      for(col <- 0 until(matrixColum)){
        instruction = ((1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|clipSignBits(randomWeightMatrix(row - matrixBaseAddr)(col), 12))
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
    dut.clock.step(50)

    println("write matrix to the memory successfully")
    println("begin reading all weights from the matrix memory and validate")

    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }
    for(row<- matrixBaseAddr until(matrixBaseAddr+matrixRow)){
      var instruction = ((1.toLong<<30)|(MREAD<<27)|((matrixColum - 1))<<22|row<<12|0)
      dut.io.instruction.poke(instruction.U)
      dut.io.valid.poke(true.B)
      dut.clock.step(1)
      while(!dut.io.dataValid.peek().litToBoolean){ // wait for data to be read out
        dut.clock.step(1)
      }
        (dut.io.dataOut, randomWeightMatrix(row - matrixBaseAddr)).zipped.foreach((x, y)
          => println(s"get ${x.peek().litValue()} ref=${y}"))
        (dut.io.dataOut, randomWeightMatrix(row - matrixBaseAddr)).zipped.foreach((x, y)
          => x.expect(y.S))
    }
    dut.io.valid.poke(false.B)
    dut.clock.step(40)

    // ================================ Test Vector Memory ============================//
    println("*********************************************")
    println("finishing writing data to the matrix memory")
    println("test the input activation vector memory now")

    for(row <- 0 until(nVectorElem)){
      instruction = ((1.toLong<<30)|(VLOAD<<27)|row<<22|col<<12|clipSignBits(activation(row), 12))
      while(!dut.io.ready.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.io.instruction.poke(instruction.U)
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
      (dut.io.dataOut, activation).zipped.foreach((x, y)
        => x.expect(y.S))
      (dut.io.dataOut, activation).zipped.foreach((x, y)
        => println(s"get ${x.peek().litValue()} ref=${y}"))
    dut.clock.step(50)

    // ================================ Test MMV Instruction ============================//
    println("**********************************")
    println("write configuration of the matrix into control registers")
    instruction = (memoryInstruction<<30|MMVC<<27|(vinSize-1)<<13|(voutSize))
    dut.io.valid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    println(s"Perform the matrix multiplication vector and check for the results")
    instruction = (dataProcessing<<30|MMV<<27|matrixBaseAddr<<12|vinAddr<<7|voutAddr)
    // vout is where the accumulated sum located
    dut.io.valid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.valid.poke(false.B)
    while(!dut.io.weightedSumValid.peek().litToBoolean){
      dut.clock.step(1)
      println("waiting for data to be valid")
    }
    val MMVRefVal = matrixMultiplyVector(randomWeightMatrix, activation)
    println("true result of matrix vector operation is")
    MMVRefVal.foreach(a => println(a))
    var idx = 0
    while(dut.io.weightedSumValid.peek().litToBoolean){
      println(s"MMV result=${dut.io.weightedSum.peek().litValue()} ref=${MMVRefVal(idx)} idx=${idx}")
      dut.io.weightedSum.expect(MMVRefVal(idx).S)
      dut.clock.step(1)
      idx = idx + 1
    }
    dut.clock.step(100)

    // ================================ Activation ============================//
    println("test activation block, weighted sum from MMV")
    val weightedSumAddr = voutAddr
    instruction = (dataProcessing<<30|ACT<<27|RELU<<25|weightedSumAddr<<15|(voutSize-1)<<10)
    dut.io.instruction.poke(instruction.U)
    dut.io.valid.poke(true.B)
    dut.clock.step(1)
    dut.io.valid.poke(false.B)
//    dut.io.valid.poke(false.B)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    println(s"Start reading activated value by VREAD Instruction")
    val activationSw = ReLU(MMVRefVal)
    instruction = ((1.toLong<<30)|(VREAD<<27)|(voutSize-1)<<22|voutAddr<<12|0)
    dut.io.instruction.poke(instruction.U)
    dut.io.valid.poke(true.B)
    dut.clock.step(1)
    dut.io.valid.poke(false.B)    
    while(!dut.io.dataValid.peek().litToBoolean){
      dut.clock.step(1)
    }
    dut.io.valid.poke(false.B)
    println(s"Read activated values from hardware")
      (dut.io.dataOut, activationSw).zipped.foreach((activatedHW, activatedSw)
        => println(s"get ${activatedHW.peek().litValue()} ref=${activatedSw}"))
      (dut.io.dataOut, activationSw).zipped.foreach((activatedHW, activatedSw)
        => activatedHW.expect(activatedSw.S))

    dut.clock.step(10)

  }


  // it should " an PEArray of 32 PEs should pass" in {
  //   test(new ProcessingCore(32, 1024, 32, 16, 0))
  //   {dut => ProcessingCoreTester(dut, 32, 1024,32, 16, 0)}
  // }

  "ProcessingCoreWaveform" should "pass" in{
    test(new ProcessingCore(32, 1024, 32, 16, 0)).withAnnotations(Seq(WriteVcdAnnotation)){
      dut => ProcessingCoreTester(dut,32, 1024, 32, 16, 0)
    }
  }

}

 // syntax for test only one main: sbt "test:testOnly package.class"
