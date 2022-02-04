package dnn
import chisel3._
import chisel3.util._
import chisel3.experimental.{FixedPoint => FP}

object Activation{
  val LINEAR = 0
  val RELU   = 1
//  val RELU6  = 2.U
}

import Activation._
class ActivationFunc(dataWidth: Int) extends Module{
  val io = IO(new Bundle{
    val activationFunc = Input(UInt(2.W))
    val weightedSum    = Input(SInt(dataWidth.W))
    val activation     = Output(SInt(dataWidth.W))
    val ena = Input(Bool())
  })
  when(io.ena){
    when(io.activationFunc === LINEAR.U){
      io.activation := io.weightedSum
    }.otherwise{
      io.activation := Mux(io.weightedSum(io.weightedSum.getWidth-1).asBool(), 0.S, io.weightedSum)
    }
//      .otherwise{ // RELU6
//      io.activation := Mux(io.weightedSum(io.weightedSum.getWidth-1).asBool(), 0.S, Mux(io.weightedSum >= 6.S, 6.S, io.weightedSum))
//    }
  }.otherwise{
    io.activation := 0.S
  }
}

class ActivationBlock(dataWidth: Int, nInputAct: Int) extends Module{
  val io = IO(new Bundle{
    val activationFunc = Input(UInt(2.W))
    val weightedSum    = Vec(nInputAct, Input(SInt(dataWidth.W)))
    val activation     = Vec(nInputAct, Output(SInt(dataWidth.W)))
    val valid          = Output(Bool())
    val ena = Input(Bool())
  })
  // val activationBlocks = Array.fill(nInputAct){Module(new ActivationFunc(dataWidth))}
  // for(i <- 0 until(nInputAct)){
  //   activationBlocks(i).io.activationFunc := io.activationFunc
  //   activationBlocks(i).io.weightedSum := io.weightedSum(i)
  //   activationBlocks(i).io.ena := io.ena
  //   io.activation(i) := activationBlocks(i).io.activation
  // }
  // io.valid := io.ena

  for(i <- 0 until(nInputAct)){
    when(io.ena){
      when(io.activationFunc === LINEAR.U){
        io.activation(i) := io.weightedSum(i)
      }.otherwise{
        io.activation(i) := Mux(io.weightedSum(i)(io.weightedSum(i).getWidth-1).asBool(), 0.S, io.weightedSum(i))
      }
    }.otherwise{
      io.activation(i) := 0.S
    }
  }
  io.valid := io.ena
}

object ActivationBlock{
  def apply(dataWidth: Int, nInputAct: Int): ActivationBlock = Module(new ActivationBlock(dataWidth, nInputAct))
}
