//package sislab.dnn
//
//import chisel3._
//import chiseltest._
//import chisel3.tester.RawTester.test
//import org.scalatest._
//import chisel3.internal.firrtl.KnownBinaryPoint
//import chisel3.iotesters._
//
//class NeuronTester(dut: PE) extends FlatSpec with ChiselScalatestTester{
//  behavior of "Neuron"
//  def NeuronTester [T<: PE](dut: T): Unit ={
//    for(a<- 0 until 4){
//      dut.io.in(a).poke((3.2).F(16.W, 8.BP))
//      dut.io.weights(a).poke((3.4).F(16.W, 8.BP))
//    }
//
//    dut.clock.step(4)
//    println("the value is "+ (for(a<-0 until 4) {dut.io.updatedWeights(a).peek.litToDouble.F(8.BP)}))
//
//    val inputs = Array.fill(4)(-2.3)
//    val weights  = Array.fill(4)(2.9)
//    dut.io.inputAvl.poke(true.B)
//    dut.io.y.poke(-28.F(16.W, 8.BP))
//    dut.io.backProp.poke(false.B)
//    dut.io.useReLu.poke(true.B)
//    for(a<- 0 until 4){
//      dut.io.in(a).poke(inputs(a).F(16.W, 8.BP))
//      dut.io.weights(a).poke(weights(a).F(16.W, 8.BP))
//    }
//    dut.clock.step(5)
//    dut.io.backProp.poke(true.B)
//    dut.io.cal.poke(true.B)
//    dut.clock.step(10)
//    for(a<- 0 until(4)){
//      println("the value is "+(dut.io.updatedWeights(a).litToDouble.F(8.BP)))
//    }
//  }
//
//  it should "pass" in {
//    test(new PE(4,16,8 ))
//    {dut => NeuronTester(dut)}
//  }
//}
//
////test(new Neuron(2, Step)) { c =>
////  val inputs = Seq(Seq(-1, -1), Seq(-1, 1), Seq(1, -1), Seq(1, 1))
////
////  // make this a sequence of two values
////  val weights = ???
////
////  // push data through our Neuron and check the result (AND gate)
////  c.reset.poke(true.B)
////  c.clock.step(5)
////  c.reset.poke(false.B)
////  for (i <- inputs) {
////  c.io.in(0).poke(i(0).F(8.BP))
////  c.io.in(1).poke(i(1).F(8.BP))
////  c.io.weights(0).poke(weights(0).F(16.W, 8.BP))
////  c.io.weights(1).poke(weights(1).F(16.W, 8.BP))
////  c.io.out.expect((if (i(0) + i(1) > 0) 1 else 0).F(16.W, 8.BP))
////  c.clock.step(1)
////}
//
//
//class NeuronIOTeser(dut:PE) extends PeekPokeTester(dut){
//  val inputs = Array.fill(4)(2.3)
//  val weights  = Array.fill(4)(2.9)
//  poke(dut.io.inputAvl, true.B)
//  pokeFixedPoint(dut.io.y, 25)
//  poke(dut.io.backProp, false.B)
//  poke(dut.io.useReLu, true.B)
//  for(a<- 0 until 4){
//    pokeFixedPoint(dut.io.in(a), inputs(a))
//    pokeFixedPoint(dut.io.weights(a), weights(a))
//  }
//  poke(dut.io.cal, true.B)
//  step(5)
//  poke(dut.io.cal, false)
//  poke(dut.io.backProp, true.B)
//  step(10)
////  println("the value is "+ (for(a<- 0 until dut.io.weights.getWidth) {peekFixedPoint(dut.io.updatedWeights(a))}))
//  for(a<- 0 until 4){
//    println("updated weights "+a+": "+peekFixedPoint(dut.io.updatedWeights(a)).toString)
//    println("output activation: "+peekFixedPoint(dut.io.a))
//  }
//}
//
//object NeuronIOTeser extends App {
//  chisel3.iotesters.Driver(() => new PE(4,16, 8)) {
//    c => new NeuronIOTeser(c)
//  }
//}