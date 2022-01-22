// package dnn
// import chisel3._
// import chiseltest._
// import org.scalatest._
// import scala.util.Random._
// import mfunc._
// import dfunc._
// import opcode._
// import Activation._
// import utils.matrixUtils._
// import utils.activationFunc._
// import utils.fixedPointUtils._
// import scala.math._
// import java.io._
// import scala.io.Source
// import chiseltest.experimental.TestOptionBuilder._
// import chiseltest.internal.WriteVcdAnnotation


// class DQNAcceleratorTopTester extends FlatSpec with ChiselScalatestTester with Matchers{
//   behavior of "DQN Accelerator"
//   def DQNAcceleratorTopTester[T <: DQNAccelertorTop](dut: T, p: DQNAcceleratorParams): Unit = {
//     println("---------------------------------------------------")
//     val layer1Size = Array(25, 26)
//     val layer2Size = Array(12, 26)
//     val layer3Size = Array(4, 13)

//     val outActAddrL1 = 0
//     val outActAddrL2 = 1
//     val outActAddrL3 = 2
//     val params1BaseAddr = 1
//     val params2BaseAddr = params1BaseAddr + layer1Size(1)
//     val params3BaseAddr = params2BaseAddr + layer2Size(1)

//     val p1 = loadWeightsFromTxt("weights/params_layer1_maze_5.txt", layer1Size)
//     val p2 = loadWeightsFromTxt("weights/params_layer2_maze_5.txt", layer2Size)
//     val p3 = loadWeightsFromTxt("weights/params_layer3_maze_5.txt", layer3Size)

//     var instruction = 0.toLong
//     var instructionMemAddr = 1

//     instruction = 3<<30
//     dut.io.instruction.poke(instruction.U) // default instruction at addr 0 is nop
//     dut.io.instructionAddr.poke(0.U)
//     dut.io.wrEna.poke(true.B)

//     dut.io.pointIR.poke(false.B)
//     dut.clock.step(10)
//     dut.io.instructionAddr.poke(0.U)
//     dut.io.pointIR.poke(true.B) // point the IR to address 0
//     dut.clock.step(1)
//     dut.io.pointIR.poke(false.B)

//     // ================== write weights and biases to the matrix memory banks ==============//
//     println("load instructions along with weights of layer 1 into the instruction memory")
//     for(row <- params1BaseAddr until layer1Size(0)){
//       for(col <- 0 until layer1Size(1)){
//         instruction = (1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|clipSignBits(
//           Double2SInt(p1(row - params1BaseAddr)(col), p.dataWidth, p.binaryPoint), 12)
//         dut.io.instruction.poke(instruction.U)
//         dut.io.instructionAddr.poke(instructionMemAddr.U)
//         dut.io.wrEna.poke(true.B)
//         dut.clock.step(1)
//         instructionMemAddr = instructionMemAddr + 1
//       }
//     }
//     dut.io.wrEna.poke(false.B)

//     println("load weights from the instruction memory to matrix banks")


//     println("Finish loading instruction memory to matrix banks")

//     dut.io.instructionAddr.poke(0.U) // point the IR to address 0
//     dut.io.pointIR.poke(true.B)
//     dut.clock.step(1)
//     dut.io.pointIR.poke(false.B)
//     println("load instructions along with weights of layer 2 into the instruction memory")
//     instructionMemAddr = 0
//     for(row <- params2BaseAddr until layer2Size(0)){
//       for(col <- 0 until layer2Size(1)){
//         instruction = (1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|clipSignBits(
//           Double2SInt(p1(row - params2BaseAddr)(col), p.dataWidth, p.binaryPoint), 12)
//         dut.io.instruction.poke(instruction.U)
//         dut.io.instructionAddr.poke(instructionMemAddr.U)
//         dut.io.wrEna.poke(true.B)
//         dut.clock.step(1)
//         instructionMemAddr = instructionMemAddr + 1
//       }
//     }
//     dut.io.wrEna.poke(false.B)

//     println("load instructions along with weights of layer 3 into the instruction memory")
//     instructionMemAddr = 0
//     dut.io.instructionAddr.poke(0.U) // point the IR to address 0
//     dut.io.pointIR.poke(true.B)
//     dut.clock.step(1)
//     dut.io.pointIR.poke(false.B)
//     for(row <- params3BaseAddr until layer3Size(0)){
//       for(col <- 0 until layer3Size(1)){
//         instruction = (1.toLong<<30)|(MLOAD<<27)|col<<22|row<<12|clipSignBits(
//           Double2SInt(p1(row - params3BaseAddr)(col), p.dataWidth, p.binaryPoint), 12)
//         dut.io.instruction.poke(instruction.U)
//         dut.io.instructionAddr.poke(instructionMemAddr.U)
//         dut.io.wrEna.poke(true.B)
//         dut.clock.step(1)
//         instructionMemAddr = instructionMemAddr + 1
//       }
//     }
//     dut.io.wrEna.poke(false.B)
//     println("Finish loading instruction memory to matrix banks")

    
//     // ================================ perform inference on the engine ===============================//

//     println("**********************************")
//     println("write configuration of the matrix in layer1 into control registers")
//     instruction = (memoryInstruction<<30|MMVC<<27|(layer1Size(1) - 1)<<13|(layer1Size(0)))
//     dut.io.instructionAddr.poke(1.U)
//     dut.io.pointIR.poke(true.B)
//     dut.clock.step(1)
//     dut.io.pointIR.poke(false.B)
//     dut.io.wrEna.poke(true.B)
//     dut.io.instruction.poke(instruction.U)
//     dut.clock.step(1)

//     println("write configuration of the matrix in layer2 into control registers")
//     instruction = (memoryInstruction<<30|MMVC<<27|(layer2Size(1) - 1)<<13|(layer2Size(0)))
//     dut.io.instructionAddr.poke(2.U)
//     dut.io.wrEna.poke(true.B)
//     dut.io.instruction.poke(instruction.U)
//     dut.clock.step(1)

//     println("write configuration of the matrix in layer3 into control registers")
//     instruction = (memoryInstruction<<30|MMVC<<27|(layer3Size(1) - 1)<<13|(layer3Size(0)))
//     dut.io.instructionAddr.poke(3.U)
//     dut.io.wrEna.poke(true.B)
//     dut.io.instruction.poke(instruction.U)
//     dut.clock.step(1)

//     println(s"SLOAD: convert current state of the agent to one hot encoding and load to the vector memory")
//     // the s0 vector is located at address 0
//     instruction = ((1.toLong<<30)|(SLOAD<<27)|(31<<22)|(0<<12)|0)

//     println(s"Write the matrix multiplication vector instruction for layer1")
//     val weightedSumL1Addr = 1
//     instruction = (dataProcessing<<30|MMV<<27|matrixBaseAddr<<12|0<<7|weightedSumAddr)
//     dut.io.instruction.poke(instruction.U)
//     dut.io.instructionAddr.poke(4.U)
//     dut.io.wrEna.poke(true.B)
//     dut.clock.step(1)

//     println(s"activate accumulated sum")
//     instruction = (dataProcessing<<30|ACT<<27|RELU<<25|weightedSumAddr<<15|(voutSize-1)<<10)


//   }

//   "DQNAcceleratorTopWaveform" should "pass" in{
//     test(new DQNAccelertorTop(DQNAcceleratorParams.apply())).withAnnotations(Seq(WriteVcdAnnotation)){
//       dut => DQNAcceleratorTopTester(dut, DQNAcceleratorParams.apply())
//     }
//   }
// }
