package dnn
import scala.io.Source
import java.io._
import utils.matrixUtils._

object playground extends App{

  val w1_source = "weights/weights_layer1_maze_5.txt"
  val w1 = loadWeightsFromTxt(w1_source, Array(25, 25))
  w1.foreach(x => x.foreach(y => println(y)))
  val b1_source = "weights/bias_layer1_maze_5.txt"
  println("============================")
  val b1 = loadBiasFromTxt(b1_source)
  b1.foreach(x => println(x))
}

