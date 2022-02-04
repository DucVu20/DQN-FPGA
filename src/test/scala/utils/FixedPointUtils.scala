package utils

import scala.math._
import scala.util.Random._

object fixedPointUtils{

  // def apply(number: Int, binaryPoint: Int): Double = SInt2FP(number, binaryPoint)

  // def apply(number: BigInt, binaryPoint: Int): Double = SInt2FP(number, binaryPoint)

  // def apply(number: Double, width: Int, binaryPoint: Int) = Double2SInt(number, width, binaryPoint)

  // def apply(number: Float, width: Int, binaryPoint: Int) = Float2SInt(number, width, binaryPoint)


  // convert Int to FP, software Double dtype
  def SInt2Double(number: Int, binaryPoint: Int): Double ={
    val scalingFactor = 1/pow(2, binaryPoint) // 2^-BP
    return scalingFactor*(number.toDouble)
  }

  // convert bigInt to FixedPoint, software Double dtype
  def SInt2Double(number: BigInt, binaryPoint: Int): Double ={
    val scalingFactor = 1/pow(2, binaryPoint) // 2^-BP
    return scalingFactor*(number.toDouble)
  }

    // convert Int to FP, software float dtype
  def SInt2Float(number: Int, binaryPoint: Int): Float ={
    return SInt2Double(number, binaryPoint).toFloat
  }

  // convert bigInt to FP, software float dtype
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

    /** Convert a negative Int number (2s complement) into a UInt of length b.  The idea sounds like converting 
    32 bit to b bit. Because (32, b) bits are 1. I want these value become 0 and keep (b, 0) unchanged, and
    bit b is 1**/

  def clipSignBits(number: Int): Int = {
    val minBits = abs(number).toBinaryString.length + 1 // minimum bits for representing the number
    val mask = scala.math.pow(2, minBits).toInt - 1
    return (number&mask) // 
  }

  def clipSignBits(number: Int, width: Int): Int = {
    val mask = scala.math.pow(2, width).toInt - 1
    return (number&mask) // 
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

object activationFunc{
  def ReLU(vector: Array[Int]): Array[Int] = {
    var relu = Array.fill(vector.length){0}
    for(idx <- 0 until(vector.length)){
      if(vector(idx) > 0){
        relu(idx) = vector(idx)
      }
      else{
        relu(idx) = 0
      }
    }
    return relu
  }
}

object Hello extends App{
  import activationFunc._
  import fixedPointUtils._
  val number1 = -53
  val number2 = 1
  val number3 = 70
  val number4 = -207
  val bp      = 7
  println(s"change value ${number1} to fixed point ${SInt2Double(number1, bp)}")
  println(s"change value ${number2} to fixed point ${SInt2Double(number2, bp)}")
  println(s"change value ${number3} to fixed point ${SInt2Double(number3, bp)}")
  println(s"change value ${number4} to fixed point ${SInt2Double(number4, bp)}")

}
