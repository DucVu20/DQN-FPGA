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


class DQNAcceleratorTopTester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "DQN Accelerator"
  def DQNAcceleratorTopTester[T <: DQNAccelertorTop](dut: T, p: DQNAcceleratorParams): Unit = {
    println("--------------------------------------------------------------")
    // neural network configuration
    val layer1Size = Array(25, 26)
    val layer2Size = Array(12, 26)
    val layer3Size = Array(4, 13)

    val p1 = loadWeightsFromTxt("DQNMaze/weights/params_layer1_maze_5.txt", layer1Size)
    val p2 = loadWeightsFromTxt("DQNMaze/weights/params_layer2_maze_5.txt", layer2Size)
    val p3 = loadWeightsFromTxt("DQNMaze/weights/params_layer3_maze_5.txt", layer3Size)

    val maze              = Source.fromResource("DQNMaze/weights/environment.txt").getLines.toArray
    val swInferenceResult = Source.fromResource("DQNMaze/weights/inference_result.txt").getLines.toArray
    val configuration     = Source.fromResource("DQNMaze/weights/configuration.txt").getLines.toArray

    // read the software configuration of the maze agent
    val mazeSizeX = configuration(0).toInt
    val x_initial = configuration(1).toInt
    val y_initial = configuration(2).toInt

    val params1BaseAddr = 0
    val params2BaseAddr = params1BaseAddr + layer1Size(1)
    val params3BaseAddr = params2BaseAddr + layer2Size(1)

    // specify output activation address of each layer
    val stateAddr     = 0
    val macLayer1Addr = 1
    val macLayer2Addr = 2
    val macLayer3Addr = 3
    val nActions      = 4

    println(s"weight dataWidth ${p.dataWidth} BP=${p.binaryPoint} instructionMemDepth=${p.instructionMemDepth}")

    var instruction = 0.toLong
    var instructionMemAddr = 1

    instruction = nop.toLong<<30
    dut.io.instruction.poke(instruction.U) // default instruction at addr 0 is nop
    dut.io.instructionAddr.poke(0.U)
    dut.io.wrEna.poke(true.B)
    dut.clock.step(1)
    dut.io.wrEna.poke(false.B)

    dut.io.instructionAddr.poke(1.U)
    dut.io.pointIR.poke(true.B) // point the IR to address 0
    dut.clock.step(1)
    dut.io.pointIR.poke(false.B)

    //=================== write maze information into the DQNTop ======================//
    println("******************************************************************************************")
    println("begin writing maze into environment on-chip buffer")

    dut.io.x_initial.poke(x_initial.U)
    dut.io.y_initial.poke(y_initial.U)
    dut.io.mazeSize.poke(mazeSizeX.U)
    dut.io.loadInitalState.poke(true.B)
    dut.clock.step(1)
    dut.io.loadInitalState.poke(false.B)

    dut.io.wrEnaEnv.poke(true.B)
    for(idx <- 0 until(25)){
      dut.io.rewardIn.poke(maze(idx).toInt.S)
      dut.io.state.poke(idx.U)
      dut.clock.step(1)
    }
    dut.io.wrEnaEnv.poke(false.B)

    // ================== write trained parameters to the matrix memory banks ==============//
    println("******************************************************************************************")
    println("load instructions along with weights of layer 1 into the instruction memory")
    for(row <- params1BaseAddr until layer1Size(0) + params1BaseAddr){
      for(col <- 0 until layer1Size(1)){
        instruction = (1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|clipSignBits(
          Double2SInt(p1(row - params1BaseAddr)(col), p.dataWidth, p.binaryPoint), 12)
        dut.io.instruction.poke(instruction.U)
        dut.io.instructionAddr.poke(instructionMemAddr.U)
        dut.io.wrEna.poke(true.B)
        dut.clock.step(1)
        instructionMemAddr = instructionMemAddr + 1
      }
    }
    instruction = 3.toLong<<30
    dut.io.instructionAddr.poke(instructionMemAddr.U)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.wrEna.poke(false.B)
    dut.clock.step(4)

    println("load weights layer 2 from the instruction memory to matrix banks")
    dut.io.runProgram.poke(true.B)
    dut.clock.step(1)
    dut.io.runProgram.poke(false.B)
    dut.clock.setTimeout(layer1Size(0)*layer1Size(1)*4 + 50)
    for(row <- params1BaseAddr until layer1Size(0) + params1BaseAddr){
      for(col <- 0 until layer1Size(1)){
        dut.clock.step(4)
      }
    }
    println("Finish loading instruction memory to matrix banks")

    println("load instructions along with weights of layer 2 into the instruction memory")
    dut.io.instructionAddr.poke(1.U) // point the IR to address 0
    dut.io.pointIR.poke(true.B)
    dut.clock.step(1)
    dut.io.pointIR.poke(false.B)
    instructionMemAddr = 1
    for(row <- params2BaseAddr until layer2Size(0) + params2BaseAddr){
      for(col <- 0 until layer2Size(1)){
        instruction = (1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|clipSignBits(
          Double2SInt(p2(row - params2BaseAddr)(col), p.dataWidth, p.binaryPoint), 12)
        dut.io.instruction.poke(instruction.U)
        dut.io.instructionAddr.poke(instructionMemAddr.U)
        dut.io.wrEna.poke(true.B)
        dut.clock.step(1)
        instructionMemAddr = instructionMemAddr + 1
      }
    }
    instruction = 3.toLong<<30
    dut.io.instructionAddr.poke(instructionMemAddr.U)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.wrEna.poke(false.B)
    dut.clock.step(4)

    println("load weights layer 2 from the instruction memory to matrix banks")
    dut.io.runProgram.poke(true.B)
    dut.clock.step(1)
    dut.io.runProgram.poke(false.B)
    dut.clock.setTimeout(layer2Size(0)*layer2Size(1)*4 + 50)
    for(row <- params2BaseAddr until layer2Size(0) + params2BaseAddr){
      for(col <- 0 until layer2Size(1)){
        dut.clock.step(4)
      }
    }
    println("Finish loading instruction memory to matrix banks")

    println("load instructions along with weights of layer 3 into the instruction memory")
    instructionMemAddr = 1
    dut.io.instructionAddr.poke(1.U) // point the IR to address 0
    dut.io.pointIR.poke(true.B)
    dut.clock.step(1)
    dut.io.pointIR.poke(false.B)
    for(row <- params3BaseAddr until layer3Size(0) + params3BaseAddr){
      for(col <- 0 until layer3Size(1)){
        instruction = (1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|clipSignBits(
          Double2SInt(p3(row - params3BaseAddr)(col), p.dataWidth, p.binaryPoint), 12)
        dut.io.instruction.poke(instruction.U)
        dut.io.instructionAddr.poke(instructionMemAddr.U)
        dut.io.wrEna.poke(true.B)
        dut.clock.step(1)
        instructionMemAddr = instructionMemAddr + 1
      }
    }
    instruction = 3.toLong<<30
    dut.io.instructionAddr.poke(instructionMemAddr.U)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)
    dut.io.wrEna.poke(false.B)
    println("Finish loading instruction memory to matrix banks")

    println("load weights layer 3 from the instruction memory to matrix banks")
    dut.io.runProgram.poke(true.B)
    dut.clock.step(1)
    dut.io.runProgram.poke(false.B)
    dut.clock.setTimeout(layer3Size(0)*layer3Size(1)*4 + 50)
    for(row <- params3BaseAddr until layer3Size(0) + params3BaseAddr){
      for(col <- 0 until layer3Size(1)){
        dut.clock.step(4)
      }
    }


    // ================================ perform inference on the engine ===============================//
    println("******************************************************************************************")
    println("write inference instruction for the accelerator core")

    println("SLOAD: convert current state of the agent to one hot encoding and load to the vector memory: addr=1")
    // the s0 vector is located at address 0
    instruction = (1.toLong<<30)|(SLOAD<<27)|(stateAddr<<12)|0
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionAddr.poke(1.U)
    dut.io.wrEna.poke(true.B)
    dut.io.pointIR.poke(true.B)
    dut.clock.step(1)
    dut.io.pointIR.poke(false.B)

    println("load constant 1 in the vector memory for the bias: addr=2")
    instruction = memoryInstruction.toLong<<30|VLOAD<<27|(layer1Size(1) - 1)<<22|stateAddr<<12|1<<p.binaryPoint
    dut.io.instructionAddr.poke(2.U)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)

    println("write configuration of the matrix in layer1 into control registers: addr=3")
    instruction = memoryInstruction.toLong<<30|MMVC<<27|(layer1Size(1) - 1)<<13| layer1Size(0)
    dut.io.instructionAddr.poke(3.U)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)

    println(s"Write the matrix multiplication vector instruction for layer1: addr=4")
    instruction = dataProcessing<<30|MMV<<27|params1BaseAddr<<12|0<<7|macLayer1Addr
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionAddr.poke(4.U)
    dut.io.wrEna.poke(true.B)
    dut.clock.step(1)

    println(s"activate accumulated sum with ReLU: addr=5")
    instruction = dataProcessing<<30|ACT<<27|RELU<<25|macLayer1Addr<<15|(layer1Size(0)-1)<<10
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionAddr.poke(5.U)
    dut.clock.step(1)

    println("load constant 1 in the vector memory for the bias layer 2: addr=6")
    instruction = memoryInstruction.toLong<<30|VLOAD<<27|(layer2Size(1) - 1)<<22|macLayer1Addr<<12|1<<p.binaryPoint
    dut.io.instructionAddr.poke(6.U)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)

    println("write configuration of the matrix in layer2 into control registers: addr=7")
    instruction = memoryInstruction<<30|MMVC<<27|(layer2Size(1) - 1)<<13| layer2Size(0)
    dut.io.instructionAddr.poke(7.U)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)

    println(s"Write the matrix multiplication vector instruction for layer2: addr=8")
    instruction = dataProcessing<<30|MMV<<27|params2BaseAddr<<12|macLayer1Addr<<7|macLayer2Addr
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionAddr.poke(8.U)
    dut.clock.step(1)

    println(s"activate accumulated sum with ReLU: addr=9")
    instruction = dataProcessing<<30|ACT<<27|RELU<<25|macLayer2Addr<<15|(layer2Size(0)-1)<<10
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionAddr.poke(9.U)
    dut.clock.step(1)

    println("load constant 1 in the vector memory for the bias in layer 3: addr=10")
    instruction = memoryInstruction.toLong<<30|VLOAD<<27|(layer3Size(1) - 1)<<22|macLayer2Addr<<12|1<<p.binaryPoint
    dut.io.instructionAddr.poke(10.U)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)

    println("write configuration of the matrix in layer3 into control registers: addr=11")
    instruction = memoryInstruction<<30|MMVC<<27|(layer3Size(1) - 1)<<13| layer3Size(0)
    dut.io.instructionAddr.poke(11.U)
    dut.io.instruction.poke(instruction.U)
    dut.clock.step(1)

    println("Write the matrix multiplication vector instruction for layer3: addr=12")
    instruction = dataProcessing<<30|MMV<<27|params3BaseAddr<<12|macLayer2Addr<<7|macLayer3Addr
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionAddr.poke(12.U)
    dut.clock.step(1)

    println("activate accumulated sum with ReLU: addr=13")
    instruction = dataProcessing<<30|ACT<<27|RELU<<25|macLayer3Addr<<15|(layer3Size(0)-1)<<10
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionAddr.poke(13.U)
    dut.clock.step(1)

    println("choose the action with greatest Q-value: addr=14")
    instruction = (dataProcessing.toLong<<30)|(ACTION<<27)|(macLayer3Addr)<<17|(nActions-1)<<14|0
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionAddr.poke(14.U)
    dut.clock.step(1)

    println("inference instruction: addr=15")
    instruction = (dataProcessing.toLong<<30)|(INFER<<27)|0<<17|1<<7
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionAddr.poke(15.U)
    dut.clock.step(1)

    println("nop instruction: addr=16")
    instruction = nop.toLong<<30
    dut.io.instruction.poke(instruction.U)
    dut.io.instructionAddr.poke(16.U)
    dut.clock.step(1)

    dut.io.wrEna.poke(false.B)
    dut.clock.step(100)
    println("******************************************************************************************")
    println(s"hardware information: weight dataWidth=${p.dataWidth} binaryPoint=${p.binaryPoint}")
    println("starting inference")
    dut.io.runProgram.poke(true.B)
    dut.clock.step(1)
    dut.io.runProgram.poke(false.B)

    dut.clock.setTimeout(9000)
    var idx = 0
    while(!dut.io.doneInference.peek.litToBoolean){
      dut.clock.step(1)
      if(dut.io.newStateFound.peek.litToBoolean){
        println(s"Inference result: new state = ${dut.io.nextState.peek.litValue}" +
          s" software reference state = ${swInferenceResult(idx).toInt}")
        idx = idx + 1
        if(dut.io.doneInference.peek.litToBoolean){
          println(s"the correct reward location is: ${configuration(3)}")
        }
      }
    }
    dut.clock.step(300)
  }

  "DQNAcceleratorTopWaveform" should "pass" in{
    test(new DQNAccelertorTop(DQNAcceleratorParams.apply())).withAnnotations(Seq(WriteVcdAnnotation)){
      dut => DQNAcceleratorTopTester(dut, DQNAcceleratorParams.apply())
    }
  }
}
