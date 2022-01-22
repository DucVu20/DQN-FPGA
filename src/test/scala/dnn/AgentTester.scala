package dnn
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest._
import scala.math._
import chiseltest.experimental.TestOptionBuilder._
import chiseltest.internal.WriteVcdAnnotation

class AgentTester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "One hot encoder"
  def AgentTester(dut: Agent): Unit = {
    dut.clock.step(10)
    dut.io.loadInitalState.poke(true.B)
    dut.io.x_initial.poke(1.U)
    dut.io.y_initial.poke(1.U)
    dut.io.mazeSize.poke(5.U)
    dut.clock.step(1)
    dut.io.loadInitalState.poke(false.B)
    dut.clock.step(1)
//    for(move <- 0 until(3)){
    for(action <- 0 until(4)){
      dut.io.action.poke(action.U)
      dut.io.actionValid.poke(true.B)
      print(s"action=${action} ref=${AgentRef(dut.io.state.peek.litValue.toInt, action, 5)}")
      dut.clock.step(1)
      println(s" get=${dut.io.state.peek.litValue}")
    }
//    }
  }

  def AgentRef(state: Int, action:Int, maze_size: Int): Int = {
    val x = state%maze_size
    val y = (state/maze_size).toInt
    var x_new = 0
    var y_new = 0

    if(action == 0){
      x_new = x + 1
      y_new = y
    }
    else if (action == 1){
      x_new = x
      y_new = y - 1
    }
    else if (action == 2){
      x_new = x - 1
      y_new = y
    }
    else{
      x_new = x
      y_new = y + 1
    }
    return (x_new + maze_size*y_new)
  }

  it should "pass Agent" in {
    test(new Agent){dut => AgentTester(dut)}
  }

  // "AgentWaveform" should "pass" in{
  //   test(new Agent).withAnnotations(Seq(WriteVcdAnnotation)){
  //     dut => AgentTester(dut)
  //   }
  // }
}
