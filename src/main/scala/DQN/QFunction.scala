package sislab.dqn

import chisel3._
import chisel3.util._
import chisel3.experimental.{FixedPoint => FP}

class QFunction(width: Int, binaryPoint: Int) extends Module {
    val io = IO(new Bundle {
        val currentQ = Input(FP(width.W, binaryPoint.BP))
        val QPrimeMax = Input(FP(width.W, binaryPoint.BP))
        val QUpdated = Output(FP(width.W, binaryPoint.BP))
        val cal = Input(Bool())
        val reward = Input(FP(width.W, binaryPoint.BP))
    })

    when(io.cal){
        //io.Q_updated :=(Q_s_a+reward*128.S)/2.S +(io.Q_prime_max*2.S/5.S )
        io.QUpdated := (io.currentQ >> 1).asSInt + (io.reward << 6).asSInt + (io.QPrimeMax << 1).asSInt / 5.S
        //io.Q_updated := (Q_s_a >> 1).asSInt + (reward << 6).asSInt + (io.Q_prime_max >> 2).asSInt + (io.Q_prime_max >> 3).asSInt + (io.Q_prime_max >> 4).asSInt
    }otherwise{
        io.QUpdated:=0.S
    }
}
