package dnn

import chisel3._
import chisel3.util._
import chisel3.experimental.{FixedPoint => FP}


class PESInt(dataWidth: Int, binaryPoint: Int) extends Module{
  val width = dataWidth
  val BP = binaryPoint
  // simple version, single cycle
  val io = IO(new Bundle{
    val weight = Input(SInt(dataWidth.W))
    val inputAct = Input(SInt(dataWidth.W))
    val weightValid = Input(Bool())
    val inputActValid = Input(Bool())
    val clear = Input(Bool())
    val weightedSum = Output(SInt(dataWidth.W))
//    val outputValid = Output(Bool())
  })


  val mulResult = RegInit(0.S(dataWidth.W))
  val accumulator = RegInit(0.S((2*dataWidth).W))
  val weightReg = RegInit(0.S(dataWidth.W))
  val inputActReg = RegInit(0.S(dataWidth.W))
  val inputActValidReg = RegInit(false.B)
  val weightValidReg = RegInit(false.B)
  
  when(io.weightValid){
    weightValidReg := true.B
    weightReg := io.weight
  }
  when(io.inputActValid){
    inputActValidReg := true.B
    inputActReg := io.inputAct
  }
  when(io.clear){
    accumulator := 0.S
    mulResult := 0.S
  }

  when(io.weightValid && io.inputActValid){ // when both are availabe, perform MAC
//    mulResult := inputActReg * weightReg // multiply
    accumulator := inputActReg * weightReg + accumulator // MAC
  }
  io.weightedSum := accumulator(dataWidth + binaryPoint, binaryPoint).asSInt() // quantize 2*dataWidth to dataWidth
}

class PE(dataWidth: Int, binaryPoint: Int) extends Module{
  val width = dataWidth
  val BP = binaryPoint
  // simple version, single cycle
  val io = IO(new Bundle{
    val weight = Input(FP(dataWidth.W, binaryPoint.BP))
    val inputAct = Input(FP(dataWidth.W, binaryPoint.BP))
    val weightValid = Input(Bool())
    val inputActValid = Input(Bool())
    val clear = Input(Bool())
    val weightedSum = Output(FP(dataWidth.W, binaryPoint.BP))
    val testPort = Output(SInt(8.W))
    val overflow = Output(Bool())
    val in = Input(SInt(8.W))
//    val outputValid = Output(Bool())
  })
  val a =WireInit(0.S(15.W))
  a := 127.S + io.in
  io.testPort := a
  io.overflow := a(8).asBool()

  val mulResult = RegInit(0.F(dataWidth.W, binaryPoint.BP))
  val accumulator = RegInit(0.F((2*dataWidth).W, (2*binaryPoint).BP))
  val weightReg = RegInit(0.F(dataWidth.W, binaryPoint.BP))
  val inputActReg = RegInit(0.F(dataWidth.W, binaryPoint.BP))
  val inputActValidReg = RegInit(false.B)
  val weightValidReg = RegInit(false.B)
  
  when(io.weightValid){
    weightValidReg := true.B
    weightReg := io.weight
  }
  when(io.inputActValid){
    inputActValidReg := true.B
    inputActReg := io.inputAct
  }
  when(io.clear){
    accumulator := 0.F((2*dataWidth).W, (2*binaryPoint).BP)
    mulResult := 0.F((2*dataWidth).W, (2*binaryPoint).BP)
  }

  when(io.weightValid && io.inputActValid){ // when both are availabe, perform MAC
//    mulResult := inputActReg * weightReg // multiply
    accumulator := inputActReg * weightReg + accumulator // MAC
  }
  io.weightedSum := accumulator(dataWidth + binaryPoint, binaryPoint).asFixedPoint(binaryPoint.BP) // quantize 2*dataWidth to dataWidth
}
