package dnn

import chisel3.internal.firrtl.BinaryPoint

object FixedPointSw{

  def apply(number: BigInt, width: Int, binaryPoint: Int): Double = complement2FPSInt(toBinary(number, width), binaryPoint)
  /** Convert a BigInt number to a fixed point number of width: width and the binary point at: binaryPoint **/

  def apply(number: Int, width: Int, binaryPoint: Int): Double = complement2FPSInt(toBinary(number, width), binaryPoint)
  /** Convert a BigInt number to a fixed point number of width: width and the binary point at: binaryPoint **/

  def SInt2FixedPoint(number: BigInt, width:Int, binaryPoint: Int): Double ={
    complement2FPSInt(toBinary(number, width), binaryPoint)

    /** SIn2complement converts a SInt number from hardware and interprets it to software as a fixed point number 
      For example, a 16 bit (1 signed, 8 decimal and 7 integer) SInt returned from Chisel would be intepreted as 
      SInt2FixedPoint(SInt, 16, 8)**/
  }

  def fixedPoint2bin(dec: Double, width: Int, binaryPoint: Int): String ={
    if(dec>0){
      positiFixedPoint2Bin(dec, width: Int, binaryPoint: Int)
    }
    else{
      val binArray = toBinary((Integer.parseInt(invertBinaryString(positiFixedPoint2Bin(scala.math.abs(dec), width, binaryPoint)), 2) + 1), width)
      var decimalPart = ""
      var fractionPart =""
      for(idx <- 0 until(width - binaryPoint)){
        decimalPart = decimalPart + binArray(idx)
      }
      for(idx <- (width - binaryPoint) until width){
        fractionPart = fractionPart + binArray(idx)
      }
      (decimalPart + fractionPart)
    }
  }
  /** fixedpoint2bin convert a double number (pos and negavtive) that contains both integer and decimal part to a binary string
    of length width and the decimal length is equal to binaryPoint. For example: fixedPoint2bin(2.5, 8, 4) = 0010_1000 */

  // convert a positive double fixed point number to binary representation
  def positiFixedPoint2Bin(dec: Double, width: Int, binaryPoint: Int): String = {

    val integerPart = scala.math.floor(dec)
    val decimalPart = dec - integerPart
    var integerBin = ""
    var decimalBin = ""
    if(dec > 0){
      integerBin = toBinary(integerPart.toInt, width - binaryPoint)
      decimalBin = decimal2bin(decimalPart, binaryPoint)
      println(s"Integer=${integerBin} fraction=${decimalBin}")
      (integerBin + decimalBin)
    }
    else{""}
  }

  // convert the binary string to 2's complement number. First bit of the binary string determine the sign of the number
  def complement2FPSInt(bin: String, binaryPoint: Int): Double = {
    var decimal = ""
    var fraction = ""

    val number = Integer.parseInt(invertBinaryString(bin), 2).toInt + 1

    if(number > scala.math.pow(2, bin.length + 1)){ // if overflow
      0
    }
    else{
      val numberBin = toBinary(number, bin.length)
      for(idx <- 1 until(bin.length - binaryPoint)){
        decimal = decimal + numberBin(idx)
      }
      for(idx <- (bin.length - binaryPoint) until(bin.length)){
        fraction = fraction + numberBin(idx)
      }
      if(bin(0) == '1'){ 0 - (Integer.parseInt(decimal, 2).toDouble + bin2decimal(fraction))}
      else {Integer.parseInt(decimal, 2).toDouble + bin2decimal(fraction)}}
    }


  // the invertbinarystring kindda perform ! bitwise operation
  def invertBinaryString(bin: String): String = { // convert a number to a binary string, length binaryWdith of type 2 complement

    var invertedBin = ""
    for (idx <- 0 until bin.length){
      if(bin(idx) == '1'){
        invertedBin = invertedBin + "0"
      }
      else{
        invertedBin = invertedBin + "1"
      }
    }
    invertedBin
  }

  // The toFixedpoint converts the decimalNum of 0's complement to a fixed point number
  def toFixedPoint(decimalNum: Int, binaryWidth:Int,
                   decimalPoint: Int): Double={
    val binArray = toBinary(decimalNum, binaryWidth)
    var decimalPart = ""
    var fractionPart =""
    for(idx <- 0 until(binaryWidth - decimalPoint)){
      decimalPart = decimalPart + binArray(idx)
    }
    for(idx <- (binaryWidth - decimalPoint) until binaryWidth){
      fractionPart = fractionPart + binArray(idx)
    }
    var fraction = 0.toDouble
    for(idx <- 0 until fractionPart.length){
      fraction = fraction + fractionPart(idx).toString.toDouble*math.pow(2, -(idx+1)).toDouble
    }
    Integer.parseInt(decimalPart, 2).toDouble + fraction
  }

  // decimal2bin convert the decimal part of a number to binary representation
  def decimal2bin(decimalPart: Double, width: Int): String = { // convert decimal part to binary. Ex: d"0.75" = b"11". This doesn't
                                                         // account for the decimal point or number before the decimal
    var bin =""
    var temp = decimalPart
    for(idx <- 1 until(width + 1)){
      temp = temp*2
      if(temp.toInt == 1){
        bin = bin + "1"
        temp = temp - 1
      }
      else{ bin = bin + "0"}
    }
    bin
  }

  // bin2decimal converts a binary string to decimal part of number, type of double. Ex: b"11" = d"0.75"
  def bin2decimal(bin: String): Double ={
    var decimal = 0.toDouble
    for( idx <- 0 until(bin.length)){
      decimal = decimal + scala.math.pow(2, - idx - 1).toDouble*(bin(idx).toString.toDouble)
    }
    decimal
  }
  // This function convert an integer to a binary string of length binaryWidth
  def toBinary(digit: Int, binaryWidth: Int) =
    String.format("%" + binaryWidth + "s", digit.toInt.toBinaryString).replace(' ', '0')
  def toBinary(digit: BigInt, binaryWidth: Int) =
    String.format("%" + binaryWidth + "s", digit.toInt.toBinaryString).replace(' ', '0')

}

object Hello extends App{
  var bin = "010001100101"
  println(FixedPointSw(181, 8, 2))
  print(FixedPointSw.complement2FPSInt("10110101", 2))
  println(FixedPointSw(-25, 6,0))
  println(scala.math.floor(3.9))
  println(FixedPointSw.decimal2bin(0.685546875, 9))
  println(FixedPointSw.positiFixedPoint2Bin(3.75.toFloat, 8, 4))
  println(FixedPointSw.fixedPoint2bin(-3.75, 8, 4))
  println("Result")
  println(FixedPointSw.SInt2FixedPoint(-15, 8, 2))
  println(FixedPointSw.toBinary(-15, 8))
  println(FixedPointSw.fixedPoint2bin(2.5, 8, 4))
  println("test 2's complement")
  println(s"${FixedPointSw.complement2FPSInt(FixedPointSw.fixedPoint2bin(2.5, 16, 8), 8)}")
}

// to run a specfic main with sbt, sbt "test:runMain package.mainName"
