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


object Hello extends App{
  import FPConverter._
  for (a<- 0 until(1)){
    println("value of a is", a.toString)
  }
}