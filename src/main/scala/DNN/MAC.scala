package dnn

import chisel3._
import chisel3.util._
import chiseltest._
import chisel3.experimental.{FixedPoint => FP}
import org.scalatest._
import chisel3.internal.firrtl.KnownBinaryPoint

class MAC(inputs: Int, width: Int, binaryPoint: Int) extends Module {

  val io = IO(new Bundle {
    val in      = Input(Vec(inputs, FP(width.W, binaryPoint.BP)))
    val weights = Input(Vec(inputs, FP(width.W, binaryPoint.BP)))
    val out     = Output(FP(width.W, binaryPoint.BP))
    val cal = Input(Bool())
  })
  val mac = io.in.zip(io.weights).map{ case(a:FP, b:FP) => a*b}.reduce(_+_)
  val macReg = RegInit(0.F(width.W, binaryPoint.BP))

  when(io.cal){
    macReg := mac
  }
  io.out := macReg
}
object MAC{
  def apply(inputs: Int, width: Int, binaryPoint: Int): MAC = Module(new MAC(inputs, width, binaryPoint))
}

//class PE(inputs: Int, width: Int, binaryPoint: Int) extends Module {
//  val Step: FP => FP = x => Mux(x(width - 1).asBool(), 0.F(binaryPoint.BP), 1.F(binaryPoint.BP))
//  val ReLU: FP => FP = x => Mux(x(width - 1).asBool(), 0.F(binaryPoint.BP), x)
//
//  val io = IO(new Bundle {
//    val backProp = Input(Bool())
//    val cal = Input(Bool())
//    val useReLu = Input(Bool())
//    val inputAvl = Input(Bool())
//    val in = Input(Vec(inputs, FP(width.W, binaryPoint.BP)))
//    val weights = Input(Vec(inputs, FP(width.W, binaryPoint.BP)))
//    val updatedWeights = Output(Vec(inputs, FP(width.W, binaryPoint.BP)))
//    val y = Input(FP(width.W, binaryPoint.BP))
//    val a = Output(FP(width.W, binaryPoint.BP))
//    val doneBackProp = Output(Bool())
//  })
//  val weights = Reg(Vec(inputs, FP(width.W, binaryPoint.BP)))
//  val inputAct = Reg(Vec(inputs, FP(width.W, binaryPoint.BP)))
//  val outputAct = Reg(FP(width.W, binaryPoint.BP))
//  val mac = MAC(inputs, width, binaryPoint)
//
//  mac.io.in := inputAct
//  mac.io.weights := weights
//  mac.io.cal := io.cal || !io.backProp
//  io.a := outputAct
//
//  when(io.useReLu) {
//    outputAct := ReLU(mac.io.out)
//  }.otherwise {
//    outputAct := Step(mac.io.out)
//  }
//  val dz = (outputAct - io.y)
//
//  for (a <- 0 until io.weights.length) {
//    val dw = (dz*io.weights(a))
//    when(io.inputAvl){
//      weights(a) := io.weights(a)
//      inputAct(a) := io.in(a)
//    }
//    when(io.backProp) {
//      io.updatedWeights(a) := io.weights(a) - (dw(width-1,0)>>6).asFixedPoint(binaryPoint.BP)
//      io.doneBackProp := true.B
//    }.otherwise {
//      io.updatedWeights(a) := 0.F(width.W, binaryPoint.BP)
//      io.doneBackProp := false.B
//    }
//  }
//}


