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
  def ProcessingCoreTester[T <: ProcessingCore](dut: T, p: DQNAcceleratorParams): Unit = {
    println("------------------------------------------------------------------")

    val layer1Size = Array(25, 26)
    val layer2Size = Array(12, 26)
    val layer3Size = Array(4, 13)

    val params1BaseAddr = 0
    val params2BaseAddr = params1BaseAddr + layer1Size(1)
    val params3BaseAddr = params2BaseAddr + layer2Size(1)

    val stateAddr = 0
    val macLayer1Addr = 1
    val macLayer2Addr = 2
    val macLayer3Addr = 3
    val nActions = 4

    val activation = Array.fill(25){0}
    activation(0) = 1
    println(s"dataWidth ${p.dataWidth} BP=${p.binaryPoint} instructionMemDepth=${p.instructionMemDepth}")

    val p1 = loadWeightsFromTxt("DQNMaze/weights/params_layer1_maze_5.txt", layer1Size)
    val p2 = loadWeightsFromTxt("DQNMaze/weights/params_layer2_maze_5.txt", layer2Size)
    val p3 = loadWeightsFromTxt("DQNMaze/weights/params_layer3_maze_5.txt", layer3Size)

    println("to map the matrix into the matrix memory, the matrix is written to the memory bank" +
      "in the transpose order")
    dut.io.instructionValid.poke(false.B)
    dut.clock.step(50)
    var instruction = 0.toLong
    for(row <- params1BaseAddr until(params1BaseAddr + layer1Size(0))){
      for(col <- 0 until(layer1Size(1))){
        instruction = ((1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|
          clipSignBits(Double2SInt(p1(row - params1BaseAddr)(col), p.dataWidth, p.binaryPoint ), 12))
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

    // if(p.dev){
    //   for(row<- params1BaseAddr until(params1BaseAddr + layer1Size(0))){
    //     var instruction = ((1.toLong<<30)|(MREAD<<27)|((layer1Size(1) - 1))<<22|row<<12|0)
    //     dut.io.instruction.poke(instruction.U)
    //     dut.io.instructionValid.poke(true.B)
    //     dut.clock.step(1)
    //     while(!dut.io.dataValid.get.peek().litToBoolean){ // wait for data to be read out
    //       dut.clock.step(1)
    //     }
    //     for(col <- 0 until(layer1Size(1))){
    //       println(s"get ${SInt2Double(dut.io.dataOut.get(col).peek().litValue(), p.binaryPoint)}" +
    //         s"ref=${p1(row-params1BaseAddr)(col)} row=${row} col=${col}")
    //     }
    //   }
    //   dut.io.instructionValid.poke(false.B)
    // }

    dut.clock.step(40)

    // ====================== VLOAD ========================//
    println("write ones to vector memory")
    instruction = (memoryInstruction.toLong<<30)|(VLOAD<<27)|(25<<22)|(stateAddr<<12)|(1<<(p.binaryPoint))
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)
    while(!dut.io.ready.peek.litToBoolean){
      dut.clock.step(1)
    }

    // ======================= SLOAD ======================//
    println("test SLOAD instruction, state 0, row addr = 6")
    dut.io.state.poke(0.U)
    instruction = ((1.toLong<<30)|(SLOAD<<27)|(stateAddr<<12)|0)
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)
    while(!dut.io.ready.peek.litToBoolean){
      dut.clock.step(1)
    }

    if(p.dev){
      println("read state load into vector memory macAddr1")
      instruction = ((1.toLong<<30)|(VREAD<<27)|(31)<<22|macLayer1Addr<<12|0)
      dut.io.instructionValid.poke(true.B)
      dut.io.instruction.poke(instruction.U)
      dut.clock.step(1)
      dut.io.instructionValid.poke(false.B)
      while(!dut.io.dataValid.get.peek.litToBoolean){
        dut.clock.step(1)
      }
      dut.io.dataOut.get.foreach(s => {println(SInt2Double(s.peek.litValue, p.binaryPoint))})

      dut.clock.step(10)
    }

    // ================================ Test MMV Instruction ============================//
    println("**********************************")
    println("write configuration of the matrix into control registers")
    instruction = (memoryInstruction<<30|MMVC<<27|(layer1Size(1)-1)<<13|(layer1Size(0)))
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    println(s"Perform the matrix multiplication vector layer 1")
    instruction = (dataProcessing<<30|MMV<<27|params1BaseAddr<<12|stateAddr<<7|macLayer1Addr) // vinAddr=6, voutAddr=7
    // vout is where the accumulated sum located
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)

    if(p.dev){
      println("Poke results of MVM of layer 1 and compare with reference values")
      while(!dut.io.weightedSumValid.get.peek().litToBoolean){
        dut.clock.step(1)
        println("waiting for data to be instructionValid")
      }

      var idx = 0
      while(dut.io.weightedSumValid.get.peek().litToBoolean){
        println(s"MAC layer 1 result= ${SInt2Double(dut.io.weightedSum.get.peek().litValue(), p.binaryPoint)} idx=${idx}")
        //dut.io.weightedSum.get.expect(MMVRefVal(idx).S)
        dut.clock.step(1)
        idx = idx + 1
      }
      dut.clock.step(100)
    }

    // ================================ Activation ============================//
    println("test activation block, weighted sum from MMV of layer 1")

    instruction = dataProcessing<<30|ACT<<27|RELU<<25|macLayer1Addr<<15|(layer1Size(0)-1)<<10
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionValid.poke(true.B)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)
    dut.io.instructionValid.poke(false.B)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    if(p.dev){
      println(s"Start reading activated value in layer 1 by VREAD Instruction")
      instruction = ((1.toLong<<30)|(VREAD<<27)|31<<22|macLayer1Addr<<12|0)
      dut.io.instruction.poke(instruction.U)
      dut.io.instructionValid.poke(true.B)
      dut.clock.step(1)
      dut.io.instructionValid.poke(false.B)
      while(!dut.io.dataValid.get.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.io.instructionValid.poke(false.B)
      println(s"Read activated values in layer 1 from hardware")
      val index = (0 until(p.nWeightBanks)).toArray
      (dut.io.dataOut.get, index).zipped.foreach((x, y) => println(s"a=${SInt2Double(x.peek().litValue(), p.binaryPoint)} index=${y}"))
      dut.clock.step(10)
    }

    // ============================ layer 2 ===============================//
    for(row <- params2BaseAddr until(params2BaseAddr + layer2Size(0))){
      for(col <- 0 until(layer2Size(1))){
        instruction = ((1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|
          clipSignBits(Double2SInt(p2(row - params2BaseAddr)(col), p.dataWidth, p.binaryPoint ), 12))
        while(!dut.io.ready.peek().litToBoolean){
          dut.clock.step(1)
        }
     //   println(s"layer 2 row=${row-params2BaseAddr} col=${col} value=${p2(row-params2BaseAddr)(col)}")
        dut.io.instruction.poke(instruction.U)
        dut.io.instructionValid.poke(true.B)
        dut.clock.step(1)
      }
    }
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    // if(p.dev){
    //   println("read weights layer 2")
    //   for(row<- params2BaseAddr until(params2BaseAddr + layer2Size(0))){
    //     var instruction = ((1.toLong<<30)|(MREAD<<27)|((layer2Size(1) - 1))<<22|row<<12|0)
    //     dut.io.instruction.poke(instruction.U)
    //     dut.io.instructionValid.poke(true.B)
    //     dut.clock.step(1)
    //     while(!dut.io.dataValid.get.peek().litToBoolean){ // wait for data to be read out
    //       dut.clock.step(1)
    //     }
    //     for(col <- 0 until(layer2Size(1))){
    //       println(s"get ${SInt2Double(dut.io.dataOut.get(col).peek().litValue(), p.binaryPoint)}" +
    //         s"ref=${p2(row-params2BaseAddr)(col)} row=${row-params2BaseAddr} col=${col}")
    //     }
    //   }
    //   dut.io.instructionValid.poke(false.B)
    // }

    // ====================== VLOAD ========================//
    println("write ones to vector memory")
    instruction = (memoryInstruction.toLong<<30)|(VLOAD<<27)|(25<<22)|(macLayer1Addr<<12)|(1<<(p.binaryPoint))
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)
    while(!dut.io.ready.peek.litToBoolean){
      dut.clock.step(1)
    }

    // ================================ Test MMV Instruction ============================//
    println("*******************************************")
    println("write configuration of the matrix layer 2 into control registers")
    instruction = (memoryInstruction<<30|MMVC<<27|(layer2Size(1)-1)<<13|(layer2Size(0)))
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    println(s"Perform the matrix multiplication vector layer 2")
    instruction = (dataProcessing<<30|MMV<<27|params2BaseAddr<<12|macLayer1Addr<<7|macLayer2Addr)
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)

    if(p.dev){
      println("Poke results of MVM layer 2 and compare with reference values")
      while(!dut.io.weightedSumValid.get.peek().litToBoolean){
        dut.clock.step(1)
//        println("waiting for data to be instructionValid")
      }

      var idx = 0
      while(dut.io.weightedSumValid.get.peek().litToBoolean){
        println(s"MAC result layer 2 = ${SInt2Double(dut.io.weightedSum.get.peek().litValue(), p.binaryPoint)} idx=${idx}")
        dut.clock.step(1)
        idx = idx + 1
      }
      dut.clock.step(100)
    }

    // ================================ Activation ============================//
    println("Activate weighted sum in layer 2")

    instruction = dataProcessing<<30|ACT<<27|RELU<<25|macLayer2Addr<<15|(layer2Size(0)-1)<<10
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionValid.poke(true.B)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)
    dut.io.instructionValid.poke(false.B)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    if(p.dev){
      println(s"Start reading activated value in layer 2")
      instruction = ((1.toLong<<30)|(VREAD<<27)|31<<22|macLayer2Addr<<12|0)
      dut.io.instruction.poke(instruction.U)
      dut.io.instructionValid.poke(true.B)
      dut.clock.step(1)
      dut.io.instructionValid.poke(false.B)
      while(!dut.io.dataValid.get.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.io.instructionValid.poke(false.B)
      println(s"Read activated values in layer 2 from hardware")
      val index = (0 until(p.nWeightBanks)).toArray
      (dut.io.dataOut.get, index).zipped.foreach((x, y) => println(s"a=${SInt2Double(x.peek().litValue(), p.binaryPoint)} index=${y}"))
      dut.clock.step(10)
    }


    // ========================== layer 3 ============================
    for(row <- params3BaseAddr until(params3BaseAddr + layer3Size(0))){
      for(col <- 0 until(layer3Size(1))){
        instruction = ((1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|
          clipSignBits(Double2SInt(p3(row - params3BaseAddr)(col), p.dataWidth, p.binaryPoint ), 12))
        while(!dut.io.ready.peek().litToBoolean){
          dut.clock.step(1)
        }
        dut.io.instruction.poke(instruction.U)
        dut.io.instructionValid.poke(true.B)
        dut.clock.step(1)
      }
    }

    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    // if(p.dev){
    //   println("read weights layer 3")
    //   for(row<- params3BaseAddr until(params3BaseAddr + layer3Size(0))){
    //     var instruction = ((1.toLong<<30)|(MREAD<<27)|((layer3Size(1) - 1))<<22|row<<12|0)
    //     dut.io.instruction.poke(instruction.U)
    //     dut.io.instructionValid.poke(true.B)
    //     dut.clock.step(1)
    //     while(!dut.io.dataValid.get.peek().litToBoolean){ // wait for data to be read out
    //       dut.clock.step(1)
    //     }
    //     for(col <- 0 until(layer3Size(1))){
    //       println(s"get ${SInt2Double(dut.io.dataOut.get(col).peek().litValue(), p.binaryPoint)}" +
    //         s"ref=${p3(row-params3BaseAddr)(col)} row=${row-params3BaseAddr} col=${col}")
    //     }
    //   }
    //   dut.io.instructionValid.poke(false.B)
    // }

        // ====================== VLOAF ========================//
    println("write ones to vector memory")
    instruction = (memoryInstruction.toLong<<30)|(VLOAD<<27)|(12<<22)|(macLayer2Addr<<12)|(1<<(p.binaryPoint))
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)
    while(!dut.io.ready.peek.litToBoolean){
      dut.clock.step(1)
    }

    if(p.dev){
      println(s"Start reading activated value in layer 3 along with bias 1")
      instruction = ((1.toLong<<30)|(VREAD<<27)|31<<22|macLayer2Addr<<12|0)
      dut.io.instruction.poke(instruction.U)
      dut.io.instructionValid.poke(true.B)
      dut.clock.step(1)
      dut.io.instructionValid.poke(false.B)
      while(!dut.io.dataValid.get.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.io.instructionValid.poke(false.B)
      println(s"Read activated values in layer 2 from hardware")
      val index = (0 until(p.nWeightBanks)).toArray
      (dut.io.dataOut.get, index).zipped.foreach((x, y) => println(s"a=${SInt2Double(x.peek().litValue(), p.binaryPoint)} index=${y}"))
      dut.clock.step(10)
    }

    // ================================ Test MMV Instruction ============================//
    println("*******************************************")
    println("write configuration of the matrix layer 3 into control registers")
    instruction = (memoryInstruction<<30|MMVC<<27|(layer3Size(1)-1)<<13|(layer3Size(0)))
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    println(s"Perform the matrix multiplication vector layer 3")
    instruction = (dataProcessing<<30|MMV<<27|params3BaseAddr<<12|macLayer2Addr<<7|macLayer3Addr)
    dut.io.instructionValid.poke(true.B)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)

    if(p.dev){
      println("Poke results of MVM layer 3 and compare with reference values")
      while(!dut.io.weightedSumValid.get.peek().litToBoolean){
        dut.clock.step(1)
//        println("waiting for data to be instructionValid")
      }

      var idx = 0
      while(dut.io.weightedSumValid.get.peek().litToBoolean){
        println(s"MAC result layer 3 = ${SInt2Double(dut.io.weightedSum.get.peek().litValue(), p.binaryPoint)} idx=${idx}")
        dut.clock.step(1)
        idx = idx + 1
      }
      dut.clock.step(100)
    }

    // ================================ Activation ============================//
    println("Activate weighted sum in layer 3")

    instruction = dataProcessing<<30|ACT<<27|RELU<<25|macLayer3Addr<<15|(layer3Size(0)-1)<<10
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionValid.poke(true.B)
    dut.clock.step(1)
    dut.io.instructionValid.poke(false.B)
    dut.io.instructionValid.poke(false.B)
    while(!dut.io.ready.peek().litToBoolean){
      dut.clock.step(1)
    }

    if(p.dev){
      println(s"Start reading activated value in layer 3")
      instruction = ((1.toLong<<30)|(VREAD<<27)|31<<22|macLayer3Addr<<12|0)
      dut.io.instruction.poke(instruction.U)
      dut.io.instructionValid.poke(true.B)
      dut.clock.step(1)
      dut.io.instructionValid.poke(false.B)
      while(!dut.io.dataValid.get.peek().litToBoolean){
        dut.clock.step(1)
      }
      dut.io.instructionValid.poke(false.B)
      println(s"Read activated values in layer 3 from hardware")
      val index = (0 until(p.nWeightBanks)).toArray
      (dut.io.dataOut.get, index).zipped.foreach((x, y) => println(s"a=${SInt2Double(x.peek().litValue(), p.binaryPoint)} index=${y}"))
      dut.clock.step(10)
    }

    println("Test the ACTION Function")
    instruction = (1.toLong<<30)|(ACTION<<27)|(macLayer3Addr)<<17|(nActions-1)<<14
    dut.io.instructionValid.poke(false.B)
    dut.clock.step(1)
    dut.io.instructionValid.poke(true.B)
    dut.clock.step(1)
    while (!dut.io.actionValid.peek().litToBoolean){
      dut.clock.step(1)
    }
    println(s"The best action is ${dut.io.action.peek().litValue()}")

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
      12, 7, true)).withAnnotations(Seq(WriteVcdAnnotation)){
      dut => ProcessingCoreTester(dut,DQNAcceleratorParams.apply())
    }
  }

}

// syntax for test only one main: sbt "test:testOnly package.class"
