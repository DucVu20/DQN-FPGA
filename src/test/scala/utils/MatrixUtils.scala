package utils
import java.io._
import scala.io.Source

object matrixUtils{
  def loadWeightsFromTxt(filePath: String, dim: Array[Int]): Array[Array[Double]] = {
    val w = Array.ofDim[Double](dim(0), dim(1))
    val w_source = Source.fromResource(filePath).getLines.toArray
    var idx = 0
    for(row <- 0 until(dim(0))){
      for(col <- 0 until(dim(1))){
        w(row)(col) = w_source(idx).toDouble
        idx = idx + 1
      }
    }
    return w
  }
  def loadBiasFromTxt(filePath: String): Array[Double] = {
    val b_source = Source.fromResource(filePath).getLines.toArray
    val b = Array.fill(b_source.length){0.toDouble}
    for(idx <- 0 until(b_source.length)){
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

  def matrixMultiplyVector(matrix: Array[Array[Double]], vector: Array[Double]): Array[Double] = {
    val row = matrix.length
    val col = matrix(0).length
    var result = Array.fill(row){0.toDouble}
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
