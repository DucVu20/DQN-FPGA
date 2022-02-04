//package dnn
//
///////////////////////////////////////////////////////////////////////////////////
//// SoC integration of the accelerator with a RISC-V core on Chipyard platform. //
////                         ITI-VNU, January 2022                               //
///////////////////////////////////////////////////////////////////////////////////
//import chisel3._
//import chisel3.util._
//import chisel3.experimental.{IntParam, BaseModule}
//import freechips.rocketchip.amba.axi4._
//import freechips.rocketchip.subsystem.BaseSubsystem
//import freechips.rocketchip.config.{Parameters, Field, Config}
//import freechips.rocketchip.diplomacy._
//import freechips.rocketchip.regmapper.{HasRegMap, RegField}
//import freechips.rocketchip.tilelink._
//import freechips.rocketchip.util._
//
//
//object DQNAccelertorMMIO{
//  val instructionAddr = 0x00
//  val instruction     = 0x04
//  val main            = 0x08
//  val rewardIn        = 0x0C
//  val initialState    = 0x10
//  val mazeSize        = 0x14
//  val nextState       = 0x18
//}
//
//class DQNAccelertorIO(val p: DQNAcceleratorParams) extends Bundle{
//  val clock = Input(Clock())
//  val reset = Input(Bool())
//
//  val instruction = Input(UInt(32.W))
//  val instructionAddr = Input(UInt(log2Ceil(p.instructionMemDepth).W))
//  val wrEna = Input(Bool())
//  val pointIR = Input(Bool()) // point IR to addr specified by instructionAddr
//  val doneInference   = Output(Bool())
//
//  val rewardIn        = Input(UInt(2.W))
//  val state           = Input(UInt(log2Ceil(p.maxMazeSize).W))
//  val wrEnaEnv        = Input(Bool())
//
//  val x_initial       = Input(UInt(3.W))
//  val y_initial       = Input(UInt(3.W))
//  val loadInitalState = Input(Bool())
//  val mazeSize        = Input(UInt(3.W))
//  val newStateFound   = Output(Bool())
//  val nextState       = Output(Bool())
//
//  val dataValid        = if(p.dev) Some(Output(Bool())) else None
//  val dataOut          = if(p.dev) Some(Vec(p.nWeightBanks, Output(SInt(p.dataWidth.W)))) else None
//  val weightedSum      = if(p.dev) Some(Output(SInt(p.dataWidth.W))) else None
//  val weightedSumValid = if(p.dev) Some(Output(Bool())) else None
//}
//trait HasDQNAcceleratorIO extends BaseModule{
//  val io = IO(new DQNAccelertorIO(DQNAcceleratorParams.apply()))
//}
//
//trait DQNAccelerPortIO extends Bundle{
//  val doneInference   = Output(Bool())
//}
//
//class DQNAccelertor(p: DQNAcceleratorParams) extends Module with HasDQNAcceleratorIO{
//  val acclerator = Module(new DQNAccelertorTop(p.apply()))
//}
//
//trait DQNAcceleratorModule extends HasRegMap{
//  val io: CPIPortIO
//  implicit val p: Parameters
//  def params: CPIParams
//  val clock: Clock
//  val reset: Reset
//
//  regmap(
//    DQNAccelertorMMIO.interfaceSetup -> Seq(
//      RegField.w(CPISetupReg.getWidth, CPISetupReg)),
//    DQNAccelertorMMIO.I2CPrescalerHigh -> Seq(
//      RegField.w(8, prescalerHigh)
//    )
//  )
//}
//
//class DQNTL(params: DQNAcceleratorParams,beatBytes: Int)(implicit  p:Parameters)
//  extends TLRegisterRouter(
//    params.address,"DQNAccelerator", Seq("ucbbar, DQNAccelerator"),
//    beatBytes=beatBytes)(
//    new TLRegBundle(params, _) with DQNAccelerPortIO)(
//    new TLRegModule(params, _, _) with CPIModule)
//
//class DQNAXI4(params: DQNAcceleratorParams, beatBytes: Int)(implicit p: Parameters)
//
//  extends AXI4RegisterRouter(
//    params.address,
//    beatBytes=beatBytes)(
//    new AXI4RegBundle(params, _) with DQNAccelerPortIO)(
//    new AXI4RegModule(params, _, _) with DQNAcceleratorModule)
//
//case object DQNAcceleratorKey extends Field[Option[DQNAcceleratorParams]](None)
//
//trait CanHavePeripheryDQNAccelerator {this : BaseSubsystem =>
//  private val portName= "DQNAccelerator"
//
//  val dqn=p(DQNAcceleratorKey) match{
//    case Some(params) => {
//      if (params.useAXI4) {
//        val dqn = LazyModule(new DQNAXI4(params, pbus.beatBytes)(p))
//        pbus.toSlave(Some(portName)) {
//          dqn.node :=
//            AXI4Buffer () :=
//            TLToAXI4 () :=
//            // toVariableWidthSlave doesn't use holdFirstDeny, which TLToAXI4() needsx
//            TLFragmenter(pbus.beatBytes, pbus.blockBytes, holdFirstDeny = true)
//        }
//        Some(dqn)
//      } else {
//        val dqn = LazyModule(new DQNTL(params, pbus.beatBytes)(p))
//        pbus.toVariableWidthSlave(Some(portName)) { dqn.node }
//        Some(dqn)
//      }
//    }
//    case None => None
//  }
//}

// trait CanHavePeripheryCPIModuleImp extends LazyModuleImp {
//   val outer: CanHavePeripheryDQNAccelerator
//   val port = outer.cpi match {
//     case  Some(dqn) => {
//       val cpiPort=IO(new CPI2IO)

//       cpiPort.SIOC          := cpi.module.io.SIOC
//       cpiPort.SIOD          := cpi.module.io.SIOD
//       cpi.module.io.vsync   := cpiPort.vsync
//       cpi.module.io.href    := cpiPort.href
//       cpi.module.io.pclk    := cpiPort.pclk
//       cpi.module.io.pixelIn := cpiPort.pixelIn
//       cpiPort.XCLK          := cpi.module.io.XCLK.asBool

//       Some(cpiPort)
//       //dontTouch(cpiPort)
//     }
//     case None => None
//   }
// }

// class WithOV7670(useAXI4: Boolean) extends Config((site,here, up) => {
//   case CPIKey => Some(CPIParams(useAXI4=useAXI4))
// })

