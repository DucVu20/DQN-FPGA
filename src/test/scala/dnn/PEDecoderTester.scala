package dnn
import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest._
import scala.math._

class PEDecoderTester extends FlatSpec with ChiselScalatestTester with Matchers{
  behavior of "PE_Decoder"

  def EnableSignalDecoder(dut: EnableSignalDecoder): Unit = {
//    println("Disable the decoder")
//    dut.io.enable.poke(false.B)
//    for(nPE <- 0 to (dut.numberOfPE + 3).toInt){
//      dut.io.PEs.poke(nPE.U)
//      dut.clock.step(1)
//
//      println(s"input is ${nPE} and output is ")
//      for(idx <- (dut.numberOfPE - 1) to 0 by -1){
//        print(dut.io.activatedSignals(idx).peek().litValue())
//      }
//      println(" ")
//    }
    println("Enable the decoder")
    dut.io.enable.poke(true.B)
    for(nPE <- 0 to (dut.numberOfPE + 3).toInt){
      dut.io.PEs.poke(nPE.U)
      dut.clock.step(1)

      println(s"input is ${nPE} and output is ")
      for(idx <- (dut.numberOfPE - 1) to  0 by -1){
        print(dut.io.activatedSignals(idx).peek().litValue())
      }
      println(" ")
    }
  }

  it should "test PEDecoder" in {
    test(new EnableSignalDecoder(32)){dut => EnableSignalDecoder(dut)}
  }

}
