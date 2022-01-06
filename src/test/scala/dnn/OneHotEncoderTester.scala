package dnn
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest._
import scala.math._

class OneHotEncoderTester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "One hot encoder"

  def OneHotEncoderTester(dut: OneHotEncoder, nMemRows: Int): Unit = {
    println("Enable the module")
    dut.io.enable.poke(true.B)
    for(row <- 0 to (nMemRows + 3)){
      dut.io.memRow.poke(row.U)
      dut.clock.step(1)

      println(s"input is ${row} and output is ")
      for(idx <- (nMemRows - 1) to 0 by -1){
        print(dut.io.writeSignal(idx).peek().litValue())
      }
      println(" ")
    }
    println("Disable the module")
    dut.io.enable.poke(false.B)
    for(row <- 0 to (nMemRows + 3)){
      dut.io.memRow.poke(row.U)
      dut.clock.step(1)

      println(s"input is ${row} and output is ")
      for(idx <- (nMemRows - 1) to 0 by -1){
        print(dut.io.writeSignal(idx).peek().litValue())
      }
      println(" ")
    }
  }

  it should "test MemWritesignalDecoder" in {
    test(new OneHotEncoder(32)){dut => OneHotEncoderTester(dut, 32)}
  }

}
