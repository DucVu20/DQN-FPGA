package dnn
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest._
import utils._
import scala.util.Random._

class Max4Tester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "Max4"
  def Max4Tester[T<: Max4](dut: T): Unit = {
    val randomList = Array.fill(4){nextInt(1024)*(-1)}
    dut.clock.step(5)
    for(idx <- 0 until(4)){
      dut.io.in(idx).poke(randomList(idx).S)
    }
    dut.clock.step(1)
    println(s"the maximum value found =${dut.io.max.peek().litValue} index =${dut.io.index.peek.litValue}")
    println("numbers in the randomList is")
    randomList.foreach( n => println( n))
  }

  it should "pass Max4 with SInt input dataType" in {
    test(new Max4(16)){dut => Max4Tester(dut)}
  }
}
