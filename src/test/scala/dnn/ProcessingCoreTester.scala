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
                                         binaryPoint: Int, dev: Boolean): Unit = {
    println("------------------------------------------------------------------")
    val matrixRow      = 6 // must be < 32
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
    
    // load weights from txt file to a 2D array
    val p1 = loadWeightsFromTxt("weights/params_layer1_maze_5.txt", Array(25, 26))
    val p2 = loadWeightsFromTxt("weights/params_layer2_maze_5.txt", Array(12, 26))
    val p3 = loadWeightsFromTxt("weights/params_layer3_maze_5.txt", Array(4, 13))

    // writing random numbers into the matrix memory
    for(row <- 0 until(matrixRow)){
      for(col <- 0 until(matrixColum)){
        randomWeightMatrix(row)(col) = (nextInt(maxValue - minValue) + minValue)
      }
    }
    println("to map the matrix into the matrix memory, the matrix is written to the memory bank" +
      "in the transpose order")
    dut.io.instructionValid.poke(false.B)
    dut.clock.step(50)
    var instruction = 0.toLong
    for(row <- matrixBaseAddr until(matrixBaseAddr + matrixRow)){
      for(col <- 0 until(matrixColum)){
        instruction = ((1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|clipSignBits(randomWeightMatrix(row - matrixBaseAddr)(col), 12))
        while(!dut.io.ready.peek().litToBoolean){
          dut.clock.step(1)
        }
        dut.io.instruction.poke(instruction.U)
        dut.io.instructionValid.poke(true.B)
        dut.clock.step(1)
      }
    }

    dut.io.instructionValid.poke(false.B)
    dut.clock.step(50)

    println("write matrix to the memory successfully")
    println("begin reading all weights from the matrix memory and instructionValidate")

    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    if(dev){
      for(row<- matrixBaseAddr until(matrixBaseAddr+matrixRow)){
        var instruction = ((1.toLong<<30)|(MREAD<<27)|((matrixColum - 1))<<22|row<<12|0)
        dut.io.instruction.poke(instruction.U)
        dut.io.instructionValid.poke(true.B)
        dut.clock.step(1)
        while(!dut.io.dataValid.get.peek().litToBoolean){ // wait for data to be read out
          dut.clock.step(1)
        }
        (dut.io.dataOut.get, randomWeightMatrix(row - matrixBaseAddr)).zipped.foreach((x, y)
        => println(s"get ${x.peek().litValue()} ref=${y}"))
        (dut.io.dataOut.get, randomWeightMatrix(row - matrixBaseAddr)).zipped.foreach((x, y)
        => x.expect(y.S))
      }
      dut.io.instructionValid.poke(false.B)
    }

    dut.clock.step(40)

    // ================================ Test Vector Memory ============================//
    println("*********************************************")
    println("finishing writing data to the matrix memory")
    println("Begin writing input activations to the vector memory")

    for(row <- 0 until(nVectorElem)){
      instruction = ((1.toLong<<30)|(VLOAD<<27)|row<<22|col<<12|clipSignBits(activation(row), 12))
      while(!dut.io.ready.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.io.instruction.poke(instruction.U)
      dut.io.instructionValid.poke(true.B)
      dut.clock.step(1)
    }
    dut.io.instructionValid.poke(false.B)
    dut.clock.step(500)

    if(dev){
      println("begin reading data from the vector memory")
      while(!dut.io.ready.peek().litToBoolean){
        dut.clock.step(1)
      }
      instruction = ((1.toLong<<30)|(VREAD<<27)|(nVectorElem-1)<<22|col<<12|0)
      dut.io.instruction.poke(instruction.U)
      dut.io.instructionValid.poke(true.B)
      dut.clock.step(1)
      dut.io.instructionValid.poke(false.B)
      while(!dut.io.dataValid.get.peek().litToBoolean){ // wait for data to be read out
        dut.clock.step(1)
      }
      (dut.io.dataOut.get, activation).zipped.foreach((x, y)
      => x.expect(y.S))
      (dut.io.dataOut.get, activation).zipped.foreach((x, y)
      => println(s"get ${x.peek().litValue()} ref=${y}"))
    }

    dut.clock.step(50)

    // ================================ Test MMV Instruction ============================//
    println("**********************************")
    println("write configuration of the matrix into control registers")
    instruction = (memoryInstruction<<30|MMVC<<27|(vinSize-1)<<13|(voutSize))
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    println(s"Perform the matrix multiplication vector")
    instruction = (dataProcessing<<30|MMV<<27|matrixBaseAddr<<12|vinAddr<<7|voutAddr)
    // vout is where the accumulated sum located
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)

    val MMVRefVal = matrixMultiplyVector(randomWeightMatrix, activation)
    if(dev){
      println("Poke results of MVM and compare with reference values")
      while(!dut.io.weightedSumValid.get.peek().litToBoolean){
        dut.clock.step(1)
        println("waiting for data to be instructionValid")
      }
      println("true result of matrix vector operation is")
      MMVRefVal.foreach(a => println(a))
      var idx = 0
      while(dut.io.weightedSumValid.get.peek().litToBoolean){
        println(s"MMV result=${dut.io.weightedSum.get.peek().litValue()} ref=${MMVRefVal(idx)} idx=${idx}")
        dut.io.weightedSum.get.expect(MMVRefVal(idx).S)
        dut.clock.step(1)
        idx = idx + 1
      }
      dut.clock.step(100)
    }

    // ================================ Activation ============================//
    println("test activation block, weighted sum from MMV")
    val weightedSumAddr = voutAddr
    instruction = (dataProcessing<<30|ACT<<27|RELU<<25|weightedSumAddr<<15|(voutSize-1)<<10)
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionValid.poke(true.B)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)
    dut.io.instructionValid.poke(false.B)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    if(dev){
      println(s"Start reading activated value by VREAD Instruction")
      val activationSw = ReLU(MMVRefVal)
      instruction = ((1.toLong<<30)|(VREAD<<27)|(voutSize-1)<<22|voutAddr<<12|0)
      dut.io.instruction.poke(instruction.U)
      dut.io.instructionValid.poke(true.B)
      dut.clock.step(1)
      dut.io.instructionValid.poke(false.B)
      while(!dut.io.dataValid.get.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.io.instructionValid.poke(false.B)
      println(s"Read activated values from hardware")
      (dut.io.dataOut.get, activationSw).zipped.foreach((activatedHW, activatedSw)
      => println(s"get ${activatedHW.peek().litValue()} ref=${activatedSw}"))
      (dut.io.dataOut.get, activationSw).zipped.foreach((activatedHW, activatedSw)
      => activatedHW.expect(activatedSw.S))

      dut.clock.step(10)
   }

    println("Test the ACTION Function")
    instruction = ((1.toLong<<30)|(ACTION<<27)|(voutAddr)<<17|3<<14|0)
    dut.io.instructionValid.poke(false.B)
    dut.clock.step(1)
    dut.io.instructionValid.poke(true.B)
    dut.clock.step(1)
    while (!dut.io.actionValid.peek().litToBoolean){
      dut.clock.step(1)
    }
    println(s"The best action is ${dut.io.action.peek().litValue()}")

    // ======================= SLOAD ======================//
    println("test SLOAD instruction, state 24, row addr = 6")
    dut.io.state.poke(31.U)
    instruction = ((1.toLong<<30)|(SLOAD<<27)|(0<<22)|(6<<12)|0)
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)
    while(!dut.io.ready.peek.litToBoolean){
      dut.clock.step(1)
    }

    if(dev){
      println("read state load into vector memory")
      instruction = ((1.toLong<<30)|(VREAD<<27)|(31)<<22|6<<12|0)
      dut.io.instructionValid.poke(true.B)
      dut.io.instruction.poke(instruction.U)
      dut.clock.step(1)
      dut.io.instructionValid.poke(false.B)
      while(!dut.io.dataValid.get.peek.litToBoolean){
        dut.clock.step(1)
      }
      dut.io.dataOut.get.foreach(s => {println(s.peek.litValue)})

      dut.clock.step(10)
    }

    println("Test the INFER")


    // println("Test the nop operation")
    // instruction = (3.toLong)<<30
    // dut.io.instruction.poke(instruction.U)
    // dut.io.instructionValid.poke(true.B)
    // dut.clock.step(1)
    // dut.io.instructionValid.poke(false.B)
    // for(clock <- 0 until(4)){
    //   dut.clock.step(1)
    //   if(dut.io.ready.peek.litToBoolean){
    //     (dut.io.dataOut.get.foreach(x => println(s"dataOut ${x.peek.litValue}")))
    //     println(s"${dut.io.weightedSum.get.peek.litValue}")
    //   }
    // }

  }

  // it should " an PEArray of 32 PEs should pass" in {
  //   test(new ProcessingCore(32, 1024, 32, 16, 0))
  //   {dut => ProcessingCoreTester(dut, 32, 1024,32, 16, 0, true)}
  // }

  "ProcessingCoreWaveform" should "pass" in{
    test(new ProcessingCore(32, 1024, 32,
      16, 0, true)).withAnnotations(Seq(WriteVcdAnnotation)){
      dut => ProcessingCoreTester(dut,32, 1024, 32, 16, 0, true)
    }
  }

}

// syntax for test only one main: sbt "test:testOnly package.class"
