//package dnn
//
////////////////////////////////////////////////////////////////////////////////////////////////
//// The PE in this program is designed to perform fixed-point MAC for both DNN inference and //
//// backpropagation. The PE is also able to perform pure multiplication and addition         //
////                            (for backprop).                                               //
////                         Designed by: Vu D. Le                                            //
////    at Information Technology Institute, Vietnam Natioal University                       //
////                          date: November, 2021                                            //
////////////////////////////////////////////////////////////////////////////////////////////////
//
//
//import chisel3._
//import chisel3.util._
//import chisel3.experimental.{FixedPoint => FP}
//
//object PEArithmetic{
//  val mul = 0.U
//  val add = 1.U
//  val mac = 2.U
//  val nop = 3.U
//}
//
//import PEArithmetic._
//
//// the PE can sometime store activations in local memory to reuse
//class PEControl extends Bundle{
//  val clearWeightedSum = Input(Bool()) // z = sum(w*a)
//  val opcode = Input(UInt(2.W))
//  val activate = Input(Bool())
//  val activationFunc = Input(UInt(2.W))
//}
//
//class PE(dataWidth: Int, binaryPoint: Int) extends Module{
//  val width = dataWidth
//  val BP = binaryPoint
//  // simple version, single cycle
//  val io = IO(new Bundle{
//    val weight = Input(SInt(dataWidth.W))
//    val inputAct = Input(SInt(dataWidth.W))
//    val result = Output(SInt(dataWidth.W))
//    val outputAct = Output(SInt(dataWidth.W))
//    val PEControl = Input(new PEControl)
//    val outputValid = Output(Bool())
//    val outputActValid = Output(Bool())
//  })
//
//  val adder = Adder(2*dataWidth)
//  val multiplier = Multiplier(dataWidth)
//  val ActivationFuncUnit= ActivationFunc(dataWidth, binaryPoint)
//
//  val mulResult = RegInit(0.S(dataWidth.W))
//  val accumulator = RegInit(0.S((2*dataWidth).W))
//  val outputAct = RegInit(0.S((2*dataWidth).W))
//  val outputValid = RegInit(false.B)
//
//  multiplier.io.a := 0.S
//  multiplier.io.b := 0.S
//  adder.io.a := 0.S
//  adder.io.b := 0.S
//  io.outputValid := false.B
//
//  when(io.PEControl.activate){
//    when(io.PEControl.opcode === mul){
//      multiplier.io.a := io.weight
//      multiplier.io.b := io.inputAct
//      io.result := multiplier.io.out
//      outputValid := true.B
//    }.elsewhen(io.PEControl.opcode === add){
//      adder.io.a := io.weight
//      adder.io.b := io.inputAct
//      io.result := adder.io.out
//      outputValid := true.B
//    }.elsewhen(io.PEControl.opcode === mac){
//      multiplier.io.a := io.weight
//      multiplier.io.b := io.inputAct
////      mulResult := multiplier.io.out
//
//      adder.io.a := multiplier.io.out
//      adder.io.b := accumulator
//      accumulator := adder.io.out
//
//      io.result := accumulator(width + binaryPoint, binaryPoint).asSInt()
//      outputValid := RegNext(RegNext(true.B))
//    }.otherwise{
//      io.result := accumulator
//      outputValid := false.B
//    }
//  }.otherwise{
//    io.result := 0.S
//    outputValid := false.B
//  }
//
//  when(io.PEControl.clearWeightedSum){
//    accumulator := 0.S
//  }
//  ActivationFuncUnit.io.activationFunc := io.PEControl.activationFunc
//  ActivationFuncUnit.io.in := accumulator(width + binaryPoint, binaryPoint).asSInt()
//
//  io.outputAct := ActivationFuncUnit.io.activation
//  io.outputActValid := ActivationFuncUnit.io.valid
//  io.outputValid := outputValid
//}
//
//object PE{
//  def apply(dataWidth: Int, binaryPoint: Int): PE =  Module(new PE(dataWidth: Int, binaryPoint: Int))
//}
