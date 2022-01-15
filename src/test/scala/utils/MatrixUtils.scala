package utils
import java.io._
import scala.io.Source

object matrixUtils{
  def loadWeightsFromTxt(filePath: String, dim: Array[Int]): Array[Array[Double]] = {
    val w = Array.ofDim[Double](dim(0), dim(1))
    val w_source = Source.fromResource(filePath).getLines.toArray
    for(row <- 0 until(dim(0))){
      for(col <- 0 until(dim(1))){
        w(row)(col) = w_source(dim(0)*row + col).toDouble
      }
    }
    return w
  }
  def loadBiasFromTxt(filePath: String, dim: Int): Array[Double] = {
    val b = Array.fill(dim){0.toDouble}
    val b_source = Source.fromResource(filePath).getLines.toArray
    for(idx <- 0 until(dim)){
      b(idx) = b_source(idx).toDouble
    }
    return b
  }

  def matrixMultiplyVector(matrix: Array[Array[Int]], vector: Array[Int]): Array[Int] = {
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

  def matrixMultiplyVector(matrix: Array[Array[Float]], vector: Array[Float]): Array[Float] = {
    val row = matrix.length
    val col = matrix(0).length
    var result = Array.fill(row){0.toFloat}
    var idx = 0
    for(r <- 0 until(row)){
      for(c <- 0 until(col)){
        result(idx) = matrix(r)(c)*vector(c) + result(idx)
      }
      idx = idx + 1
    }
    return  result
  }

  def vectorAddVector(vectorA: Array[Int], vectorB: Array[Int]): Array[Int] = {
    var result = Array.fill(vectorA.length){0}
    for(idx <- 0 until(vectorA.length)){
      result(idx) = vectorA(idx) + vectorB(idx)
    }
    return  result
  }

  def vectorAddVector(vectorA: Array[Float], vectorB: Array[Float]): Array[Float] = {
    var result = Array.fill(vectorA.length){0.toFloat}
    for(idx <- 0 until(vectorA.length)){
      result(idx) = vectorA(idx) + vectorB(idx)
    }
    return  result
  }
  def vectorAddVector(vectorA: Array[Double], vectorB: Array[Double]): Array[Double] = {
    var result = Array.fill(vectorA.length){0.toDouble}
    for(idx <- 0 until(vectorA.length)){
      result(idx) = vectorA(idx) + vectorB(idx)
    }
    return  result
  }
}
