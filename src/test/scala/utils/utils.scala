package utils

import scala.math._
import scala.util.Random._

object FPConverter{

  // def apply(number: Int, binaryPoint: Int): Double = SInt2FP(number, binaryPoint)

  // def apply(number: BigInt, binaryPoint: Int): Double = SInt2FP(number, binaryPoint)

  // def apply(number: Double, width: Int, binaryPoint: Int) = Double2SInt(number, width, binaryPoint)

  // def apply(number: Float, width: Int, binaryPoint: Int) = Float2SInt(number, width, binaryPoint)


  // convert Int to FP
  def SInt2Double(number: Int, binaryPoint: Int): Double ={
    val scalingFactor = 1/pow(2, binaryPoint) // 2^-BP
    return scalingFactor*(number.toDouble)
  }

  // convert bigInt to FixedPoint
  def SInt2Double(number: BigInt, binaryPoint: Int): Double ={
    val scalingFactor = 1/pow(2, binaryPoint) // 2^-BP
    return scalingFactor*(number.toDouble)
  }

    // convert Int to FP
  def SInt2Float(number: Int, binaryPoint: Int): Float ={
    return SInt2Double(number, binaryPoint).toFloat
  }

  // convert bigInt to FixedPoint
  def SInt2Float(number: BigInt, binaryPoint: Int): Float ={
    return SInt2Double(number, binaryPoint).toFloat
  }

  /** Convert double decimal numbers to SInt. The default type when declare a decimal number in scala is Double**/
  def Double2SInt(number: Double, width:Int, binaryPoint: Int): Int ={
    val IntPart = abs(number.toInt)
    if(IntPart > pow(2, width - binaryPoint)){
      println(s"The entered number ${number} cannot be converted to FixedPoint with width ${width} and BP ${binaryPoint}")
      return 0
    }
    else{
      return (number*pow(2, binaryPoint)).toInt
    }
  }

  /** Float decimal numbers to SInt **/
  def Float2SInt(number: Float, width:Int, binaryPoint: Int): Int ={
    val IntPart = abs(number.toInt)
    if(IntPart > pow(2, width - binaryPoint)){
      println(s"The entered number ${number} cannot be converted to FixedPoint with width ${width} and BP ${binaryPoint}")
      return 0
    }
    else{
      return (number*pow(2, binaryPoint).toFloat).toInt
    }
  }

  /** convert Int to binary string**/
  def toBinary(digit: Int, binaryWidth: Int) =
    String.format("%" + binaryWidth + "s", digit.toInt.toBinaryString).replace(' ', '0')

  /** convert Int to binary string**/
  def toBinary(digit: BigInt, binaryWidth: Int) =
    String.format("%" + binaryWidth + "s", digit.toInt.toBinaryString).replace(' ', '0')

  /** convert Int to binary string with the dot to seperate the decimal and integer part**/
  def toBinaryDot(digit: Int, binaryWidth: Int): String={
    val binaryNum = toBinary(digit, binaryWidth)
    var binaryNumWithDot = ""
    for(idx <- 0 until(binaryNum.length)){
      binaryNumWithDot = binaryNumWithDot + binaryNum(idx)
      if(idx == (binaryNum.length - binaryWidth - 1)){
        binaryNumWithDot = binaryNumWithDot + "."
      }
    }
    return binaryNumWithDot
  }
}
object MatrixTools{
  def MMVRef(matrix: Array[Array[Int]], vector: Array[Int]): Array[Int] ={
    val row = matrix.length
    val col = matrix(0).length
    var result = Array.fill(row){0}
    var idx = 0
    for(r <- 0 until(row)){
      for(c <- 0 until(col)){
        result(idx) = matrix(r)(c)*vector(c) + result(idx)
      }
      idx = idx + 1
    }
    return  result
  }
}

object Hello extends App{
  import FPConverter._
  val randomWeightMatrix = Array.ofDim[Int](2, 3) // create a ref random matrix
  randomWeightMatrix(0)(0) = 1
  randomWeightMatrix(0)(1) = 2
  randomWeightMatrix(0)(2) = 3
  randomWeightMatrix(1)(0) = 4
  randomWeightMatrix(1)(1) = 5
  randomWeightMatrix(1)(2) = 6
  var activation = Array.fill(3){2}
  val result = MatrixTools.MMVRef(randomWeightMatrix, activation)
  for(a<- 0 until(2)){
    println(s"result is ${result(a)}")
  }


}