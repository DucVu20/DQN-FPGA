package sislab.cnn

import chisel3._
import chisel3.util._

class ConvLayer[T <: Data](filterSize : Int, decimalWidth: Int,
  dataType: T ) extends Module{
  val io = IO( new Bundle{
    val inputFeature = Input(Vec(filterSize, dataType))
    val weights = Input(Vec(filterSize, dataType))
    val featureMaps = Output(Vec(filterSize, dataType))
  })
}
