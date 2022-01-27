module DualPortedMem(
  input        clock,
  input        reset,
  input  [7:0] io_wrData,
  output [7:0] io_rdData,
  input  [5:0] io_readAddr,
  input  [5:0] io_writeAddr,
  input        io_wrEna,
  input        io_rdEna
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:63]; // @[SRAM.scala 20:24]
  wire [7:0] mem_io_rdData_MPORT_data; // @[SRAM.scala 20:24]
  wire [5:0] mem_io_rdData_MPORT_addr; // @[SRAM.scala 20:24]
  wire [7:0] mem_MPORT_data; // @[SRAM.scala 20:24]
  wire [5:0] mem_MPORT_addr; // @[SRAM.scala 20:24]
  wire  mem_MPORT_mask; // @[SRAM.scala 20:24]
  wire  mem_MPORT_en; // @[SRAM.scala 20:24]
  reg  mem_io_rdData_MPORT_en_pipe_0;
  reg [5:0] mem_io_rdData_MPORT_addr_pipe_0;
  assign mem_io_rdData_MPORT_addr = mem_io_rdData_MPORT_addr_pipe_0;
  assign mem_io_rdData_MPORT_data = mem[mem_io_rdData_MPORT_addr]; // @[SRAM.scala 20:24]
  assign mem_MPORT_data = io_wrData;
  assign mem_MPORT_addr = io_writeAddr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wrEna;
  assign io_rdData = mem_io_rdData_MPORT_data; // @[SRAM.scala 24:13]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SRAM.scala 20:24]
    end
    mem_io_rdData_MPORT_en_pipe_0 <= io_rdEna;
    if (io_rdEna) begin
      mem_io_rdData_MPORT_addr_pipe_0 <= io_readAddr;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(io_wrEna & io_rdEna & io_readAddr == io_writeAddr) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: undefined behavior in dual-ported SRAM \n    at SRAM.scala:19 assert(!(io.wrEna && io.rdEna && io.readAddr === io.writeAddr), \"undefined behavior in dual-ported SRAM \")\n"
            ); // @[SRAM.scala 19:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_wrEna & io_rdEna & io_readAddr == io_writeAddr) | reset)) begin
          $fatal; // @[SRAM.scala 19:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_rdData_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_rdData_MPORT_addr_pipe_0 = _RAND_2[5:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DualPortedMem_32(
  input        clock,
  input        reset,
  input  [7:0] io_wrData,
  output [7:0] io_rdData,
  input  [2:0] io_readAddr,
  input  [2:0] io_writeAddr,
  input        io_wrEna,
  input        io_rdEna
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:7]; // @[SRAM.scala 20:24]
  wire [7:0] mem_io_rdData_MPORT_data; // @[SRAM.scala 20:24]
  wire [2:0] mem_io_rdData_MPORT_addr; // @[SRAM.scala 20:24]
  wire [7:0] mem_MPORT_data; // @[SRAM.scala 20:24]
  wire [2:0] mem_MPORT_addr; // @[SRAM.scala 20:24]
  wire  mem_MPORT_mask; // @[SRAM.scala 20:24]
  wire  mem_MPORT_en; // @[SRAM.scala 20:24]
  reg  mem_io_rdData_MPORT_en_pipe_0;
  reg [2:0] mem_io_rdData_MPORT_addr_pipe_0;
  assign mem_io_rdData_MPORT_addr = mem_io_rdData_MPORT_addr_pipe_0;
  assign mem_io_rdData_MPORT_data = mem[mem_io_rdData_MPORT_addr]; // @[SRAM.scala 20:24]
  assign mem_MPORT_data = io_wrData;
  assign mem_MPORT_addr = io_writeAddr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wrEna;
  assign io_rdData = mem_io_rdData_MPORT_data; // @[SRAM.scala 24:13]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SRAM.scala 20:24]
    end
    mem_io_rdData_MPORT_en_pipe_0 <= io_rdEna;
    if (io_rdEna) begin
      mem_io_rdData_MPORT_addr_pipe_0 <= io_readAddr;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~(io_wrEna & io_rdEna & io_readAddr == io_writeAddr) | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed: undefined behavior in dual-ported SRAM \n    at SRAM.scala:19 assert(!(io.wrEna && io.rdEna && io.readAddr === io.writeAddr), \"undefined behavior in dual-ported SRAM \")\n"
            ); // @[SRAM.scala 19:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(io_wrEna & io_rdEna & io_readAddr == io_writeAddr) | reset)) begin
          $fatal; // @[SRAM.scala 19:9]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_rdData_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_rdData_MPORT_addr_pipe_0 = _RAND_2[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ActivationBlock(
  input  [1:0] io_activationFunc,
  input  [7:0] io_weightedSum_0,
  input  [7:0] io_weightedSum_1,
  input  [7:0] io_weightedSum_2,
  input  [7:0] io_weightedSum_3,
  input  [7:0] io_weightedSum_4,
  input  [7:0] io_weightedSum_5,
  input  [7:0] io_weightedSum_6,
  input  [7:0] io_weightedSum_7,
  input  [7:0] io_weightedSum_8,
  input  [7:0] io_weightedSum_9,
  input  [7:0] io_weightedSum_10,
  input  [7:0] io_weightedSum_11,
  input  [7:0] io_weightedSum_12,
  input  [7:0] io_weightedSum_13,
  input  [7:0] io_weightedSum_14,
  input  [7:0] io_weightedSum_15,
  input  [7:0] io_weightedSum_16,
  input  [7:0] io_weightedSum_17,
  input  [7:0] io_weightedSum_18,
  input  [7:0] io_weightedSum_19,
  input  [7:0] io_weightedSum_20,
  input  [7:0] io_weightedSum_21,
  input  [7:0] io_weightedSum_22,
  input  [7:0] io_weightedSum_23,
  input  [7:0] io_weightedSum_24,
  input  [7:0] io_weightedSum_25,
  input  [7:0] io_weightedSum_26,
  input  [7:0] io_weightedSum_27,
  input  [7:0] io_weightedSum_28,
  input  [7:0] io_weightedSum_29,
  input  [7:0] io_weightedSum_30,
  input  [7:0] io_weightedSum_31,
  output [7:0] io_activation_0,
  output [7:0] io_activation_1,
  output [7:0] io_activation_2,
  output [7:0] io_activation_3,
  output [7:0] io_activation_4,
  output [7:0] io_activation_5,
  output [7:0] io_activation_6,
  output [7:0] io_activation_7,
  output [7:0] io_activation_8,
  output [7:0] io_activation_9,
  output [7:0] io_activation_10,
  output [7:0] io_activation_11,
  output [7:0] io_activation_12,
  output [7:0] io_activation_13,
  output [7:0] io_activation_14,
  output [7:0] io_activation_15,
  output [7:0] io_activation_16,
  output [7:0] io_activation_17,
  output [7:0] io_activation_18,
  output [7:0] io_activation_19,
  output [7:0] io_activation_20,
  output [7:0] io_activation_21,
  output [7:0] io_activation_22,
  output [7:0] io_activation_23,
  output [7:0] io_activation_24,
  output [7:0] io_activation_25,
  output [7:0] io_activation_26,
  output [7:0] io_activation_27,
  output [7:0] io_activation_28,
  output [7:0] io_activation_29,
  output [7:0] io_activation_30,
  output [7:0] io_activation_31,
  input        io_ena
);
  wire [7:0] _io_activation_0_T_2 = io_weightedSum_0[7] ? $signed(8'sh0) : $signed(io_weightedSum_0); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_0 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_0) : $signed(_io_activation_0_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_1_T_2 = io_weightedSum_1[7] ? $signed(8'sh0) : $signed(io_weightedSum_1); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_2 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_1) : $signed(_io_activation_1_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_2_T_2 = io_weightedSum_2[7] ? $signed(8'sh0) : $signed(io_weightedSum_2); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_4 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_2) : $signed(_io_activation_2_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_3_T_2 = io_weightedSum_3[7] ? $signed(8'sh0) : $signed(io_weightedSum_3); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_6 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_3) : $signed(_io_activation_3_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_4_T_2 = io_weightedSum_4[7] ? $signed(8'sh0) : $signed(io_weightedSum_4); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_8 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_4) : $signed(_io_activation_4_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_5_T_2 = io_weightedSum_5[7] ? $signed(8'sh0) : $signed(io_weightedSum_5); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_10 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_5) : $signed(_io_activation_5_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_6_T_2 = io_weightedSum_6[7] ? $signed(8'sh0) : $signed(io_weightedSum_6); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_12 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_6) : $signed(_io_activation_6_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_7_T_2 = io_weightedSum_7[7] ? $signed(8'sh0) : $signed(io_weightedSum_7); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_14 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_7) : $signed(_io_activation_7_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_8_T_2 = io_weightedSum_8[7] ? $signed(8'sh0) : $signed(io_weightedSum_8); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_16 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_8) : $signed(_io_activation_8_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_9_T_2 = io_weightedSum_9[7] ? $signed(8'sh0) : $signed(io_weightedSum_9); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_18 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_9) : $signed(_io_activation_9_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_10_T_2 = io_weightedSum_10[7] ? $signed(8'sh0) : $signed(io_weightedSum_10); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_20 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_10) : $signed(_io_activation_10_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_11_T_2 = io_weightedSum_11[7] ? $signed(8'sh0) : $signed(io_weightedSum_11); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_22 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_11) : $signed(_io_activation_11_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_12_T_2 = io_weightedSum_12[7] ? $signed(8'sh0) : $signed(io_weightedSum_12); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_24 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_12) : $signed(_io_activation_12_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_13_T_2 = io_weightedSum_13[7] ? $signed(8'sh0) : $signed(io_weightedSum_13); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_26 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_13) : $signed(_io_activation_13_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_14_T_2 = io_weightedSum_14[7] ? $signed(8'sh0) : $signed(io_weightedSum_14); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_28 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_14) : $signed(_io_activation_14_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_15_T_2 = io_weightedSum_15[7] ? $signed(8'sh0) : $signed(io_weightedSum_15); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_30 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_15) : $signed(_io_activation_15_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_16_T_2 = io_weightedSum_16[7] ? $signed(8'sh0) : $signed(io_weightedSum_16); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_32 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_16) : $signed(_io_activation_16_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_17_T_2 = io_weightedSum_17[7] ? $signed(8'sh0) : $signed(io_weightedSum_17); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_34 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_17) : $signed(_io_activation_17_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_18_T_2 = io_weightedSum_18[7] ? $signed(8'sh0) : $signed(io_weightedSum_18); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_36 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_18) : $signed(_io_activation_18_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_19_T_2 = io_weightedSum_19[7] ? $signed(8'sh0) : $signed(io_weightedSum_19); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_38 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_19) : $signed(_io_activation_19_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_20_T_2 = io_weightedSum_20[7] ? $signed(8'sh0) : $signed(io_weightedSum_20); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_40 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_20) : $signed(_io_activation_20_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_21_T_2 = io_weightedSum_21[7] ? $signed(8'sh0) : $signed(io_weightedSum_21); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_42 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_21) : $signed(_io_activation_21_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_22_T_2 = io_weightedSum_22[7] ? $signed(8'sh0) : $signed(io_weightedSum_22); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_44 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_22) : $signed(_io_activation_22_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_23_T_2 = io_weightedSum_23[7] ? $signed(8'sh0) : $signed(io_weightedSum_23); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_46 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_23) : $signed(_io_activation_23_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_24_T_2 = io_weightedSum_24[7] ? $signed(8'sh0) : $signed(io_weightedSum_24); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_48 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_24) : $signed(_io_activation_24_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_25_T_2 = io_weightedSum_25[7] ? $signed(8'sh0) : $signed(io_weightedSum_25); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_50 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_25) : $signed(_io_activation_25_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_26_T_2 = io_weightedSum_26[7] ? $signed(8'sh0) : $signed(io_weightedSum_26); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_52 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_26) : $signed(_io_activation_26_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_27_T_2 = io_weightedSum_27[7] ? $signed(8'sh0) : $signed(io_weightedSum_27); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_54 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_27) : $signed(_io_activation_27_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_28_T_2 = io_weightedSum_28[7] ? $signed(8'sh0) : $signed(io_weightedSum_28); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_56 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_28) : $signed(_io_activation_28_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_29_T_2 = io_weightedSum_29[7] ? $signed(8'sh0) : $signed(io_weightedSum_29); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_58 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_29) : $signed(_io_activation_29_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_30_T_2 = io_weightedSum_30[7] ? $signed(8'sh0) : $signed(io_weightedSum_30); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_60 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_30) : $signed(_io_activation_30_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [7:0] _io_activation_31_T_2 = io_weightedSum_31[7] ? $signed(8'sh0) : $signed(io_weightedSum_31); // @[ActivationBlock.scala 56:32]
  wire [7:0] _GEN_62 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_31) : $signed(_io_activation_31_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  assign io_activation_0 = io_ena ? $signed(_GEN_0) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_1 = io_ena ? $signed(_GEN_2) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_2 = io_ena ? $signed(_GEN_4) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_3 = io_ena ? $signed(_GEN_6) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_4 = io_ena ? $signed(_GEN_8) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_5 = io_ena ? $signed(_GEN_10) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_6 = io_ena ? $signed(_GEN_12) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_7 = io_ena ? $signed(_GEN_14) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_8 = io_ena ? $signed(_GEN_16) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_9 = io_ena ? $signed(_GEN_18) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_10 = io_ena ? $signed(_GEN_20) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_11 = io_ena ? $signed(_GEN_22) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_12 = io_ena ? $signed(_GEN_24) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_13 = io_ena ? $signed(_GEN_26) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_14 = io_ena ? $signed(_GEN_28) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_15 = io_ena ? $signed(_GEN_30) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_16 = io_ena ? $signed(_GEN_32) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_17 = io_ena ? $signed(_GEN_34) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_18 = io_ena ? $signed(_GEN_36) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_19 = io_ena ? $signed(_GEN_38) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_20 = io_ena ? $signed(_GEN_40) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_21 = io_ena ? $signed(_GEN_42) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_22 = io_ena ? $signed(_GEN_44) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_23 = io_ena ? $signed(_GEN_46) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_24 = io_ena ? $signed(_GEN_48) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_25 = io_ena ? $signed(_GEN_50) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_26 = io_ena ? $signed(_GEN_52) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_27 = io_ena ? $signed(_GEN_54) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_28 = io_ena ? $signed(_GEN_56) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_29 = io_ena ? $signed(_GEN_58) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_30 = io_ena ? $signed(_GEN_60) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_31 = io_ena ? $signed(_GEN_62) : $signed(8'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
endmodule
module OneHotEncoder(
  input  [4:0] io_memRow,
  input        io_enable,
  output       io_writeSignal_0,
  output       io_writeSignal_1,
  output       io_writeSignal_2,
  output       io_writeSignal_3,
  output       io_writeSignal_4,
  output       io_writeSignal_5,
  output       io_writeSignal_6,
  output       io_writeSignal_7,
  output       io_writeSignal_8,
  output       io_writeSignal_9,
  output       io_writeSignal_10,
  output       io_writeSignal_11,
  output       io_writeSignal_12,
  output       io_writeSignal_13,
  output       io_writeSignal_14,
  output       io_writeSignal_15,
  output       io_writeSignal_16,
  output       io_writeSignal_17,
  output       io_writeSignal_18,
  output       io_writeSignal_19,
  output       io_writeSignal_20,
  output       io_writeSignal_21,
  output       io_writeSignal_22,
  output       io_writeSignal_23,
  output       io_writeSignal_24,
  output       io_writeSignal_25,
  output       io_writeSignal_26,
  output       io_writeSignal_27,
  output       io_writeSignal_28,
  output       io_writeSignal_29,
  output       io_writeSignal_30,
  output       io_writeSignal_31
);
  wire [31:0] writeSignal = 32'h1 << io_memRow; // @[utils.scala 85:26]
  assign io_writeSignal_0 = io_enable & writeSignal[0]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_1 = io_enable & writeSignal[1]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_2 = io_enable & writeSignal[2]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_3 = io_enable & writeSignal[3]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_4 = io_enable & writeSignal[4]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_5 = io_enable & writeSignal[5]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_6 = io_enable & writeSignal[6]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_7 = io_enable & writeSignal[7]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_8 = io_enable & writeSignal[8]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_9 = io_enable & writeSignal[9]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_10 = io_enable & writeSignal[10]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_11 = io_enable & writeSignal[11]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_12 = io_enable & writeSignal[12]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_13 = io_enable & writeSignal[13]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_14 = io_enable & writeSignal[14]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_15 = io_enable & writeSignal[15]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_16 = io_enable & writeSignal[16]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_17 = io_enable & writeSignal[17]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_18 = io_enable & writeSignal[18]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_19 = io_enable & writeSignal[19]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_20 = io_enable & writeSignal[20]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_21 = io_enable & writeSignal[21]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_22 = io_enable & writeSignal[22]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_23 = io_enable & writeSignal[23]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_24 = io_enable & writeSignal[24]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_25 = io_enable & writeSignal[25]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_26 = io_enable & writeSignal[26]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_27 = io_enable & writeSignal[27]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_28 = io_enable & writeSignal[28]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_29 = io_enable & writeSignal[29]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_30 = io_enable & writeSignal[30]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
  assign io_writeSignal_31 = io_enable & writeSignal[31]; // @[utils.scala 87:20 utils.scala 88:27 utils.scala 90:27]
endmodule
module EnableSignalDecoder(
  output       io_activatedSignals_0,
  output       io_activatedSignals_1,
  output       io_activatedSignals_2,
  output       io_activatedSignals_3,
  output       io_activatedSignals_4,
  output       io_activatedSignals_5,
  output       io_activatedSignals_6,
  output       io_activatedSignals_7,
  output       io_activatedSignals_8,
  output       io_activatedSignals_9,
  output       io_activatedSignals_10,
  output       io_activatedSignals_11,
  output       io_activatedSignals_12,
  output       io_activatedSignals_13,
  output       io_activatedSignals_14,
  output       io_activatedSignals_15,
  output       io_activatedSignals_16,
  output       io_activatedSignals_17,
  output       io_activatedSignals_18,
  output       io_activatedSignals_19,
  output       io_activatedSignals_20,
  output       io_activatedSignals_21,
  output       io_activatedSignals_22,
  output       io_activatedSignals_23,
  output       io_activatedSignals_24,
  output       io_activatedSignals_25,
  output       io_activatedSignals_26,
  output       io_activatedSignals_27,
  output       io_activatedSignals_28,
  output       io_activatedSignals_29,
  output       io_activatedSignals_30,
  output       io_activatedSignals_31,
  input  [4:0] io_PEs,
  input        io_enable
);
  wire [31:0] _GEN_0 = io_PEs == 5'h0 ? 32'h1 : 32'h0; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_1 = io_PEs == 5'h1 ? 32'h3 : _GEN_0; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_2 = io_PEs == 5'h2 ? 32'h7 : _GEN_1; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_3 = io_PEs == 5'h3 ? 32'hf : _GEN_2; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_4 = io_PEs == 5'h4 ? 32'h1f : _GEN_3; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_5 = io_PEs == 5'h5 ? 32'h3f : _GEN_4; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_6 = io_PEs == 5'h6 ? 32'h7f : _GEN_5; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_7 = io_PEs == 5'h7 ? 32'hff : _GEN_6; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_8 = io_PEs == 5'h8 ? 32'h1ff : _GEN_7; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_9 = io_PEs == 5'h9 ? 32'h3ff : _GEN_8; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_10 = io_PEs == 5'ha ? 32'h7ff : _GEN_9; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_11 = io_PEs == 5'hb ? 32'hfff : _GEN_10; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_12 = io_PEs == 5'hc ? 32'h1fff : _GEN_11; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_13 = io_PEs == 5'hd ? 32'h3fff : _GEN_12; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_14 = io_PEs == 5'he ? 32'h7fff : _GEN_13; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_15 = io_PEs == 5'hf ? 32'hffff : _GEN_14; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_16 = io_PEs == 5'h10 ? 32'h1ffff : _GEN_15; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_17 = io_PEs == 5'h11 ? 32'h3ffff : _GEN_16; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_18 = io_PEs == 5'h12 ? 32'h7ffff : _GEN_17; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_19 = io_PEs == 5'h13 ? 32'hfffff : _GEN_18; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_20 = io_PEs == 5'h14 ? 32'h1fffff : _GEN_19; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_21 = io_PEs == 5'h15 ? 32'h3fffff : _GEN_20; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_22 = io_PEs == 5'h16 ? 32'h7fffff : _GEN_21; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_23 = io_PEs == 5'h17 ? 32'hffffff : _GEN_22; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_24 = io_PEs == 5'h18 ? 32'h1ffffff : _GEN_23; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_25 = io_PEs == 5'h19 ? 32'h3ffffff : _GEN_24; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_26 = io_PEs == 5'h1a ? 32'h7ffffff : _GEN_25; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_27 = io_PEs == 5'h1b ? 32'hfffffff : _GEN_26; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_28 = io_PEs == 5'h1c ? 32'h1fffffff : _GEN_27; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_29 = io_PEs == 5'h1d ? 32'h3fffffff : _GEN_28; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] _GEN_30 = io_PEs == 5'h1e ? 32'h7fffffff : _GEN_29; // @[utils.scala 54:33 utils.scala 55:24]
  wire [31:0] activatedSignals = io_PEs == 5'h1f ? 32'hffffffff : _GEN_30; // @[utils.scala 54:33 utils.scala 55:24]
  assign io_activatedSignals_0 = io_enable & activatedSignals[0]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_1 = io_enable & activatedSignals[1]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_2 = io_enable & activatedSignals[2]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_3 = io_enable & activatedSignals[3]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_4 = io_enable & activatedSignals[4]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_5 = io_enable & activatedSignals[5]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_6 = io_enable & activatedSignals[6]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_7 = io_enable & activatedSignals[7]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_8 = io_enable & activatedSignals[8]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_9 = io_enable & activatedSignals[9]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_10 = io_enable & activatedSignals[10]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_11 = io_enable & activatedSignals[11]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_12 = io_enable & activatedSignals[12]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_13 = io_enable & activatedSignals[13]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_14 = io_enable & activatedSignals[14]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_15 = io_enable & activatedSignals[15]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_16 = io_enable & activatedSignals[16]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_17 = io_enable & activatedSignals[17]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_18 = io_enable & activatedSignals[18]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_19 = io_enable & activatedSignals[19]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_20 = io_enable & activatedSignals[20]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_21 = io_enable & activatedSignals[21]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_22 = io_enable & activatedSignals[22]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_23 = io_enable & activatedSignals[23]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_24 = io_enable & activatedSignals[24]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_25 = io_enable & activatedSignals[25]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_26 = io_enable & activatedSignals[26]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_27 = io_enable & activatedSignals[27]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_28 = io_enable & activatedSignals[28]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_29 = io_enable & activatedSignals[29]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_30 = io_enable & activatedSignals[30]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
  assign io_activatedSignals_31 = io_enable & activatedSignals[31]; // @[utils.scala 60:20 utils.scala 61:32 utils.scala 63:32]
endmodule
module AdderTree(
  input         clock,
  input  [15:0] io_in_0,
  input  [15:0] io_in_1,
  input  [15:0] io_in_2,
  input  [15:0] io_in_3,
  input  [15:0] io_in_4,
  input  [15:0] io_in_5,
  input  [15:0] io_in_6,
  input  [15:0] io_in_7,
  input  [15:0] io_in_8,
  input  [15:0] io_in_9,
  input  [15:0] io_in_10,
  input  [15:0] io_in_11,
  input  [15:0] io_in_12,
  input  [15:0] io_in_13,
  input  [15:0] io_in_14,
  input  [15:0] io_in_15,
  input  [15:0] io_in_16,
  input  [15:0] io_in_17,
  input  [15:0] io_in_18,
  input  [15:0] io_in_19,
  input  [15:0] io_in_20,
  input  [15:0] io_in_21,
  input  [15:0] io_in_22,
  input  [15:0] io_in_23,
  input  [15:0] io_in_24,
  input  [15:0] io_in_25,
  input  [15:0] io_in_26,
  input  [15:0] io_in_27,
  input  [15:0] io_in_28,
  input  [15:0] io_in_29,
  input  [15:0] io_in_30,
  input  [15:0] io_in_31,
  output [15:0] io_sum,
  output        io_sumValid,
  input         io_cal
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] registerArray2_0; // @[AdderTree.scala 16:27]
  reg [15:0] registerArray2_1; // @[AdderTree.scala 16:27]
  reg [15:0] registerArray2_2; // @[AdderTree.scala 16:27]
  reg [15:0] registerArray2_3; // @[AdderTree.scala 16:27]
  wire [15:0] registerArray0_0 = $signed(io_in_0) + $signed(io_in_1); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_1 = $signed(io_in_2) + $signed(io_in_3); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_2 = $signed(io_in_4) + $signed(io_in_5); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_3 = $signed(io_in_6) + $signed(io_in_7); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_4 = $signed(io_in_8) + $signed(io_in_9); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_5 = $signed(io_in_10) + $signed(io_in_11); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_6 = $signed(io_in_12) + $signed(io_in_13); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_7 = $signed(io_in_14) + $signed(io_in_15); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_8 = $signed(io_in_16) + $signed(io_in_17); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_9 = $signed(io_in_18) + $signed(io_in_19); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_10 = $signed(io_in_20) + $signed(io_in_21); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_11 = $signed(io_in_22) + $signed(io_in_23); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_12 = $signed(io_in_24) + $signed(io_in_25); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_13 = $signed(io_in_26) + $signed(io_in_27); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_14 = $signed(io_in_28) + $signed(io_in_29); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray0_15 = $signed(io_in_30) + $signed(io_in_31); // @[AdderTree.scala 21:41]
  wire [15:0] registerArray1_0 = $signed(registerArray0_0) + $signed(registerArray0_1); // @[AdderTree.scala 25:50]
  wire [15:0] registerArray1_1 = $signed(registerArray0_2) + $signed(registerArray0_3); // @[AdderTree.scala 25:50]
  wire [15:0] registerArray1_2 = $signed(registerArray0_4) + $signed(registerArray0_5); // @[AdderTree.scala 25:50]
  wire [15:0] registerArray1_3 = $signed(registerArray0_6) + $signed(registerArray0_7); // @[AdderTree.scala 25:50]
  wire [15:0] registerArray1_4 = $signed(registerArray0_8) + $signed(registerArray0_9); // @[AdderTree.scala 25:50]
  wire [15:0] registerArray1_5 = $signed(registerArray0_10) + $signed(registerArray0_11); // @[AdderTree.scala 25:50]
  wire [15:0] registerArray1_6 = $signed(registerArray0_12) + $signed(registerArray0_13); // @[AdderTree.scala 25:50]
  wire [15:0] registerArray1_7 = $signed(registerArray0_14) + $signed(registerArray0_15); // @[AdderTree.scala 25:50]
  wire [15:0] registerArray3_0 = $signed(registerArray2_0) + $signed(registerArray2_1); // @[AdderTree.scala 31:50]
  wire [15:0] registerArray3_1 = $signed(registerArray2_2) + $signed(registerArray2_3); // @[AdderTree.scala 31:50]
  reg  io_sumValid_REG; // @[AdderTree.scala 35:25]
  assign io_sum = $signed(registerArray3_0) + $signed(registerArray3_1); // @[AdderTree.scala 33:36]
  assign io_sumValid = io_sumValid_REG; // @[AdderTree.scala 35:15]
  always @(posedge clock) begin
    registerArray2_0 <= $signed(registerArray1_0) + $signed(registerArray1_1); // @[AdderTree.scala 28:50]
    registerArray2_1 <= $signed(registerArray1_2) + $signed(registerArray1_3); // @[AdderTree.scala 28:50]
    registerArray2_2 <= $signed(registerArray1_4) + $signed(registerArray1_5); // @[AdderTree.scala 28:50]
    registerArray2_3 <= $signed(registerArray1_6) + $signed(registerArray1_7); // @[AdderTree.scala 28:50]
    io_sumValid_REG <= io_cal; // @[AdderTree.scala 35:25]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  registerArray2_0 = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  registerArray2_1 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  registerArray2_2 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  registerArray2_3 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  io_sumValid_REG = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Max4(
  input  [7:0] io_in_0,
  input  [7:0] io_in_1,
  input  [7:0] io_in_2,
  input  [7:0] io_in_3,
  output [1:0] io_index
);
  wire [7:0] _io_max_T_1 = $signed(io_in_0) > $signed(io_in_1) ? $signed(io_in_0) : $signed(io_in_1); // @[Max.scala 28:43]
  wire [7:0] _io_max_T_3 = $signed(_io_max_T_1) > $signed(io_in_2) ? $signed(_io_max_T_1) : $signed(io_in_2); // @[Max.scala 28:43]
  wire [7:0] _io_max_T_5 = $signed(_io_max_T_3) > $signed(io_in_3) ? $signed(_io_max_T_3) : $signed(io_in_3); // @[Max.scala 28:43]
  wire [1:0] _io_index_T_28 = $signed(io_in_2) == $signed(_io_max_T_5) ? 2'h2 : 2'h3; // @[Max.scala 30:31]
  wire [1:0] _io_index_T_29 = $signed(io_in_1) == $signed(_io_max_T_5) ? 2'h1 : _io_index_T_28; // @[Max.scala 30:31]
  assign io_index = $signed(io_in_0) == $signed(_io_max_T_5) ? 2'h0 : _io_index_T_29; // @[Max.scala 30:31]
endmodule
module DelayBoolNCycles(
  input   clock,
  input   io_signal2delay,
  output  io_delayedSignal
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  temp; // @[utils.scala 103:21]
  assign io_delayedSignal = temp; // @[utils.scala 107:20]
  always @(posedge clock) begin
    temp <= io_signal2delay; // @[utils.scala 103:21]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  temp = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ProcessingCore(
  input         clock,
  input         reset,
  input  [31:0] io_instruction,
  input         io_instructionValid,
  input  [5:0]  io_state,
  input         io_terminate,
  output        io_ready,
  output        io_jumpIP,
  output [9:0]  io_IPAddress,
  output        io_increaseIP,
  output [1:0]  io_action,
  output        io_actionValid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
  reg [31:0] _RAND_39;
`endif // RANDOMIZE_REG_INIT
  wire  DualPortedMem_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_1_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_1_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_1_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_1_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_1_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_1_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_1_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_1_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_2_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_2_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_2_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_2_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_2_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_2_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_2_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_2_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_3_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_3_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_3_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_3_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_3_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_3_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_3_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_3_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_4_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_4_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_4_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_4_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_4_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_4_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_4_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_4_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_5_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_5_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_5_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_5_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_5_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_5_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_5_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_5_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_6_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_6_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_6_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_6_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_6_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_6_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_6_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_6_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_7_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_7_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_7_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_7_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_7_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_7_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_7_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_7_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_8_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_8_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_8_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_8_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_8_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_8_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_8_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_8_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_9_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_9_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_9_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_9_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_9_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_9_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_9_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_9_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_10_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_10_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_10_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_10_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_10_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_10_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_10_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_10_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_11_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_11_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_11_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_11_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_11_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_11_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_11_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_11_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_12_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_12_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_12_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_12_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_12_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_12_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_12_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_12_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_13_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_13_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_13_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_13_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_13_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_13_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_13_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_13_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_14_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_14_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_14_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_14_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_14_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_14_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_14_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_14_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_15_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_15_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_15_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_15_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_15_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_15_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_15_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_15_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_16_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_16_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_16_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_16_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_16_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_16_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_16_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_16_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_17_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_17_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_17_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_17_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_17_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_17_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_17_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_17_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_18_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_18_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_18_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_18_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_18_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_18_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_18_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_18_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_19_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_19_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_19_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_19_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_19_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_19_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_19_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_19_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_20_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_20_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_20_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_20_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_20_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_20_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_20_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_20_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_21_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_21_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_21_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_21_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_21_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_21_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_21_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_21_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_22_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_22_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_22_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_22_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_22_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_22_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_22_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_22_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_23_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_23_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_23_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_23_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_23_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_23_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_23_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_23_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_24_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_24_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_24_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_24_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_24_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_24_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_24_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_24_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_25_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_25_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_25_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_25_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_25_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_25_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_25_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_25_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_26_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_26_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_26_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_26_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_26_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_26_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_26_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_26_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_27_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_27_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_27_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_27_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_27_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_27_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_27_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_27_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_28_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_28_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_28_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_28_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_28_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_28_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_28_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_28_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_29_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_29_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_29_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_29_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_29_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_29_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_29_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_29_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_30_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_30_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_30_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_30_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_30_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_30_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_30_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_30_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_31_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_31_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_31_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_31_io_rdData; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_31_io_readAddr; // @[SRAM.scala 43:79]
  wire [5:0] DualPortedMem_31_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_31_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_31_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_32_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_32_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_32_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_32_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_32_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_32_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_32_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_32_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_33_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_33_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_33_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_33_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_33_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_33_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_33_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_33_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_34_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_34_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_34_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_34_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_34_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_34_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_34_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_34_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_35_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_35_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_35_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_35_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_35_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_35_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_35_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_35_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_36_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_36_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_36_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_36_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_36_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_36_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_36_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_36_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_37_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_37_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_37_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_37_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_37_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_37_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_37_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_37_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_38_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_38_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_38_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_38_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_38_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_38_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_38_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_38_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_39_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_39_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_39_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_39_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_39_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_39_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_39_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_39_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_40_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_40_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_40_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_40_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_40_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_40_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_40_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_40_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_41_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_41_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_41_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_41_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_41_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_41_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_41_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_41_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_42_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_42_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_42_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_42_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_42_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_42_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_42_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_42_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_43_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_43_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_43_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_43_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_43_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_43_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_43_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_43_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_44_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_44_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_44_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_44_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_44_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_44_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_44_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_44_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_45_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_45_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_45_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_45_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_45_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_45_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_45_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_45_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_46_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_46_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_46_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_46_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_46_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_46_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_46_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_46_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_47_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_47_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_47_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_47_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_47_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_47_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_47_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_47_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_48_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_48_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_48_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_48_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_48_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_48_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_48_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_48_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_49_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_49_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_49_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_49_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_49_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_49_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_49_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_49_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_50_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_50_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_50_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_50_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_50_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_50_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_50_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_50_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_51_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_51_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_51_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_51_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_51_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_51_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_51_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_51_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_52_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_52_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_52_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_52_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_52_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_52_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_52_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_52_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_53_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_53_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_53_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_53_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_53_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_53_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_53_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_53_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_54_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_54_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_54_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_54_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_54_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_54_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_54_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_54_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_55_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_55_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_55_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_55_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_55_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_55_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_55_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_55_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_56_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_56_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_56_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_56_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_56_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_56_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_56_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_56_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_57_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_57_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_57_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_57_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_57_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_57_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_57_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_57_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_58_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_58_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_58_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_58_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_58_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_58_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_58_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_58_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_59_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_59_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_59_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_59_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_59_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_59_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_59_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_59_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_60_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_60_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_60_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_60_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_60_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_60_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_60_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_60_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_61_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_61_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_61_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_61_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_61_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_61_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_61_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_61_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_62_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_62_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_62_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_62_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_62_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_62_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_62_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_62_io_rdEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_63_clock; // @[SRAM.scala 43:79]
  wire  DualPortedMem_63_reset; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_63_io_wrData; // @[SRAM.scala 43:79]
  wire [7:0] DualPortedMem_63_io_rdData; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_63_io_readAddr; // @[SRAM.scala 43:79]
  wire [2:0] DualPortedMem_63_io_writeAddr; // @[SRAM.scala 43:79]
  wire  DualPortedMem_63_io_wrEna; // @[SRAM.scala 43:79]
  wire  DualPortedMem_63_io_rdEna; // @[SRAM.scala 43:79]
  wire [1:0] activationBlock_io_activationFunc; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_0; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_1; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_2; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_3; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_4; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_5; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_6; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_7; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_8; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_9; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_10; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_11; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_12; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_13; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_14; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_15; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_16; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_17; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_18; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_19; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_20; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_21; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_22; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_23; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_24; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_25; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_26; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_27; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_28; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_29; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_30; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_weightedSum_31; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_0; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_1; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_2; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_3; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_4; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_5; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_6; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_7; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_8; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_9; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_10; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_11; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_12; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_13; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_14; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_15; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_16; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_17; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_18; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_19; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_20; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_21; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_22; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_23; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_24; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_25; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_26; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_27; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_28; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_29; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_30; // @[ActivationBlock.scala 66:70]
  wire [7:0] activationBlock_io_activation_31; // @[ActivationBlock.scala 66:70]
  wire  activationBlock_io_ena; // @[ActivationBlock.scala 66:70]
  wire [4:0] oneHotDecoder_io_memRow; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_enable; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_0; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_1; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_2; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_3; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_4; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_5; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_6; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_7; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_8; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_9; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_10; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_11; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_12; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_13; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_14; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_15; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_16; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_17; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_18; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_19; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_20; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_21; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_22; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_23; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_24; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_25; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_26; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_27; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_28; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_29; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_30; // @[utils.scala 95:51]
  wire  oneHotDecoder_io_writeSignal_31; // @[utils.scala 95:51]
  wire  memReadDecoder_io_activatedSignals_0; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_1; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_2; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_3; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_4; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_5; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_6; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_7; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_8; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_9; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_10; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_11; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_12; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_13; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_14; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_15; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_16; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_17; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_18; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_19; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_20; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_21; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_22; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_23; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_24; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_25; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_26; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_27; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_28; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_29; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_30; // @[utils.scala 70:53]
  wire  memReadDecoder_io_activatedSignals_31; // @[utils.scala 70:53]
  wire [4:0] memReadDecoder_io_PEs; // @[utils.scala 70:53]
  wire  memReadDecoder_io_enable; // @[utils.scala 70:53]
  wire  adderTree_clock; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_0; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_1; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_2; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_3; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_4; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_5; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_6; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_7; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_8; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_9; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_10; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_11; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_12; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_13; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_14; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_15; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_16; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_17; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_18; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_19; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_20; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_21; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_22; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_23; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_24; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_25; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_26; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_27; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_28; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_29; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_30; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_in_31; // @[AdderTree.scala 40:58]
  wire [15:0] adderTree_io_sum; // @[AdderTree.scala 40:58]
  wire  adderTree_io_sumValid; // @[AdderTree.scala 40:58]
  wire  adderTree_io_cal; // @[AdderTree.scala 40:58]
  wire [7:0] actionBlock_io_in_0; // @[ProcessingCore.scala 54:31]
  wire [7:0] actionBlock_io_in_1; // @[ProcessingCore.scala 54:31]
  wire [7:0] actionBlock_io_in_2; // @[ProcessingCore.scala 54:31]
  wire [7:0] actionBlock_io_in_3; // @[ProcessingCore.scala 54:31]
  wire [1:0] actionBlock_io_index; // @[ProcessingCore.scala 54:31]
  wire  rdDataMatrixValid_clock; // @[utils.scala 111:53]
  wire  rdDataMatrixValid_io_signal2delay; // @[utils.scala 111:53]
  wire  rdDataMatrixValid_io_delayedSignal; // @[utils.scala 111:53]
  wire  rdDataVecValid_clock; // @[utils.scala 111:53]
  wire  rdDataVecValid_io_signal2delay; // @[utils.scala 111:53]
  wire  rdDataVecValid_io_delayedSignal; // @[utils.scala 111:53]
  reg [31:0] instructionRegister; // @[ProcessingCore.scala 43:36]
  reg [15:0] mulResults_0; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_1; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_2; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_3; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_4; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_5; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_6; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_7; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_8; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_9; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_10; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_11; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_12; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_13; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_14; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_15; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_16; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_17; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_18; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_19; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_20; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_21; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_22; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_23; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_24; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_25; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_26; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_27; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_28; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_29; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_30; // @[ProcessingCore.scala 52:28]
  reg [15:0] mulResults_31; // @[ProcessingCore.scala 52:28]
  wire [8:0] quantizedSum = adderTree_io_sum[11:3]; // @[ProcessingCore.scala 53:86]
  reg  rdWrEnaFlip; // @[ProcessingCore.scala 66:34]
  reg [12:0] colBanksCounter; // @[ProcessingCore.scala 74:33]
  reg [12:0] matrixRowCounter; // @[ProcessingCore.scala 75:33]
  reg [13:0] VinSizeReg; // @[ProcessingCore.scala 76:33]
  reg [12:0] VoutSizeReg; // @[ProcessingCore.scala 77:33]
  reg  adderTree_io_cal_REG; // @[ProcessingCore.scala 90:30]
  wire [1:0] op = instructionRegister[31:30]; // @[ProcessingCore.scala 127:33]
  wire [2:0] func = instructionRegister[29:27]; // @[ProcessingCore.scala 128:33]
  wire [4:0] matrixCol = instructionRegister[26:22]; // @[ProcessingCore.scala 133:40]
  wire [9:0] matrixRow = instructionRegister[21:12]; // @[ProcessingCore.scala 134:40]
  wire [11:0] weightValue = instructionRegister[11:0]; // @[ProcessingCore.scala 135:54]
  wire [13:0] VinSize = instructionRegister[26:13]; // @[ProcessingCore.scala 141:40]
  wire [12:0] VoutSize = instructionRegister[12:0]; // @[ProcessingCore.scala 142:40]
  wire [11:0] MinAddr = instructionRegister[23:12]; // @[ProcessingCore.scala 146:37]
  wire [4:0] VinAddr = instructionRegister[11:7]; // @[ProcessingCore.scala 147:37]
  wire [6:0] VoutAddr = instructionRegister[6:0]; // @[ProcessingCore.scala 148:37]
  wire [9:0] vinAddr = instructionRegister[24:15]; // @[ProcessingCore.scala 156:43]
  wire [4:0] vinSize = instructionRegister[14:10]; // @[ProcessingCore.scala 157:43]
  reg [1:0] Controller; // @[ProcessingCore.scala 161:32]
  wire  _T = 2'h0 == Controller; // @[Conditional.scala 37:30]
  wire  _T_1 = 2'h1 == Controller; // @[Conditional.scala 37:30]
  wire  _T_2 = 2'h2 == Controller; // @[Conditional.scala 37:30]
  wire  _GEN_65 = op == 2'h3 ? 1'h0 : 1'h1; // @[ProcessingCore.scala 179:25 ProcessingCore.scala 180:25 ProcessingCore.scala 182:25]
  wire  _T_4 = 2'h3 == Controller; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_66 = io_instructionValid ? 2'h1 : 2'h0; // @[ProcessingCore.scala 187:34 ProcessingCore.scala 188:25 ProcessingCore.scala 190:25]
  wire  _T_10 = 3'h0 == func; // @[Conditional.scala 37:30]
  wire  _T_11 = 3'h1 == func; // @[Conditional.scala 37:30]
  wire  _T_12 = 3'h2 == func; // @[Conditional.scala 37:30]
  wire  _T_141 = 3'h3 == func; // @[Conditional.scala 37:30]
  wire  _T_142 = 3'h4 == func; // @[Conditional.scala 37:30]
  wire  _T_143 = 3'h5 == func; // @[Conditional.scala 37:30]
  wire  _GEN_86 = _T_143 | _T; // @[Conditional.scala 39:67 ProcessingCore.scala 270:45]
  wire  _GEN_155 = _T_142 | _GEN_86; // @[Conditional.scala 39:67 ProcessingCore.scala 264:42]
  wire  _GEN_192 = _T_141 | _GEN_155; // @[Conditional.scala 39:67 ProcessingCore.scala 247:27]
  wire  _GEN_397 = _T_12 | _GEN_192; // @[Conditional.scala 39:67 ProcessingCore.scala 241:27]
  wire  _GEN_469 = _T_11 | _GEN_397; // @[Conditional.scala 39:67 ProcessingCore.scala 222:35]
  wire  _GEN_671 = _T_10 | _GEN_469; // @[Conditional.scala 40:58 ProcessingCore.scala 215:27]
  wire  _GEN_876 = matrixRowCounter == VoutSizeReg | _T; // @[ProcessingCore.scala 292:51 ProcessingCore.scala 293:31]
  wire  _GEN_877 = colBanksCounter == VoutSizeReg ? _GEN_876 : _T; // @[ProcessingCore.scala 291:50]
  wire  _GEN_1000 = rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (
    rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip
     | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (
    rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip
     | (rdWrEnaFlip | _T))))))))))))))))))))))))))))); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 322:31]
  wire  _GEN_1008 = rdWrEnaFlip | (rdWrEnaFlip | _GEN_1000); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 322:31]
  wire  _instructionDone_T = ~rdWrEnaFlip; // @[ProcessingCore.scala 330:45]
  wire  _GEN_1013 = _T_141 | _T; // @[Conditional.scala 39:67 ProcessingCore.scala 346:27]
  wire  _GEN_1014 = _T_12 ? ~rdWrEnaFlip : _GEN_1013; // @[Conditional.scala 39:67 ProcessingCore.scala 330:42]
  wire  _GEN_1091 = _T_11 ? _GEN_1008 : _GEN_1014; // @[Conditional.scala 39:67]
  wire  _GEN_1225 = _T_10 ? _GEN_877 : _GEN_1091; // @[Conditional.scala 40:58]
  wire  _GEN_1431 = op == 2'h0 ? _GEN_1225 : 1'h1; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 350:23]
  wire  _GEN_1635 = op == 2'h1 ? _GEN_671 : _GEN_1431; // @[ProcessingCore.scala 209:44]
  wire  instructionDone = Controller == 2'h3 ? _GEN_1635 : _T; // @[ProcessingCore.scala 207:33]
  wire [1:0] _GEN_67 = instructionDone ? _GEN_66 : Controller; // @[ProcessingCore.scala 186:28 ProcessingCore.scala 161:32]
  wire [1:0] _GEN_68 = _T_4 ? _GEN_67 : Controller; // @[Conditional.scala 39:67 ProcessingCore.scala 161:32]
  wire  _GEN_74 = _T_1 ? 1'h0 : _T_2 & _GEN_65; // @[Conditional.scala 39:67]
  wire [12:0] _GEN_79 = func == 3'h0 ? 13'h0 : colBanksCounter; // @[ProcessingCore.scala 200:25 ProcessingCore.scala 201:25 ProcessingCore.scala 74:33]
  wire [12:0] _GEN_80 = func == 3'h0 ? 13'h0 : matrixRowCounter; // @[ProcessingCore.scala 200:25 ProcessingCore.scala 202:25 ProcessingCore.scala 75:33]
  wire [12:0] _GEN_81 = Controller == 2'h2 ? _GEN_79 : colBanksCounter; // @[ProcessingCore.scala 199:30 ProcessingCore.scala 74:33]
  wire [12:0] _GEN_82 = Controller == 2'h2 ? _GEN_80 : matrixRowCounter; // @[ProcessingCore.scala 199:30 ProcessingCore.scala 75:33]
  wire [1:0] _T_14 = {1'h0,oneHotDecoder_io_writeSignal_0}; // @[Cat.scala 30:58]
  wire [4:0] _T_16 = {_T_14, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_18 = {1'h0,oneHotDecoder_io_writeSignal_1}; // @[Cat.scala 30:58]
  wire [4:0] _T_20 = {_T_18, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_22 = {1'h0,oneHotDecoder_io_writeSignal_2}; // @[Cat.scala 30:58]
  wire [4:0] _T_24 = {_T_22, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_26 = {1'h0,oneHotDecoder_io_writeSignal_3}; // @[Cat.scala 30:58]
  wire [4:0] _T_28 = {_T_26, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_30 = {1'h0,oneHotDecoder_io_writeSignal_4}; // @[Cat.scala 30:58]
  wire [4:0] _T_32 = {_T_30, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_34 = {1'h0,oneHotDecoder_io_writeSignal_5}; // @[Cat.scala 30:58]
  wire [4:0] _T_36 = {_T_34, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_38 = {1'h0,oneHotDecoder_io_writeSignal_6}; // @[Cat.scala 30:58]
  wire [4:0] _T_40 = {_T_38, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_42 = {1'h0,oneHotDecoder_io_writeSignal_7}; // @[Cat.scala 30:58]
  wire [4:0] _T_44 = {_T_42, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_46 = {1'h0,oneHotDecoder_io_writeSignal_8}; // @[Cat.scala 30:58]
  wire [4:0] _T_48 = {_T_46, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_50 = {1'h0,oneHotDecoder_io_writeSignal_9}; // @[Cat.scala 30:58]
  wire [4:0] _T_52 = {_T_50, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_54 = {1'h0,oneHotDecoder_io_writeSignal_10}; // @[Cat.scala 30:58]
  wire [4:0] _T_56 = {_T_54, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_58 = {1'h0,oneHotDecoder_io_writeSignal_11}; // @[Cat.scala 30:58]
  wire [4:0] _T_60 = {_T_58, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_62 = {1'h0,oneHotDecoder_io_writeSignal_12}; // @[Cat.scala 30:58]
  wire [4:0] _T_64 = {_T_62, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_66 = {1'h0,oneHotDecoder_io_writeSignal_13}; // @[Cat.scala 30:58]
  wire [4:0] _T_68 = {_T_66, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_70 = {1'h0,oneHotDecoder_io_writeSignal_14}; // @[Cat.scala 30:58]
  wire [4:0] _T_72 = {_T_70, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_74 = {1'h0,oneHotDecoder_io_writeSignal_15}; // @[Cat.scala 30:58]
  wire [4:0] _T_76 = {_T_74, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_78 = {1'h0,oneHotDecoder_io_writeSignal_16}; // @[Cat.scala 30:58]
  wire [4:0] _T_80 = {_T_78, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_82 = {1'h0,oneHotDecoder_io_writeSignal_17}; // @[Cat.scala 30:58]
  wire [4:0] _T_84 = {_T_82, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_86 = {1'h0,oneHotDecoder_io_writeSignal_18}; // @[Cat.scala 30:58]
  wire [4:0] _T_88 = {_T_86, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_90 = {1'h0,oneHotDecoder_io_writeSignal_19}; // @[Cat.scala 30:58]
  wire [4:0] _T_92 = {_T_90, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_94 = {1'h0,oneHotDecoder_io_writeSignal_20}; // @[Cat.scala 30:58]
  wire [4:0] _T_96 = {_T_94, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_98 = {1'h0,oneHotDecoder_io_writeSignal_21}; // @[Cat.scala 30:58]
  wire [4:0] _T_100 = {_T_98, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_102 = {1'h0,oneHotDecoder_io_writeSignal_22}; // @[Cat.scala 30:58]
  wire [4:0] _T_104 = {_T_102, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_106 = {1'h0,oneHotDecoder_io_writeSignal_23}; // @[Cat.scala 30:58]
  wire [4:0] _T_108 = {_T_106, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_110 = {1'h0,oneHotDecoder_io_writeSignal_24}; // @[Cat.scala 30:58]
  wire [4:0] _T_112 = {_T_110, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_114 = {1'h0,oneHotDecoder_io_writeSignal_25}; // @[Cat.scala 30:58]
  wire [4:0] _T_116 = {_T_114, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_118 = {1'h0,oneHotDecoder_io_writeSignal_26}; // @[Cat.scala 30:58]
  wire [4:0] _T_120 = {_T_118, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_122 = {1'h0,oneHotDecoder_io_writeSignal_27}; // @[Cat.scala 30:58]
  wire [4:0] _T_124 = {_T_122, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_126 = {1'h0,oneHotDecoder_io_writeSignal_28}; // @[Cat.scala 30:58]
  wire [4:0] _T_128 = {_T_126, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_130 = {1'h0,oneHotDecoder_io_writeSignal_29}; // @[Cat.scala 30:58]
  wire [4:0] _T_132 = {_T_130, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_134 = {1'h0,oneHotDecoder_io_writeSignal_30}; // @[Cat.scala 30:58]
  wire [4:0] _T_136 = {_T_134, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [1:0] _T_138 = {1'h0,oneHotDecoder_io_writeSignal_31}; // @[Cat.scala 30:58]
  wire [4:0] _T_140 = {_T_138, 3'h0}; // @[ProcessingCore.scala 239:126]
  wire [4:0] _GEN_83 = _T_143 ? matrixCol : 5'h0; // @[Conditional.scala 39:67 ProcessingCore.scala 267:45 ProcessingCore.scala 85:37]
  wire [9:0] _GEN_84 = _T_143 ? matrixRow : 10'h0; // @[Conditional.scala 39:67 ProcessingCore.scala 268:45]
  wire  _GEN_87 = _T_143 & memReadDecoder_io_activatedSignals_0; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_88 = _T_143 & memReadDecoder_io_activatedSignals_1; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_89 = _T_143 & memReadDecoder_io_activatedSignals_2; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_90 = _T_143 & memReadDecoder_io_activatedSignals_3; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_91 = _T_143 & memReadDecoder_io_activatedSignals_4; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_92 = _T_143 & memReadDecoder_io_activatedSignals_5; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_93 = _T_143 & memReadDecoder_io_activatedSignals_6; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_94 = _T_143 & memReadDecoder_io_activatedSignals_7; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_95 = _T_143 & memReadDecoder_io_activatedSignals_8; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_96 = _T_143 & memReadDecoder_io_activatedSignals_9; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_97 = _T_143 & memReadDecoder_io_activatedSignals_10; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_98 = _T_143 & memReadDecoder_io_activatedSignals_11; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_99 = _T_143 & memReadDecoder_io_activatedSignals_12; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_100 = _T_143 & memReadDecoder_io_activatedSignals_13; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_101 = _T_143 & memReadDecoder_io_activatedSignals_14; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_102 = _T_143 & memReadDecoder_io_activatedSignals_15; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_103 = _T_143 & memReadDecoder_io_activatedSignals_16; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_104 = _T_143 & memReadDecoder_io_activatedSignals_17; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_105 = _T_143 & memReadDecoder_io_activatedSignals_18; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_106 = _T_143 & memReadDecoder_io_activatedSignals_19; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_107 = _T_143 & memReadDecoder_io_activatedSignals_20; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_108 = _T_143 & memReadDecoder_io_activatedSignals_21; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_109 = _T_143 & memReadDecoder_io_activatedSignals_22; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_110 = _T_143 & memReadDecoder_io_activatedSignals_23; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_111 = _T_143 & memReadDecoder_io_activatedSignals_24; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_112 = _T_143 & memReadDecoder_io_activatedSignals_25; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_113 = _T_143 & memReadDecoder_io_activatedSignals_26; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_114 = _T_143 & memReadDecoder_io_activatedSignals_27; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_115 = _T_143 & memReadDecoder_io_activatedSignals_28; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_116 = _T_143 & memReadDecoder_io_activatedSignals_29; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_117 = _T_143 & memReadDecoder_io_activatedSignals_30; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_118 = _T_143 & memReadDecoder_io_activatedSignals_31; // @[Conditional.scala 39:67 ProcessingCore.scala 273:31 ProcessingCore.scala 101:34]
  wire  _GEN_119 = _T_142 | _T_143; // @[Conditional.scala 39:67 ProcessingCore.scala 257:36]
  wire [4:0] _GEN_120 = _T_142 ? matrixCol : _GEN_83; // @[Conditional.scala 39:67 ProcessingCore.scala 258:36]
  wire  _GEN_121 = _T_142 & memReadDecoder_io_activatedSignals_0; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire [9:0] _GEN_122 = _T_142 ? matrixRow : 10'h0; // @[Conditional.scala 39:67 ProcessingCore.scala 261:48 ProcessingCore.scala 104:40]
  wire  _GEN_123 = _T_142 & memReadDecoder_io_activatedSignals_1; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_124 = _T_142 & memReadDecoder_io_activatedSignals_2; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_125 = _T_142 & memReadDecoder_io_activatedSignals_3; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_126 = _T_142 & memReadDecoder_io_activatedSignals_4; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_127 = _T_142 & memReadDecoder_io_activatedSignals_5; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_128 = _T_142 & memReadDecoder_io_activatedSignals_6; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_129 = _T_142 & memReadDecoder_io_activatedSignals_7; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_130 = _T_142 & memReadDecoder_io_activatedSignals_8; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_131 = _T_142 & memReadDecoder_io_activatedSignals_9; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_132 = _T_142 & memReadDecoder_io_activatedSignals_10; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_133 = _T_142 & memReadDecoder_io_activatedSignals_11; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_134 = _T_142 & memReadDecoder_io_activatedSignals_12; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_135 = _T_142 & memReadDecoder_io_activatedSignals_13; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_136 = _T_142 & memReadDecoder_io_activatedSignals_14; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_137 = _T_142 & memReadDecoder_io_activatedSignals_15; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_138 = _T_142 & memReadDecoder_io_activatedSignals_16; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_139 = _T_142 & memReadDecoder_io_activatedSignals_17; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_140 = _T_142 & memReadDecoder_io_activatedSignals_18; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_141 = _T_142 & memReadDecoder_io_activatedSignals_19; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_142 = _T_142 & memReadDecoder_io_activatedSignals_20; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_143 = _T_142 & memReadDecoder_io_activatedSignals_21; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_144 = _T_142 & memReadDecoder_io_activatedSignals_22; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_145 = _T_142 & memReadDecoder_io_activatedSignals_23; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_146 = _T_142 & memReadDecoder_io_activatedSignals_24; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_147 = _T_142 & memReadDecoder_io_activatedSignals_25; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_148 = _T_142 & memReadDecoder_io_activatedSignals_26; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_149 = _T_142 & memReadDecoder_io_activatedSignals_27; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_150 = _T_142 & memReadDecoder_io_activatedSignals_28; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_151 = _T_142 & memReadDecoder_io_activatedSignals_29; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_152 = _T_142 & memReadDecoder_io_activatedSignals_30; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire  _GEN_153 = _T_142 & memReadDecoder_io_activatedSignals_31; // @[Conditional.scala 39:67 ProcessingCore.scala 260:48 ProcessingCore.scala 105:40]
  wire [9:0] _GEN_156 = _T_142 ? 10'h0 : _GEN_84; // @[Conditional.scala 39:67]
  wire  _GEN_157 = _T_142 ? 1'h0 : _T_143; // @[Conditional.scala 39:67 ProcessingCore.scala 81:37]
  wire  _GEN_158 = _T_142 ? 1'h0 : _GEN_87; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_159 = _T_142 ? 1'h0 : _GEN_88; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_160 = _T_142 ? 1'h0 : _GEN_89; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_161 = _T_142 ? 1'h0 : _GEN_90; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_162 = _T_142 ? 1'h0 : _GEN_91; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_163 = _T_142 ? 1'h0 : _GEN_92; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_164 = _T_142 ? 1'h0 : _GEN_93; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_165 = _T_142 ? 1'h0 : _GEN_94; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_166 = _T_142 ? 1'h0 : _GEN_95; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_167 = _T_142 ? 1'h0 : _GEN_96; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_168 = _T_142 ? 1'h0 : _GEN_97; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_169 = _T_142 ? 1'h0 : _GEN_98; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_170 = _T_142 ? 1'h0 : _GEN_99; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_171 = _T_142 ? 1'h0 : _GEN_100; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_172 = _T_142 ? 1'h0 : _GEN_101; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_173 = _T_142 ? 1'h0 : _GEN_102; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_174 = _T_142 ? 1'h0 : _GEN_103; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_175 = _T_142 ? 1'h0 : _GEN_104; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_176 = _T_142 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_177 = _T_142 ? 1'h0 : _GEN_106; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_178 = _T_142 ? 1'h0 : _GEN_107; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_179 = _T_142 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_180 = _T_142 ? 1'h0 : _GEN_109; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_181 = _T_142 ? 1'h0 : _GEN_110; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_182 = _T_142 ? 1'h0 : _GEN_111; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_183 = _T_142 ? 1'h0 : _GEN_112; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_184 = _T_142 ? 1'h0 : _GEN_113; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_185 = _T_142 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_186 = _T_142 ? 1'h0 : _GEN_115; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_187 = _T_142 ? 1'h0 : _GEN_116; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_188 = _T_142 ? 1'h0 : _GEN_117; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_189 = _T_142 ? 1'h0 : _GEN_118; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire [4:0] _GEN_191 = _T_141 ? matrixCol : 5'h0; // @[Conditional.scala 39:67 ProcessingCore.scala 246:35 ProcessingCore.scala 84:37]
  wire  _GEN_193 = _T_141 & oneHotDecoder_io_writeSignal_0; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire [9:0] _GEN_194 = _T_141 ? matrixRow : 10'h0; // @[Conditional.scala 39:67 ProcessingCore.scala 250:49 ProcessingCore.scala 103:40]
  wire [11:0] _GEN_195 = _T_141 ? $signed(weightValue) : $signed(12'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 251:49 ProcessingCore.scala 107:40]
  wire  _GEN_196 = _T_141 & oneHotDecoder_io_writeSignal_1; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_197 = _T_141 & oneHotDecoder_io_writeSignal_2; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_198 = _T_141 & oneHotDecoder_io_writeSignal_3; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_199 = _T_141 & oneHotDecoder_io_writeSignal_4; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_200 = _T_141 & oneHotDecoder_io_writeSignal_5; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_201 = _T_141 & oneHotDecoder_io_writeSignal_6; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_202 = _T_141 & oneHotDecoder_io_writeSignal_7; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_203 = _T_141 & oneHotDecoder_io_writeSignal_8; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_204 = _T_141 & oneHotDecoder_io_writeSignal_9; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_205 = _T_141 & oneHotDecoder_io_writeSignal_10; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_206 = _T_141 & oneHotDecoder_io_writeSignal_11; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_207 = _T_141 & oneHotDecoder_io_writeSignal_12; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_208 = _T_141 & oneHotDecoder_io_writeSignal_13; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_209 = _T_141 & oneHotDecoder_io_writeSignal_14; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_210 = _T_141 & oneHotDecoder_io_writeSignal_15; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_211 = _T_141 & oneHotDecoder_io_writeSignal_16; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_212 = _T_141 & oneHotDecoder_io_writeSignal_17; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_213 = _T_141 & oneHotDecoder_io_writeSignal_18; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_214 = _T_141 & oneHotDecoder_io_writeSignal_19; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_215 = _T_141 & oneHotDecoder_io_writeSignal_20; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_216 = _T_141 & oneHotDecoder_io_writeSignal_21; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_217 = _T_141 & oneHotDecoder_io_writeSignal_22; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_218 = _T_141 & oneHotDecoder_io_writeSignal_23; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_219 = _T_141 & oneHotDecoder_io_writeSignal_24; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_220 = _T_141 & oneHotDecoder_io_writeSignal_25; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_221 = _T_141 & oneHotDecoder_io_writeSignal_26; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_222 = _T_141 & oneHotDecoder_io_writeSignal_27; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_223 = _T_141 & oneHotDecoder_io_writeSignal_28; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_224 = _T_141 & oneHotDecoder_io_writeSignal_29; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_225 = _T_141 & oneHotDecoder_io_writeSignal_30; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_226 = _T_141 & oneHotDecoder_io_writeSignal_31; // @[Conditional.scala 39:67 ProcessingCore.scala 249:49 ProcessingCore.scala 106:40]
  wire  _GEN_227 = _T_141 ? 1'h0 : _GEN_119; // @[Conditional.scala 39:67 ProcessingCore.scala 83:37]
  wire [4:0] _GEN_228 = _T_141 ? 5'h0 : _GEN_120; // @[Conditional.scala 39:67 ProcessingCore.scala 85:37]
  wire  _GEN_229 = _T_141 ? 1'h0 : _GEN_121; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire [9:0] _GEN_230 = _T_141 ? 10'h0 : _GEN_122; // @[Conditional.scala 39:67 ProcessingCore.scala 104:40]
  wire  _GEN_231 = _T_141 ? 1'h0 : _GEN_123; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_232 = _T_141 ? 1'h0 : _GEN_124; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_233 = _T_141 ? 1'h0 : _GEN_125; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_234 = _T_141 ? 1'h0 : _GEN_126; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_235 = _T_141 ? 1'h0 : _GEN_127; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_236 = _T_141 ? 1'h0 : _GEN_128; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_237 = _T_141 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_238 = _T_141 ? 1'h0 : _GEN_130; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_239 = _T_141 ? 1'h0 : _GEN_131; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_240 = _T_141 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_241 = _T_141 ? 1'h0 : _GEN_133; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_242 = _T_141 ? 1'h0 : _GEN_134; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_243 = _T_141 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_244 = _T_141 ? 1'h0 : _GEN_136; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_245 = _T_141 ? 1'h0 : _GEN_137; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_246 = _T_141 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_247 = _T_141 ? 1'h0 : _GEN_139; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_248 = _T_141 ? 1'h0 : _GEN_140; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_249 = _T_141 ? 1'h0 : _GEN_141; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_250 = _T_141 ? 1'h0 : _GEN_142; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_251 = _T_141 ? 1'h0 : _GEN_143; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_252 = _T_141 ? 1'h0 : _GEN_144; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_253 = _T_141 ? 1'h0 : _GEN_145; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_254 = _T_141 ? 1'h0 : _GEN_146; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_255 = _T_141 ? 1'h0 : _GEN_147; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_256 = _T_141 ? 1'h0 : _GEN_148; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_257 = _T_141 ? 1'h0 : _GEN_149; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_258 = _T_141 ? 1'h0 : _GEN_150; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_259 = _T_141 ? 1'h0 : _GEN_151; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_260 = _T_141 ? 1'h0 : _GEN_152; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_261 = _T_141 ? 1'h0 : _GEN_153; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_262 = _T_141 ? 1'h0 : _T_142; // @[Conditional.scala 39:67 ProcessingCore.scala 80:37]
  wire [9:0] _GEN_263 = _T_141 ? 10'h0 : _GEN_156; // @[Conditional.scala 39:67]
  wire  _GEN_264 = _T_141 ? 1'h0 : _GEN_157; // @[Conditional.scala 39:67 ProcessingCore.scala 81:37]
  wire  _GEN_265 = _T_141 ? 1'h0 : _GEN_158; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_266 = _T_141 ? 1'h0 : _GEN_159; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_267 = _T_141 ? 1'h0 : _GEN_160; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_268 = _T_141 ? 1'h0 : _GEN_161; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_269 = _T_141 ? 1'h0 : _GEN_162; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_270 = _T_141 ? 1'h0 : _GEN_163; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_271 = _T_141 ? 1'h0 : _GEN_164; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_272 = _T_141 ? 1'h0 : _GEN_165; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_273 = _T_141 ? 1'h0 : _GEN_166; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_274 = _T_141 ? 1'h0 : _GEN_167; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_275 = _T_141 ? 1'h0 : _GEN_168; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_276 = _T_141 ? 1'h0 : _GEN_169; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_277 = _T_141 ? 1'h0 : _GEN_170; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_278 = _T_141 ? 1'h0 : _GEN_171; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_279 = _T_141 ? 1'h0 : _GEN_172; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_280 = _T_141 ? 1'h0 : _GEN_173; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_281 = _T_141 ? 1'h0 : _GEN_174; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_282 = _T_141 ? 1'h0 : _GEN_175; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_283 = _T_141 ? 1'h0 : _GEN_176; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_284 = _T_141 ? 1'h0 : _GEN_177; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_285 = _T_141 ? 1'h0 : _GEN_178; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_286 = _T_141 ? 1'h0 : _GEN_179; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_287 = _T_141 ? 1'h0 : _GEN_180; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_288 = _T_141 ? 1'h0 : _GEN_181; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_289 = _T_141 ? 1'h0 : _GEN_182; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_290 = _T_141 ? 1'h0 : _GEN_183; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_291 = _T_141 ? 1'h0 : _GEN_184; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_292 = _T_141 ? 1'h0 : _GEN_185; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_293 = _T_141 ? 1'h0 : _GEN_186; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_294 = _T_141 ? 1'h0 : _GEN_187; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_295 = _T_141 ? 1'h0 : _GEN_188; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_296 = _T_141 ? 1'h0 : _GEN_189; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_297 = _T_12 | _GEN_227; // @[Conditional.scala 39:67 ProcessingCore.scala 232:36]
  wire [5:0] _GEN_298 = _T_12 ? io_state : {{1'd0}, _GEN_228}; // @[Conditional.scala 39:67 ProcessingCore.scala 233:36]
  wire  _GEN_299 = _T_12 | _T_141; // @[Conditional.scala 39:67 ProcessingCore.scala 234:36]
  wire [5:0] _GEN_300 = _T_12 ? io_state : {{1'd0}, _GEN_191}; // @[Conditional.scala 39:67 ProcessingCore.scala 235:36]
  wire  _GEN_301 = _T_12 ? memReadDecoder_io_activatedSignals_0 : _GEN_193; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [9:0] _GEN_302 = _T_12 ? matrixRow : _GEN_194; // @[Conditional.scala 39:67 ProcessingCore.scala 238:49]
  wire [11:0] _GEN_303 = _T_12 ? $signed({{7{_T_16[4]}},_T_16}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_304 = _T_12 ? memReadDecoder_io_activatedSignals_1 : _GEN_196; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_306 = _T_12 ? $signed({{7{_T_20[4]}},_T_20}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_307 = _T_12 ? memReadDecoder_io_activatedSignals_2 : _GEN_197; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_309 = _T_12 ? $signed({{7{_T_24[4]}},_T_24}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_310 = _T_12 ? memReadDecoder_io_activatedSignals_3 : _GEN_198; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_312 = _T_12 ? $signed({{7{_T_28[4]}},_T_28}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_313 = _T_12 ? memReadDecoder_io_activatedSignals_4 : _GEN_199; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_315 = _T_12 ? $signed({{7{_T_32[4]}},_T_32}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_316 = _T_12 ? memReadDecoder_io_activatedSignals_5 : _GEN_200; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_318 = _T_12 ? $signed({{7{_T_36[4]}},_T_36}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_319 = _T_12 ? memReadDecoder_io_activatedSignals_6 : _GEN_201; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_321 = _T_12 ? $signed({{7{_T_40[4]}},_T_40}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_322 = _T_12 ? memReadDecoder_io_activatedSignals_7 : _GEN_202; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_324 = _T_12 ? $signed({{7{_T_44[4]}},_T_44}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_325 = _T_12 ? memReadDecoder_io_activatedSignals_8 : _GEN_203; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_327 = _T_12 ? $signed({{7{_T_48[4]}},_T_48}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_328 = _T_12 ? memReadDecoder_io_activatedSignals_9 : _GEN_204; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_330 = _T_12 ? $signed({{7{_T_52[4]}},_T_52}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_331 = _T_12 ? memReadDecoder_io_activatedSignals_10 : _GEN_205; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_333 = _T_12 ? $signed({{7{_T_56[4]}},_T_56}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_334 = _T_12 ? memReadDecoder_io_activatedSignals_11 : _GEN_206; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_336 = _T_12 ? $signed({{7{_T_60[4]}},_T_60}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_337 = _T_12 ? memReadDecoder_io_activatedSignals_12 : _GEN_207; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_339 = _T_12 ? $signed({{7{_T_64[4]}},_T_64}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_340 = _T_12 ? memReadDecoder_io_activatedSignals_13 : _GEN_208; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_342 = _T_12 ? $signed({{7{_T_68[4]}},_T_68}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_343 = _T_12 ? memReadDecoder_io_activatedSignals_14 : _GEN_209; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_345 = _T_12 ? $signed({{7{_T_72[4]}},_T_72}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_346 = _T_12 ? memReadDecoder_io_activatedSignals_15 : _GEN_210; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_348 = _T_12 ? $signed({{7{_T_76[4]}},_T_76}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_349 = _T_12 ? memReadDecoder_io_activatedSignals_16 : _GEN_211; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_351 = _T_12 ? $signed({{7{_T_80[4]}},_T_80}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_352 = _T_12 ? memReadDecoder_io_activatedSignals_17 : _GEN_212; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_354 = _T_12 ? $signed({{7{_T_84[4]}},_T_84}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_355 = _T_12 ? memReadDecoder_io_activatedSignals_18 : _GEN_213; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_357 = _T_12 ? $signed({{7{_T_88[4]}},_T_88}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_358 = _T_12 ? memReadDecoder_io_activatedSignals_19 : _GEN_214; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_360 = _T_12 ? $signed({{7{_T_92[4]}},_T_92}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_361 = _T_12 ? memReadDecoder_io_activatedSignals_20 : _GEN_215; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_363 = _T_12 ? $signed({{7{_T_96[4]}},_T_96}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_364 = _T_12 ? memReadDecoder_io_activatedSignals_21 : _GEN_216; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_366 = _T_12 ? $signed({{7{_T_100[4]}},_T_100}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_367 = _T_12 ? memReadDecoder_io_activatedSignals_22 : _GEN_217; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_369 = _T_12 ? $signed({{7{_T_104[4]}},_T_104}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_370 = _T_12 ? memReadDecoder_io_activatedSignals_23 : _GEN_218; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_372 = _T_12 ? $signed({{7{_T_108[4]}},_T_108}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_373 = _T_12 ? memReadDecoder_io_activatedSignals_24 : _GEN_219; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_375 = _T_12 ? $signed({{7{_T_112[4]}},_T_112}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_376 = _T_12 ? memReadDecoder_io_activatedSignals_25 : _GEN_220; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_378 = _T_12 ? $signed({{7{_T_116[4]}},_T_116}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_379 = _T_12 ? memReadDecoder_io_activatedSignals_26 : _GEN_221; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_381 = _T_12 ? $signed({{7{_T_120[4]}},_T_120}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_382 = _T_12 ? memReadDecoder_io_activatedSignals_27 : _GEN_222; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_384 = _T_12 ? $signed({{7{_T_124[4]}},_T_124}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_385 = _T_12 ? memReadDecoder_io_activatedSignals_28 : _GEN_223; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_387 = _T_12 ? $signed({{7{_T_128[4]}},_T_128}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_388 = _T_12 ? memReadDecoder_io_activatedSignals_29 : _GEN_224; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_390 = _T_12 ? $signed({{7{_T_132[4]}},_T_132}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_391 = _T_12 ? memReadDecoder_io_activatedSignals_30 : _GEN_225; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_393 = _T_12 ? $signed({{7{_T_136[4]}},_T_136}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_394 = _T_12 ? memReadDecoder_io_activatedSignals_31 : _GEN_226; // @[Conditional.scala 39:67 ProcessingCore.scala 237:49]
  wire [11:0] _GEN_396 = _T_12 ? $signed({{7{_T_140[4]}},_T_140}) : $signed(_GEN_195); // @[Conditional.scala 39:67 ProcessingCore.scala 239:49]
  wire  _GEN_398 = _T_12 ? 1'h0 : _GEN_229; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire [9:0] _GEN_399 = _T_12 ? 10'h0 : _GEN_230; // @[Conditional.scala 39:67 ProcessingCore.scala 104:40]
  wire  _GEN_400 = _T_12 ? 1'h0 : _GEN_231; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_401 = _T_12 ? 1'h0 : _GEN_232; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_402 = _T_12 ? 1'h0 : _GEN_233; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_403 = _T_12 ? 1'h0 : _GEN_234; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_404 = _T_12 ? 1'h0 : _GEN_235; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_405 = _T_12 ? 1'h0 : _GEN_236; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_406 = _T_12 ? 1'h0 : _GEN_237; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_407 = _T_12 ? 1'h0 : _GEN_238; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_408 = _T_12 ? 1'h0 : _GEN_239; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_409 = _T_12 ? 1'h0 : _GEN_240; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_410 = _T_12 ? 1'h0 : _GEN_241; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_411 = _T_12 ? 1'h0 : _GEN_242; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_412 = _T_12 ? 1'h0 : _GEN_243; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_413 = _T_12 ? 1'h0 : _GEN_244; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_414 = _T_12 ? 1'h0 : _GEN_245; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_415 = _T_12 ? 1'h0 : _GEN_246; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_416 = _T_12 ? 1'h0 : _GEN_247; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_417 = _T_12 ? 1'h0 : _GEN_248; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_418 = _T_12 ? 1'h0 : _GEN_249; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_419 = _T_12 ? 1'h0 : _GEN_250; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_420 = _T_12 ? 1'h0 : _GEN_251; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_421 = _T_12 ? 1'h0 : _GEN_252; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_422 = _T_12 ? 1'h0 : _GEN_253; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_423 = _T_12 ? 1'h0 : _GEN_254; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_424 = _T_12 ? 1'h0 : _GEN_255; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_425 = _T_12 ? 1'h0 : _GEN_256; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_426 = _T_12 ? 1'h0 : _GEN_257; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_427 = _T_12 ? 1'h0 : _GEN_258; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_428 = _T_12 ? 1'h0 : _GEN_259; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_429 = _T_12 ? 1'h0 : _GEN_260; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_430 = _T_12 ? 1'h0 : _GEN_261; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_431 = _T_12 ? 1'h0 : _GEN_262; // @[Conditional.scala 39:67 ProcessingCore.scala 80:37]
  wire [9:0] _GEN_432 = _T_12 ? 10'h0 : _GEN_263; // @[Conditional.scala 39:67]
  wire  _GEN_433 = _T_12 ? 1'h0 : _GEN_264; // @[Conditional.scala 39:67 ProcessingCore.scala 81:37]
  wire  _GEN_434 = _T_12 ? 1'h0 : _GEN_265; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_435 = _T_12 ? 1'h0 : _GEN_266; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_436 = _T_12 ? 1'h0 : _GEN_267; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_437 = _T_12 ? 1'h0 : _GEN_268; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_438 = _T_12 ? 1'h0 : _GEN_269; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_439 = _T_12 ? 1'h0 : _GEN_270; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_440 = _T_12 ? 1'h0 : _GEN_271; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_441 = _T_12 ? 1'h0 : _GEN_272; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_442 = _T_12 ? 1'h0 : _GEN_273; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_443 = _T_12 ? 1'h0 : _GEN_274; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_444 = _T_12 ? 1'h0 : _GEN_275; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_445 = _T_12 ? 1'h0 : _GEN_276; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_446 = _T_12 ? 1'h0 : _GEN_277; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_447 = _T_12 ? 1'h0 : _GEN_278; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_448 = _T_12 ? 1'h0 : _GEN_279; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_449 = _T_12 ? 1'h0 : _GEN_280; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_450 = _T_12 ? 1'h0 : _GEN_281; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_451 = _T_12 ? 1'h0 : _GEN_282; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_452 = _T_12 ? 1'h0 : _GEN_283; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_453 = _T_12 ? 1'h0 : _GEN_284; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_454 = _T_12 ? 1'h0 : _GEN_285; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_455 = _T_12 ? 1'h0 : _GEN_286; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_456 = _T_12 ? 1'h0 : _GEN_287; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_457 = _T_12 ? 1'h0 : _GEN_288; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_458 = _T_12 ? 1'h0 : _GEN_289; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_459 = _T_12 ? 1'h0 : _GEN_290; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_460 = _T_12 ? 1'h0 : _GEN_291; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_461 = _T_12 ? 1'h0 : _GEN_292; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_462 = _T_12 ? 1'h0 : _GEN_293; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_463 = _T_12 ? 1'h0 : _GEN_294; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_464 = _T_12 ? 1'h0 : _GEN_295; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_465 = _T_12 ? 1'h0 : _GEN_296; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_466 = _T_11 | _GEN_299; // @[Conditional.scala 39:67 ProcessingCore.scala 219:35]
  wire [5:0] _GEN_467 = _T_11 ? {{1'd0}, matrixCol} : _GEN_300; // @[Conditional.scala 39:67 ProcessingCore.scala 220:35]
  wire [9:0] _GEN_468 = _T_11 ? matrixRow : 10'h0; // @[Conditional.scala 39:67 ProcessingCore.scala 221:35]
  wire [11:0] _GEN_470 = _T_11 ? $signed(weightValue) : $signed(12'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 224:33]
  wire  _GEN_471 = _T_11 & oneHotDecoder_io_writeSignal_0; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_472 = _T_11 & oneHotDecoder_io_writeSignal_1; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_473 = _T_11 & oneHotDecoder_io_writeSignal_2; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_474 = _T_11 & oneHotDecoder_io_writeSignal_3; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_475 = _T_11 & oneHotDecoder_io_writeSignal_4; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_476 = _T_11 & oneHotDecoder_io_writeSignal_5; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_477 = _T_11 & oneHotDecoder_io_writeSignal_6; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_478 = _T_11 & oneHotDecoder_io_writeSignal_7; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_479 = _T_11 & oneHotDecoder_io_writeSignal_8; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_480 = _T_11 & oneHotDecoder_io_writeSignal_9; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_481 = _T_11 & oneHotDecoder_io_writeSignal_10; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_482 = _T_11 & oneHotDecoder_io_writeSignal_11; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_483 = _T_11 & oneHotDecoder_io_writeSignal_12; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_484 = _T_11 & oneHotDecoder_io_writeSignal_13; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_485 = _T_11 & oneHotDecoder_io_writeSignal_14; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_486 = _T_11 & oneHotDecoder_io_writeSignal_15; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_487 = _T_11 & oneHotDecoder_io_writeSignal_16; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_488 = _T_11 & oneHotDecoder_io_writeSignal_17; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_489 = _T_11 & oneHotDecoder_io_writeSignal_18; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_490 = _T_11 & oneHotDecoder_io_writeSignal_19; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_491 = _T_11 & oneHotDecoder_io_writeSignal_20; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_492 = _T_11 & oneHotDecoder_io_writeSignal_21; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_493 = _T_11 & oneHotDecoder_io_writeSignal_22; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_494 = _T_11 & oneHotDecoder_io_writeSignal_23; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_495 = _T_11 & oneHotDecoder_io_writeSignal_24; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_496 = _T_11 & oneHotDecoder_io_writeSignal_25; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_497 = _T_11 & oneHotDecoder_io_writeSignal_26; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_498 = _T_11 & oneHotDecoder_io_writeSignal_27; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_499 = _T_11 & oneHotDecoder_io_writeSignal_28; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_500 = _T_11 & oneHotDecoder_io_writeSignal_29; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_501 = _T_11 & oneHotDecoder_io_writeSignal_30; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_502 = _T_11 & oneHotDecoder_io_writeSignal_31; // @[Conditional.scala 39:67 ProcessingCore.scala 225:33]
  wire  _GEN_503 = _T_11 ? 1'h0 : _GEN_297; // @[Conditional.scala 39:67 ProcessingCore.scala 83:37]
  wire [5:0] _GEN_504 = _T_11 ? 6'h0 : _GEN_298; // @[Conditional.scala 39:67 ProcessingCore.scala 85:37]
  wire  _GEN_505 = _T_11 ? 1'h0 : _GEN_301; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [9:0] _GEN_506 = _T_11 ? 10'h0 : _GEN_302; // @[Conditional.scala 39:67 ProcessingCore.scala 103:40]
  wire [11:0] _GEN_507 = _T_11 ? $signed(12'sh0) : $signed(_GEN_303); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_508 = _T_11 ? 1'h0 : _GEN_304; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_510 = _T_11 ? $signed(12'sh0) : $signed(_GEN_306); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_511 = _T_11 ? 1'h0 : _GEN_307; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_513 = _T_11 ? $signed(12'sh0) : $signed(_GEN_309); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_514 = _T_11 ? 1'h0 : _GEN_310; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_516 = _T_11 ? $signed(12'sh0) : $signed(_GEN_312); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_517 = _T_11 ? 1'h0 : _GEN_313; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_519 = _T_11 ? $signed(12'sh0) : $signed(_GEN_315); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_520 = _T_11 ? 1'h0 : _GEN_316; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_522 = _T_11 ? $signed(12'sh0) : $signed(_GEN_318); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_523 = _T_11 ? 1'h0 : _GEN_319; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_525 = _T_11 ? $signed(12'sh0) : $signed(_GEN_321); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_526 = _T_11 ? 1'h0 : _GEN_322; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_528 = _T_11 ? $signed(12'sh0) : $signed(_GEN_324); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_529 = _T_11 ? 1'h0 : _GEN_325; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_531 = _T_11 ? $signed(12'sh0) : $signed(_GEN_327); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_532 = _T_11 ? 1'h0 : _GEN_328; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_534 = _T_11 ? $signed(12'sh0) : $signed(_GEN_330); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_535 = _T_11 ? 1'h0 : _GEN_331; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_537 = _T_11 ? $signed(12'sh0) : $signed(_GEN_333); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_538 = _T_11 ? 1'h0 : _GEN_334; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_540 = _T_11 ? $signed(12'sh0) : $signed(_GEN_336); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_541 = _T_11 ? 1'h0 : _GEN_337; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_543 = _T_11 ? $signed(12'sh0) : $signed(_GEN_339); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_544 = _T_11 ? 1'h0 : _GEN_340; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_546 = _T_11 ? $signed(12'sh0) : $signed(_GEN_342); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_547 = _T_11 ? 1'h0 : _GEN_343; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_549 = _T_11 ? $signed(12'sh0) : $signed(_GEN_345); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_550 = _T_11 ? 1'h0 : _GEN_346; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_552 = _T_11 ? $signed(12'sh0) : $signed(_GEN_348); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_553 = _T_11 ? 1'h0 : _GEN_349; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_555 = _T_11 ? $signed(12'sh0) : $signed(_GEN_351); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_556 = _T_11 ? 1'h0 : _GEN_352; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_558 = _T_11 ? $signed(12'sh0) : $signed(_GEN_354); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_559 = _T_11 ? 1'h0 : _GEN_355; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_561 = _T_11 ? $signed(12'sh0) : $signed(_GEN_357); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_562 = _T_11 ? 1'h0 : _GEN_358; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_564 = _T_11 ? $signed(12'sh0) : $signed(_GEN_360); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_565 = _T_11 ? 1'h0 : _GEN_361; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_567 = _T_11 ? $signed(12'sh0) : $signed(_GEN_363); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_568 = _T_11 ? 1'h0 : _GEN_364; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_570 = _T_11 ? $signed(12'sh0) : $signed(_GEN_366); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_571 = _T_11 ? 1'h0 : _GEN_367; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_573 = _T_11 ? $signed(12'sh0) : $signed(_GEN_369); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_574 = _T_11 ? 1'h0 : _GEN_370; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_576 = _T_11 ? $signed(12'sh0) : $signed(_GEN_372); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_577 = _T_11 ? 1'h0 : _GEN_373; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_579 = _T_11 ? $signed(12'sh0) : $signed(_GEN_375); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_580 = _T_11 ? 1'h0 : _GEN_376; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_582 = _T_11 ? $signed(12'sh0) : $signed(_GEN_378); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_583 = _T_11 ? 1'h0 : _GEN_379; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_585 = _T_11 ? $signed(12'sh0) : $signed(_GEN_381); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_586 = _T_11 ? 1'h0 : _GEN_382; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_588 = _T_11 ? $signed(12'sh0) : $signed(_GEN_384); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_589 = _T_11 ? 1'h0 : _GEN_385; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_591 = _T_11 ? $signed(12'sh0) : $signed(_GEN_387); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_592 = _T_11 ? 1'h0 : _GEN_388; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_594 = _T_11 ? $signed(12'sh0) : $signed(_GEN_390); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_595 = _T_11 ? 1'h0 : _GEN_391; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_597 = _T_11 ? $signed(12'sh0) : $signed(_GEN_393); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_598 = _T_11 ? 1'h0 : _GEN_394; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_600 = _T_11 ? $signed(12'sh0) : $signed(_GEN_396); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_601 = _T_11 ? 1'h0 : _GEN_398; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire [9:0] _GEN_602 = _T_11 ? 10'h0 : _GEN_399; // @[Conditional.scala 39:67 ProcessingCore.scala 104:40]
  wire  _GEN_603 = _T_11 ? 1'h0 : _GEN_400; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_604 = _T_11 ? 1'h0 : _GEN_401; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_605 = _T_11 ? 1'h0 : _GEN_402; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_606 = _T_11 ? 1'h0 : _GEN_403; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_607 = _T_11 ? 1'h0 : _GEN_404; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_608 = _T_11 ? 1'h0 : _GEN_405; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_609 = _T_11 ? 1'h0 : _GEN_406; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_610 = _T_11 ? 1'h0 : _GEN_407; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_611 = _T_11 ? 1'h0 : _GEN_408; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_612 = _T_11 ? 1'h0 : _GEN_409; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_613 = _T_11 ? 1'h0 : _GEN_410; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_614 = _T_11 ? 1'h0 : _GEN_411; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_615 = _T_11 ? 1'h0 : _GEN_412; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_616 = _T_11 ? 1'h0 : _GEN_413; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_617 = _T_11 ? 1'h0 : _GEN_414; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_618 = _T_11 ? 1'h0 : _GEN_415; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_619 = _T_11 ? 1'h0 : _GEN_416; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_620 = _T_11 ? 1'h0 : _GEN_417; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_621 = _T_11 ? 1'h0 : _GEN_418; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_622 = _T_11 ? 1'h0 : _GEN_419; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_623 = _T_11 ? 1'h0 : _GEN_420; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_624 = _T_11 ? 1'h0 : _GEN_421; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_625 = _T_11 ? 1'h0 : _GEN_422; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_626 = _T_11 ? 1'h0 : _GEN_423; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_627 = _T_11 ? 1'h0 : _GEN_424; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_628 = _T_11 ? 1'h0 : _GEN_425; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_629 = _T_11 ? 1'h0 : _GEN_426; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_630 = _T_11 ? 1'h0 : _GEN_427; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_631 = _T_11 ? 1'h0 : _GEN_428; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_632 = _T_11 ? 1'h0 : _GEN_429; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_633 = _T_11 ? 1'h0 : _GEN_430; // @[Conditional.scala 39:67 ProcessingCore.scala 105:40]
  wire  _GEN_634 = _T_11 ? 1'h0 : _GEN_431; // @[Conditional.scala 39:67 ProcessingCore.scala 80:37]
  wire [9:0] _GEN_635 = _T_11 ? 10'h0 : _GEN_432; // @[Conditional.scala 39:67]
  wire  _GEN_636 = _T_11 ? 1'h0 : _GEN_433; // @[Conditional.scala 39:67 ProcessingCore.scala 81:37]
  wire  _GEN_637 = _T_11 ? 1'h0 : _GEN_434; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_638 = _T_11 ? 1'h0 : _GEN_435; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_639 = _T_11 ? 1'h0 : _GEN_436; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_640 = _T_11 ? 1'h0 : _GEN_437; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_641 = _T_11 ? 1'h0 : _GEN_438; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_642 = _T_11 ? 1'h0 : _GEN_439; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_643 = _T_11 ? 1'h0 : _GEN_440; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_644 = _T_11 ? 1'h0 : _GEN_441; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_645 = _T_11 ? 1'h0 : _GEN_442; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_646 = _T_11 ? 1'h0 : _GEN_443; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_647 = _T_11 ? 1'h0 : _GEN_444; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_648 = _T_11 ? 1'h0 : _GEN_445; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_649 = _T_11 ? 1'h0 : _GEN_446; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_650 = _T_11 ? 1'h0 : _GEN_447; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_651 = _T_11 ? 1'h0 : _GEN_448; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_652 = _T_11 ? 1'h0 : _GEN_449; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_653 = _T_11 ? 1'h0 : _GEN_450; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_654 = _T_11 ? 1'h0 : _GEN_451; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_655 = _T_11 ? 1'h0 : _GEN_452; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_656 = _T_11 ? 1'h0 : _GEN_453; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_657 = _T_11 ? 1'h0 : _GEN_454; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_658 = _T_11 ? 1'h0 : _GEN_455; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_659 = _T_11 ? 1'h0 : _GEN_456; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_660 = _T_11 ? 1'h0 : _GEN_457; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_661 = _T_11 ? 1'h0 : _GEN_458; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_662 = _T_11 ? 1'h0 : _GEN_459; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_663 = _T_11 ? 1'h0 : _GEN_460; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_664 = _T_11 ? 1'h0 : _GEN_461; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_665 = _T_11 ? 1'h0 : _GEN_462; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_666 = _T_11 ? 1'h0 : _GEN_463; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_667 = _T_11 ? 1'h0 : _GEN_464; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_668 = _T_11 ? 1'h0 : _GEN_465; // @[Conditional.scala 39:67 ProcessingCore.scala 101:34]
  wire  _GEN_672 = _T_10 ? 1'h0 : _GEN_466; // @[Conditional.scala 40:58 ProcessingCore.scala 82:37]
  wire [5:0] _GEN_673 = _T_10 ? 6'h0 : _GEN_467; // @[Conditional.scala 40:58 ProcessingCore.scala 84:37]
  wire [9:0] _GEN_674 = _T_10 ? 10'h0 : _GEN_468; // @[Conditional.scala 40:58]
  wire [11:0] _GEN_675 = _T_10 ? $signed(12'sh0) : $signed(_GEN_470); // @[Conditional.scala 40:58]
  wire  _GEN_676 = _T_10 ? 1'h0 : _GEN_471; // @[Conditional.scala 40:58]
  wire  _GEN_677 = _T_10 ? 1'h0 : _GEN_472; // @[Conditional.scala 40:58]
  wire  _GEN_678 = _T_10 ? 1'h0 : _GEN_473; // @[Conditional.scala 40:58]
  wire  _GEN_679 = _T_10 ? 1'h0 : _GEN_474; // @[Conditional.scala 40:58]
  wire  _GEN_680 = _T_10 ? 1'h0 : _GEN_475; // @[Conditional.scala 40:58]
  wire  _GEN_681 = _T_10 ? 1'h0 : _GEN_476; // @[Conditional.scala 40:58]
  wire  _GEN_682 = _T_10 ? 1'h0 : _GEN_477; // @[Conditional.scala 40:58]
  wire  _GEN_683 = _T_10 ? 1'h0 : _GEN_478; // @[Conditional.scala 40:58]
  wire  _GEN_684 = _T_10 ? 1'h0 : _GEN_479; // @[Conditional.scala 40:58]
  wire  _GEN_685 = _T_10 ? 1'h0 : _GEN_480; // @[Conditional.scala 40:58]
  wire  _GEN_686 = _T_10 ? 1'h0 : _GEN_481; // @[Conditional.scala 40:58]
  wire  _GEN_687 = _T_10 ? 1'h0 : _GEN_482; // @[Conditional.scala 40:58]
  wire  _GEN_688 = _T_10 ? 1'h0 : _GEN_483; // @[Conditional.scala 40:58]
  wire  _GEN_689 = _T_10 ? 1'h0 : _GEN_484; // @[Conditional.scala 40:58]
  wire  _GEN_690 = _T_10 ? 1'h0 : _GEN_485; // @[Conditional.scala 40:58]
  wire  _GEN_691 = _T_10 ? 1'h0 : _GEN_486; // @[Conditional.scala 40:58]
  wire  _GEN_692 = _T_10 ? 1'h0 : _GEN_487; // @[Conditional.scala 40:58]
  wire  _GEN_693 = _T_10 ? 1'h0 : _GEN_488; // @[Conditional.scala 40:58]
  wire  _GEN_694 = _T_10 ? 1'h0 : _GEN_489; // @[Conditional.scala 40:58]
  wire  _GEN_695 = _T_10 ? 1'h0 : _GEN_490; // @[Conditional.scala 40:58]
  wire  _GEN_696 = _T_10 ? 1'h0 : _GEN_491; // @[Conditional.scala 40:58]
  wire  _GEN_697 = _T_10 ? 1'h0 : _GEN_492; // @[Conditional.scala 40:58]
  wire  _GEN_698 = _T_10 ? 1'h0 : _GEN_493; // @[Conditional.scala 40:58]
  wire  _GEN_699 = _T_10 ? 1'h0 : _GEN_494; // @[Conditional.scala 40:58]
  wire  _GEN_700 = _T_10 ? 1'h0 : _GEN_495; // @[Conditional.scala 40:58]
  wire  _GEN_701 = _T_10 ? 1'h0 : _GEN_496; // @[Conditional.scala 40:58]
  wire  _GEN_702 = _T_10 ? 1'h0 : _GEN_497; // @[Conditional.scala 40:58]
  wire  _GEN_703 = _T_10 ? 1'h0 : _GEN_498; // @[Conditional.scala 40:58]
  wire  _GEN_704 = _T_10 ? 1'h0 : _GEN_499; // @[Conditional.scala 40:58]
  wire  _GEN_705 = _T_10 ? 1'h0 : _GEN_500; // @[Conditional.scala 40:58]
  wire  _GEN_706 = _T_10 ? 1'h0 : _GEN_501; // @[Conditional.scala 40:58]
  wire  _GEN_707 = _T_10 ? 1'h0 : _GEN_502; // @[Conditional.scala 40:58]
  wire  _GEN_708 = _T_10 ? 1'h0 : _GEN_503; // @[Conditional.scala 40:58 ProcessingCore.scala 83:37]
  wire [5:0] _GEN_709 = _T_10 ? 6'h0 : _GEN_504; // @[Conditional.scala 40:58 ProcessingCore.scala 85:37]
  wire  _GEN_710 = _T_10 ? 1'h0 : _GEN_505; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [9:0] _GEN_711 = _T_10 ? 10'h0 : _GEN_506; // @[Conditional.scala 40:58 ProcessingCore.scala 103:40]
  wire [11:0] _GEN_712 = _T_10 ? $signed(12'sh0) : $signed(_GEN_507); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_713 = _T_10 ? 1'h0 : _GEN_508; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_715 = _T_10 ? $signed(12'sh0) : $signed(_GEN_510); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_716 = _T_10 ? 1'h0 : _GEN_511; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_718 = _T_10 ? $signed(12'sh0) : $signed(_GEN_513); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_719 = _T_10 ? 1'h0 : _GEN_514; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_721 = _T_10 ? $signed(12'sh0) : $signed(_GEN_516); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_722 = _T_10 ? 1'h0 : _GEN_517; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_724 = _T_10 ? $signed(12'sh0) : $signed(_GEN_519); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_725 = _T_10 ? 1'h0 : _GEN_520; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_727 = _T_10 ? $signed(12'sh0) : $signed(_GEN_522); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_728 = _T_10 ? 1'h0 : _GEN_523; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_730 = _T_10 ? $signed(12'sh0) : $signed(_GEN_525); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_731 = _T_10 ? 1'h0 : _GEN_526; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_733 = _T_10 ? $signed(12'sh0) : $signed(_GEN_528); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_734 = _T_10 ? 1'h0 : _GEN_529; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_736 = _T_10 ? $signed(12'sh0) : $signed(_GEN_531); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_737 = _T_10 ? 1'h0 : _GEN_532; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_739 = _T_10 ? $signed(12'sh0) : $signed(_GEN_534); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_740 = _T_10 ? 1'h0 : _GEN_535; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_742 = _T_10 ? $signed(12'sh0) : $signed(_GEN_537); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_743 = _T_10 ? 1'h0 : _GEN_538; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_745 = _T_10 ? $signed(12'sh0) : $signed(_GEN_540); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_746 = _T_10 ? 1'h0 : _GEN_541; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_748 = _T_10 ? $signed(12'sh0) : $signed(_GEN_543); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_749 = _T_10 ? 1'h0 : _GEN_544; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_751 = _T_10 ? $signed(12'sh0) : $signed(_GEN_546); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_752 = _T_10 ? 1'h0 : _GEN_547; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_754 = _T_10 ? $signed(12'sh0) : $signed(_GEN_549); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_755 = _T_10 ? 1'h0 : _GEN_550; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_757 = _T_10 ? $signed(12'sh0) : $signed(_GEN_552); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_758 = _T_10 ? 1'h0 : _GEN_553; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_760 = _T_10 ? $signed(12'sh0) : $signed(_GEN_555); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_761 = _T_10 ? 1'h0 : _GEN_556; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_763 = _T_10 ? $signed(12'sh0) : $signed(_GEN_558); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_764 = _T_10 ? 1'h0 : _GEN_559; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_766 = _T_10 ? $signed(12'sh0) : $signed(_GEN_561); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_767 = _T_10 ? 1'h0 : _GEN_562; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_769 = _T_10 ? $signed(12'sh0) : $signed(_GEN_564); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_770 = _T_10 ? 1'h0 : _GEN_565; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_772 = _T_10 ? $signed(12'sh0) : $signed(_GEN_567); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_773 = _T_10 ? 1'h0 : _GEN_568; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_775 = _T_10 ? $signed(12'sh0) : $signed(_GEN_570); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_776 = _T_10 ? 1'h0 : _GEN_571; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_778 = _T_10 ? $signed(12'sh0) : $signed(_GEN_573); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_779 = _T_10 ? 1'h0 : _GEN_574; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_781 = _T_10 ? $signed(12'sh0) : $signed(_GEN_576); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_782 = _T_10 ? 1'h0 : _GEN_577; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_784 = _T_10 ? $signed(12'sh0) : $signed(_GEN_579); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_785 = _T_10 ? 1'h0 : _GEN_580; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_787 = _T_10 ? $signed(12'sh0) : $signed(_GEN_582); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_788 = _T_10 ? 1'h0 : _GEN_583; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_790 = _T_10 ? $signed(12'sh0) : $signed(_GEN_585); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_791 = _T_10 ? 1'h0 : _GEN_586; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_793 = _T_10 ? $signed(12'sh0) : $signed(_GEN_588); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_794 = _T_10 ? 1'h0 : _GEN_589; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_796 = _T_10 ? $signed(12'sh0) : $signed(_GEN_591); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_797 = _T_10 ? 1'h0 : _GEN_592; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_799 = _T_10 ? $signed(12'sh0) : $signed(_GEN_594); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_800 = _T_10 ? 1'h0 : _GEN_595; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_802 = _T_10 ? $signed(12'sh0) : $signed(_GEN_597); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_803 = _T_10 ? 1'h0 : _GEN_598; // @[Conditional.scala 40:58 ProcessingCore.scala 106:40]
  wire [11:0] _GEN_805 = _T_10 ? $signed(12'sh0) : $signed(_GEN_600); // @[Conditional.scala 40:58 ProcessingCore.scala 107:40]
  wire  _GEN_806 = _T_10 ? 1'h0 : _GEN_601; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire [9:0] _GEN_807 = _T_10 ? 10'h0 : _GEN_602; // @[Conditional.scala 40:58 ProcessingCore.scala 104:40]
  wire  _GEN_808 = _T_10 ? 1'h0 : _GEN_603; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_809 = _T_10 ? 1'h0 : _GEN_604; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_810 = _T_10 ? 1'h0 : _GEN_605; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_811 = _T_10 ? 1'h0 : _GEN_606; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_812 = _T_10 ? 1'h0 : _GEN_607; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_813 = _T_10 ? 1'h0 : _GEN_608; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_814 = _T_10 ? 1'h0 : _GEN_609; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_815 = _T_10 ? 1'h0 : _GEN_610; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_816 = _T_10 ? 1'h0 : _GEN_611; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_817 = _T_10 ? 1'h0 : _GEN_612; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_818 = _T_10 ? 1'h0 : _GEN_613; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_819 = _T_10 ? 1'h0 : _GEN_614; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_820 = _T_10 ? 1'h0 : _GEN_615; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_821 = _T_10 ? 1'h0 : _GEN_616; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_822 = _T_10 ? 1'h0 : _GEN_617; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_823 = _T_10 ? 1'h0 : _GEN_618; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_824 = _T_10 ? 1'h0 : _GEN_619; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_825 = _T_10 ? 1'h0 : _GEN_620; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_826 = _T_10 ? 1'h0 : _GEN_621; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_827 = _T_10 ? 1'h0 : _GEN_622; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_828 = _T_10 ? 1'h0 : _GEN_623; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_829 = _T_10 ? 1'h0 : _GEN_624; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_830 = _T_10 ? 1'h0 : _GEN_625; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_831 = _T_10 ? 1'h0 : _GEN_626; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_832 = _T_10 ? 1'h0 : _GEN_627; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_833 = _T_10 ? 1'h0 : _GEN_628; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_834 = _T_10 ? 1'h0 : _GEN_629; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_835 = _T_10 ? 1'h0 : _GEN_630; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_836 = _T_10 ? 1'h0 : _GEN_631; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_837 = _T_10 ? 1'h0 : _GEN_632; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_838 = _T_10 ? 1'h0 : _GEN_633; // @[Conditional.scala 40:58 ProcessingCore.scala 105:40]
  wire  _GEN_839 = _T_10 ? 1'h0 : _GEN_634; // @[Conditional.scala 40:58 ProcessingCore.scala 80:37]
  wire [9:0] _GEN_840 = _T_10 ? 10'h0 : _GEN_635; // @[Conditional.scala 40:58]
  wire  _GEN_841 = _T_10 ? 1'h0 : _GEN_636; // @[Conditional.scala 40:58 ProcessingCore.scala 81:37]
  wire  _GEN_842 = _T_10 ? 1'h0 : _GEN_637; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_843 = _T_10 ? 1'h0 : _GEN_638; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_844 = _T_10 ? 1'h0 : _GEN_639; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_845 = _T_10 ? 1'h0 : _GEN_640; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_846 = _T_10 ? 1'h0 : _GEN_641; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_847 = _T_10 ? 1'h0 : _GEN_642; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_848 = _T_10 ? 1'h0 : _GEN_643; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_849 = _T_10 ? 1'h0 : _GEN_644; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_850 = _T_10 ? 1'h0 : _GEN_645; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_851 = _T_10 ? 1'h0 : _GEN_646; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_852 = _T_10 ? 1'h0 : _GEN_647; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_853 = _T_10 ? 1'h0 : _GEN_648; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_854 = _T_10 ? 1'h0 : _GEN_649; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_855 = _T_10 ? 1'h0 : _GEN_650; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_856 = _T_10 ? 1'h0 : _GEN_651; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_857 = _T_10 ? 1'h0 : _GEN_652; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_858 = _T_10 ? 1'h0 : _GEN_653; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_859 = _T_10 ? 1'h0 : _GEN_654; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_860 = _T_10 ? 1'h0 : _GEN_655; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_861 = _T_10 ? 1'h0 : _GEN_656; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_862 = _T_10 ? 1'h0 : _GEN_657; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_863 = _T_10 ? 1'h0 : _GEN_658; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_864 = _T_10 ? 1'h0 : _GEN_659; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_865 = _T_10 ? 1'h0 : _GEN_660; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_866 = _T_10 ? 1'h0 : _GEN_661; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_867 = _T_10 ? 1'h0 : _GEN_662; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_868 = _T_10 ? 1'h0 : _GEN_663; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_869 = _T_10 ? 1'h0 : _GEN_664; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_870 = _T_10 ? 1'h0 : _GEN_665; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_871 = _T_10 ? 1'h0 : _GEN_666; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_872 = _T_10 ? 1'h0 : _GEN_667; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire  _GEN_873 = _T_10 ? 1'h0 : _GEN_668; // @[Conditional.scala 40:58 ProcessingCore.scala 101:34]
  wire [12:0] _matrixRowCounter_T_1 = matrixRowCounter + 13'h1; // @[ProcessingCore.scala 288:57]
  wire [12:0] _GEN_874 = adderTree_io_sumValid ? _matrixRowCounter_T_1 : _GEN_82; // @[ProcessingCore.scala 287:38 ProcessingCore.scala 288:37]
  wire  _GEN_875 = adderTree_io_sumValid; // @[ProcessingCore.scala 287:38 ProcessingCore.scala 289:37 ProcessingCore.scala 82:37]
  wire [12:0] _colBanksCounter_T_1 = colBanksCounter + 13'h1; // @[ProcessingCore.scala 298:66]
  wire  _GEN_878 = colBanksCounter == VoutSizeReg ? 1'h0 : 1'h1; // @[ProcessingCore.scala 291:50 ProcessingCore.scala 81:37 ProcessingCore.scala 296:47]
  wire [12:0] _GEN_879 = colBanksCounter == VoutSizeReg ? _GEN_81 : _colBanksCounter_T_1; // @[ProcessingCore.scala 291:50 ProcessingCore.scala 298:47]
  wire [12:0] _GEN_2245 = {{1'd0}, MinAddr}; // @[ProcessingCore.scala 302:60]
  wire [12:0] _T_149 = _GEN_2245 + colBanksCounter; // @[ProcessingCore.scala 302:60]
  wire [7:0] _GEN_880 = rdWrEnaFlip ? $signed(activationBlock_io_activation_0) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_881 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_0; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire [9:0] _GEN_882 = rdWrEnaFlip ? vinAddr : 10'h0; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 321:51 ProcessingCore.scala 103:40]
  wire  _GEN_884 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_0; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [9:0] _GEN_885 = rdWrEnaFlip ? 10'h0 : vinAddr; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 104:40 ProcessingCore.scala 325:50]
  wire [7:0] _GEN_886 = rdWrEnaFlip ? $signed(activationBlock_io_activation_1) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_887 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_1; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_889 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_1; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_890 = rdWrEnaFlip ? $signed(activationBlock_io_activation_2) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_891 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_2; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_893 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_2; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_894 = rdWrEnaFlip ? $signed(activationBlock_io_activation_3) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_895 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_3; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_897 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_3; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_898 = rdWrEnaFlip ? $signed(activationBlock_io_activation_4) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_899 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_4; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_901 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_4; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_902 = rdWrEnaFlip ? $signed(activationBlock_io_activation_5) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_903 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_5; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_905 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_5; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_906 = rdWrEnaFlip ? $signed(activationBlock_io_activation_6) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_907 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_6; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_909 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_6; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_910 = rdWrEnaFlip ? $signed(activationBlock_io_activation_7) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_911 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_7; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_913 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_7; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_914 = rdWrEnaFlip ? $signed(activationBlock_io_activation_8) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_915 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_8; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_917 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_8; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_918 = rdWrEnaFlip ? $signed(activationBlock_io_activation_9) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_919 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_9; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_921 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_9; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_922 = rdWrEnaFlip ? $signed(activationBlock_io_activation_10) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_923 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_10; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_925 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_10; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_926 = rdWrEnaFlip ? $signed(activationBlock_io_activation_11) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_927 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_11; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_929 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_11; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_930 = rdWrEnaFlip ? $signed(activationBlock_io_activation_12) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_931 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_12; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_933 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_12; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_934 = rdWrEnaFlip ? $signed(activationBlock_io_activation_13) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_935 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_13; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_937 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_13; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_938 = rdWrEnaFlip ? $signed(activationBlock_io_activation_14) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_939 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_14; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_941 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_14; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_942 = rdWrEnaFlip ? $signed(activationBlock_io_activation_15) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_943 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_15; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_945 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_15; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_946 = rdWrEnaFlip ? $signed(activationBlock_io_activation_16) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_947 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_16; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_949 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_16; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_950 = rdWrEnaFlip ? $signed(activationBlock_io_activation_17) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_951 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_17; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_953 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_17; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_954 = rdWrEnaFlip ? $signed(activationBlock_io_activation_18) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_955 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_18; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_957 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_18; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_958 = rdWrEnaFlip ? $signed(activationBlock_io_activation_19) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_959 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_19; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_961 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_19; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_962 = rdWrEnaFlip ? $signed(activationBlock_io_activation_20) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_963 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_20; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_965 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_20; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_966 = rdWrEnaFlip ? $signed(activationBlock_io_activation_21) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_967 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_21; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_969 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_21; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_970 = rdWrEnaFlip ? $signed(activationBlock_io_activation_22) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_971 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_22; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_973 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_22; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_974 = rdWrEnaFlip ? $signed(activationBlock_io_activation_23) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_975 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_23; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_977 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_23; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_978 = rdWrEnaFlip ? $signed(activationBlock_io_activation_24) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_979 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_24; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_981 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_24; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_982 = rdWrEnaFlip ? $signed(activationBlock_io_activation_25) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_983 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_25; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_985 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_25; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_986 = rdWrEnaFlip ? $signed(activationBlock_io_activation_26) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_987 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_26; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_989 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_26; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_990 = rdWrEnaFlip ? $signed(activationBlock_io_activation_27) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_991 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_27; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_993 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_27; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_994 = rdWrEnaFlip ? $signed(activationBlock_io_activation_28) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_995 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_28; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_997 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_28; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_998 = rdWrEnaFlip ? $signed(activationBlock_io_activation_29) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_999 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_29; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_1001 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_29; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_1002 = rdWrEnaFlip ? $signed(activationBlock_io_activation_30) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_1003 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_30; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_1005 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_30; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [7:0] _GEN_1006 = rdWrEnaFlip ? $signed(activationBlock_io_activation_31) : $signed(8'sh0); // @[ProcessingCore.scala 318:30 ProcessingCore.scala 319:51 ProcessingCore.scala 107:40]
  wire  _GEN_1007 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_31; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 320:51 ProcessingCore.scala 106:40]
  wire  _GEN_1009 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_31; // @[ProcessingCore.scala 318:30 ProcessingCore.scala 105:40 ProcessingCore.scala 324:50]
  wire [9:0] _GEN_1010 = io_terminate ? instructionRegister[26:17] : instructionRegister[16:7]; // @[ProcessingCore.scala 341:29 ProcessingCore.scala 342:23 ProcessingCore.scala 344:23]
  wire [9:0] _GEN_1012 = _T_141 ? _GEN_1010 : 10'h0; // @[Conditional.scala 39:67]
  wire  _GEN_1015 = _T_12 & _instructionDone_T; // @[Conditional.scala 39:67 ProcessingCore.scala 331:42 ProcessingCore.scala 80:37]
  wire [2:0] _GEN_1017 = _T_12 ? instructionRegister[16:14] : 3'h0; // @[Conditional.scala 39:67 ProcessingCore.scala 333:42 ProcessingCore.scala 85:37]
  wire [9:0] _GEN_1018 = _T_12 ? instructionRegister[26:17] : 10'h0; // @[Conditional.scala 39:67 ProcessingCore.scala 335:48 ProcessingCore.scala 104:40]
  wire  _GEN_1019 = _T_12 & memReadDecoder_io_activatedSignals_0; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1021 = _T_12 & memReadDecoder_io_activatedSignals_1; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1023 = _T_12 & memReadDecoder_io_activatedSignals_2; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1025 = _T_12 & memReadDecoder_io_activatedSignals_3; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1027 = _T_12 & memReadDecoder_io_activatedSignals_4; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1029 = _T_12 & memReadDecoder_io_activatedSignals_5; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1031 = _T_12 & memReadDecoder_io_activatedSignals_6; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1033 = _T_12 & memReadDecoder_io_activatedSignals_7; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1035 = _T_12 & memReadDecoder_io_activatedSignals_8; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1037 = _T_12 & memReadDecoder_io_activatedSignals_9; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1039 = _T_12 & memReadDecoder_io_activatedSignals_10; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1041 = _T_12 & memReadDecoder_io_activatedSignals_11; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1043 = _T_12 & memReadDecoder_io_activatedSignals_12; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1045 = _T_12 & memReadDecoder_io_activatedSignals_13; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1047 = _T_12 & memReadDecoder_io_activatedSignals_14; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1049 = _T_12 & memReadDecoder_io_activatedSignals_15; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1051 = _T_12 & memReadDecoder_io_activatedSignals_16; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1053 = _T_12 & memReadDecoder_io_activatedSignals_17; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1055 = _T_12 & memReadDecoder_io_activatedSignals_18; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1057 = _T_12 & memReadDecoder_io_activatedSignals_19; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1059 = _T_12 & memReadDecoder_io_activatedSignals_20; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1061 = _T_12 & memReadDecoder_io_activatedSignals_21; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1063 = _T_12 & memReadDecoder_io_activatedSignals_22; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1065 = _T_12 & memReadDecoder_io_activatedSignals_23; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1067 = _T_12 & memReadDecoder_io_activatedSignals_24; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1069 = _T_12 & memReadDecoder_io_activatedSignals_25; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1071 = _T_12 & memReadDecoder_io_activatedSignals_26; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1073 = _T_12 & memReadDecoder_io_activatedSignals_27; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1075 = _T_12 & memReadDecoder_io_activatedSignals_28; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1077 = _T_12 & memReadDecoder_io_activatedSignals_29; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1079 = _T_12 & memReadDecoder_io_activatedSignals_30; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1081 = _T_12 & memReadDecoder_io_activatedSignals_31; // @[Conditional.scala 39:67 ProcessingCore.scala 336:48 ProcessingCore.scala 105:40]
  wire  _GEN_1082 = _T_12 ? 1'h0 : _T_141; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_1083 = _T_12 ? 10'h0 : _GEN_1012; // @[Conditional.scala 39:67]
  wire  _GEN_1084 = _T_11 ? _instructionDone_T : rdWrEnaFlip; // @[Conditional.scala 39:67 ProcessingCore.scala 312:36 ProcessingCore.scala 66:34]
  wire  _GEN_1085 = _T_11 & rdWrEnaFlip; // @[Conditional.scala 39:67 ProcessingCore.scala 313:36 ProcessingCore.scala 86:37]
  wire  _GEN_1086 = _T_11 | _T_12; // @[Conditional.scala 39:67 ProcessingCore.scala 314:36]
  wire [4:0] _GEN_1087 = _T_11 ? vinSize : {{2'd0}, _GEN_1017}; // @[Conditional.scala 39:67 ProcessingCore.scala 315:36]
  wire [7:0] _GEN_1088 = _T_11 ? $signed(_GEN_880) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1089 = _T_11 & _GEN_881; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire [9:0] _GEN_1090 = _T_11 ? _GEN_882 : 10'h0; // @[Conditional.scala 39:67 ProcessingCore.scala 103:40]
  wire  _GEN_1092 = _T_11 ? _GEN_884 : _GEN_1019; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_1093 = _T_11 ? _GEN_885 : _GEN_1018; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1094 = _T_11 ? $signed(_GEN_886) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1095 = _T_11 & _GEN_887; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1096 = _T_11 ? _GEN_889 : _GEN_1021; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1098 = _T_11 ? $signed(_GEN_890) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1099 = _T_11 & _GEN_891; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1100 = _T_11 ? _GEN_893 : _GEN_1023; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1102 = _T_11 ? $signed(_GEN_894) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1103 = _T_11 & _GEN_895; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1104 = _T_11 ? _GEN_897 : _GEN_1025; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1106 = _T_11 ? $signed(_GEN_898) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1107 = _T_11 & _GEN_899; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1108 = _T_11 ? _GEN_901 : _GEN_1027; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1110 = _T_11 ? $signed(_GEN_902) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1111 = _T_11 & _GEN_903; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1112 = _T_11 ? _GEN_905 : _GEN_1029; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1114 = _T_11 ? $signed(_GEN_906) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1115 = _T_11 & _GEN_907; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1116 = _T_11 ? _GEN_909 : _GEN_1031; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1118 = _T_11 ? $signed(_GEN_910) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1119 = _T_11 & _GEN_911; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1120 = _T_11 ? _GEN_913 : _GEN_1033; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1122 = _T_11 ? $signed(_GEN_914) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1123 = _T_11 & _GEN_915; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1124 = _T_11 ? _GEN_917 : _GEN_1035; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1126 = _T_11 ? $signed(_GEN_918) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1127 = _T_11 & _GEN_919; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1128 = _T_11 ? _GEN_921 : _GEN_1037; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1130 = _T_11 ? $signed(_GEN_922) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1131 = _T_11 & _GEN_923; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1132 = _T_11 ? _GEN_925 : _GEN_1039; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1134 = _T_11 ? $signed(_GEN_926) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1135 = _T_11 & _GEN_927; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1136 = _T_11 ? _GEN_929 : _GEN_1041; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1138 = _T_11 ? $signed(_GEN_930) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1139 = _T_11 & _GEN_931; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1140 = _T_11 ? _GEN_933 : _GEN_1043; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1142 = _T_11 ? $signed(_GEN_934) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1143 = _T_11 & _GEN_935; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1144 = _T_11 ? _GEN_937 : _GEN_1045; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1146 = _T_11 ? $signed(_GEN_938) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1147 = _T_11 & _GEN_939; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1148 = _T_11 ? _GEN_941 : _GEN_1047; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1150 = _T_11 ? $signed(_GEN_942) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1151 = _T_11 & _GEN_943; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1152 = _T_11 ? _GEN_945 : _GEN_1049; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1154 = _T_11 ? $signed(_GEN_946) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1155 = _T_11 & _GEN_947; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1156 = _T_11 ? _GEN_949 : _GEN_1051; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1158 = _T_11 ? $signed(_GEN_950) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1159 = _T_11 & _GEN_951; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1160 = _T_11 ? _GEN_953 : _GEN_1053; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1162 = _T_11 ? $signed(_GEN_954) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1163 = _T_11 & _GEN_955; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1164 = _T_11 ? _GEN_957 : _GEN_1055; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1166 = _T_11 ? $signed(_GEN_958) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1167 = _T_11 & _GEN_959; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1168 = _T_11 ? _GEN_961 : _GEN_1057; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1170 = _T_11 ? $signed(_GEN_962) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1171 = _T_11 & _GEN_963; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1172 = _T_11 ? _GEN_965 : _GEN_1059; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1174 = _T_11 ? $signed(_GEN_966) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1175 = _T_11 & _GEN_967; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1176 = _T_11 ? _GEN_969 : _GEN_1061; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1178 = _T_11 ? $signed(_GEN_970) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1179 = _T_11 & _GEN_971; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1180 = _T_11 ? _GEN_973 : _GEN_1063; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1182 = _T_11 ? $signed(_GEN_974) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1183 = _T_11 & _GEN_975; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1184 = _T_11 ? _GEN_977 : _GEN_1065; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1186 = _T_11 ? $signed(_GEN_978) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1187 = _T_11 & _GEN_979; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1188 = _T_11 ? _GEN_981 : _GEN_1067; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1190 = _T_11 ? $signed(_GEN_982) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1191 = _T_11 & _GEN_983; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1192 = _T_11 ? _GEN_985 : _GEN_1069; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1194 = _T_11 ? $signed(_GEN_986) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1195 = _T_11 & _GEN_987; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1196 = _T_11 ? _GEN_989 : _GEN_1071; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1198 = _T_11 ? $signed(_GEN_990) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1199 = _T_11 & _GEN_991; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1200 = _T_11 ? _GEN_993 : _GEN_1073; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1202 = _T_11 ? $signed(_GEN_994) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1203 = _T_11 & _GEN_995; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1204 = _T_11 ? _GEN_997 : _GEN_1075; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1206 = _T_11 ? $signed(_GEN_998) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1207 = _T_11 & _GEN_999; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1208 = _T_11 ? _GEN_1001 : _GEN_1077; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1210 = _T_11 ? $signed(_GEN_1002) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1211 = _T_11 & _GEN_1003; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1212 = _T_11 ? _GEN_1005 : _GEN_1079; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1214 = _T_11 ? $signed(_GEN_1006) : $signed(8'sh0); // @[Conditional.scala 39:67 ProcessingCore.scala 107:40]
  wire  _GEN_1215 = _T_11 & _GEN_1007; // @[Conditional.scala 39:67 ProcessingCore.scala 106:40]
  wire  _GEN_1216 = _T_11 ? _GEN_1009 : _GEN_1081; // @[Conditional.scala 39:67]
  wire  _GEN_1218 = _T_11 ? 1'h0 : _GEN_1015; // @[Conditional.scala 39:67 ProcessingCore.scala 80:37]
  wire  _GEN_1219 = _T_11 ? 1'h0 : _GEN_1082; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_1220 = _T_11 ? 10'h0 : _GEN_1083; // @[Conditional.scala 39:67]
  wire [13:0] _GEN_1221 = _T_10 ? VinSizeReg : {{9'd0}, _GEN_1087}; // @[Conditional.scala 40:58 ProcessingCore.scala 285:37]
  wire [12:0] _GEN_1222 = _T_10 ? matrixRowCounter : 13'h0; // @[Conditional.scala 40:58 ProcessingCore.scala 286:37 ProcessingCore.scala 84:37]
  wire [12:0] _GEN_1223 = _T_10 ? _GEN_874 : _GEN_82; // @[Conditional.scala 40:58]
  wire  _GEN_1224 = _T_10 & _GEN_875; // @[Conditional.scala 40:58 ProcessingCore.scala 82:37]
  wire  _GEN_1226 = _T_10 & _GEN_878; // @[Conditional.scala 40:58 ProcessingCore.scala 81:37]
  wire  _GEN_1227 = _T_10 ? _GEN_878 : _GEN_1086; // @[Conditional.scala 40:58]
  wire [12:0] _GEN_1228 = _T_10 ? _GEN_879 : _GEN_81; // @[Conditional.scala 40:58]
  wire [9:0] _GEN_1835 = op == 2'h1 ? _GEN_840 : 10'h0; // @[ProcessingCore.scala 209:44]
  wire [9:0] _GEN_2141 = Controller == 2'h3 ? _GEN_1835 : 10'h0; // @[ProcessingCore.scala 207:33]
  wire [5:0] weightRdAddrNode = _GEN_2141[5:0];
  wire [12:0] _GEN_1229 = _T_10 ? _T_149 : {{7'd0}, weightRdAddrNode}; // @[Conditional.scala 40:58 ProcessingCore.scala 302:49 ProcessingCore.scala 98:34]
  wire  _GEN_1837 = op == 2'h1 & _GEN_842; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2143 = Controller == 2'h3 & _GEN_1837; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1230 = _T_10 ? memReadDecoder_io_activatedSignals_0 : _GEN_2143; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1231 = _T_10 ? memReadDecoder_io_activatedSignals_0 : _GEN_1092; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [9:0] _GEN_1232 = _T_10 ? {{5'd0}, VinAddr} : _GEN_1093; // @[Conditional.scala 40:58 ProcessingCore.scala 305:49]
  wire [8:0] _GEN_1233 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1088[7]}},_GEN_1088}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire [9:0] _GEN_1234 = _T_10 ? {{3'd0}, VoutAddr} : _GEN_1090; // @[Conditional.scala 40:58 ProcessingCore.scala 307:49]
  wire  _GEN_1235 = _T_10 ? oneHotDecoder_io_writeSignal_0 : _GEN_1089; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1838 = op == 2'h1 & _GEN_843; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2144 = Controller == 2'h3 & _GEN_1838; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1237 = _T_10 ? memReadDecoder_io_activatedSignals_1 : _GEN_2144; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1238 = _T_10 ? memReadDecoder_io_activatedSignals_1 : _GEN_1096; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1240 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1094[7]}},_GEN_1094}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1241 = _T_10 ? oneHotDecoder_io_writeSignal_1 : _GEN_1095; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1839 = op == 2'h1 & _GEN_844; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2145 = Controller == 2'h3 & _GEN_1839; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1243 = _T_10 ? memReadDecoder_io_activatedSignals_2 : _GEN_2145; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1244 = _T_10 ? memReadDecoder_io_activatedSignals_2 : _GEN_1100; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1246 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1098[7]}},_GEN_1098}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1247 = _T_10 ? oneHotDecoder_io_writeSignal_2 : _GEN_1099; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1840 = op == 2'h1 & _GEN_845; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2146 = Controller == 2'h3 & _GEN_1840; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1249 = _T_10 ? memReadDecoder_io_activatedSignals_3 : _GEN_2146; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1250 = _T_10 ? memReadDecoder_io_activatedSignals_3 : _GEN_1104; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1252 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1102[7]}},_GEN_1102}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1253 = _T_10 ? oneHotDecoder_io_writeSignal_3 : _GEN_1103; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1841 = op == 2'h1 & _GEN_846; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2147 = Controller == 2'h3 & _GEN_1841; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1255 = _T_10 ? memReadDecoder_io_activatedSignals_4 : _GEN_2147; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1256 = _T_10 ? memReadDecoder_io_activatedSignals_4 : _GEN_1108; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1258 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1106[7]}},_GEN_1106}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1259 = _T_10 ? oneHotDecoder_io_writeSignal_4 : _GEN_1107; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1842 = op == 2'h1 & _GEN_847; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2148 = Controller == 2'h3 & _GEN_1842; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1261 = _T_10 ? memReadDecoder_io_activatedSignals_5 : _GEN_2148; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1262 = _T_10 ? memReadDecoder_io_activatedSignals_5 : _GEN_1112; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1264 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1110[7]}},_GEN_1110}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1265 = _T_10 ? oneHotDecoder_io_writeSignal_5 : _GEN_1111; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1843 = op == 2'h1 & _GEN_848; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2149 = Controller == 2'h3 & _GEN_1843; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1267 = _T_10 ? memReadDecoder_io_activatedSignals_6 : _GEN_2149; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1268 = _T_10 ? memReadDecoder_io_activatedSignals_6 : _GEN_1116; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1270 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1114[7]}},_GEN_1114}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1271 = _T_10 ? oneHotDecoder_io_writeSignal_6 : _GEN_1115; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1844 = op == 2'h1 & _GEN_849; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2150 = Controller == 2'h3 & _GEN_1844; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1273 = _T_10 ? memReadDecoder_io_activatedSignals_7 : _GEN_2150; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1274 = _T_10 ? memReadDecoder_io_activatedSignals_7 : _GEN_1120; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1276 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1118[7]}},_GEN_1118}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1277 = _T_10 ? oneHotDecoder_io_writeSignal_7 : _GEN_1119; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1845 = op == 2'h1 & _GEN_850; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2151 = Controller == 2'h3 & _GEN_1845; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1279 = _T_10 ? memReadDecoder_io_activatedSignals_8 : _GEN_2151; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1280 = _T_10 ? memReadDecoder_io_activatedSignals_8 : _GEN_1124; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1282 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1122[7]}},_GEN_1122}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1283 = _T_10 ? oneHotDecoder_io_writeSignal_8 : _GEN_1123; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1846 = op == 2'h1 & _GEN_851; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2152 = Controller == 2'h3 & _GEN_1846; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1285 = _T_10 ? memReadDecoder_io_activatedSignals_9 : _GEN_2152; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1286 = _T_10 ? memReadDecoder_io_activatedSignals_9 : _GEN_1128; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1288 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1126[7]}},_GEN_1126}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1289 = _T_10 ? oneHotDecoder_io_writeSignal_9 : _GEN_1127; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1847 = op == 2'h1 & _GEN_852; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2153 = Controller == 2'h3 & _GEN_1847; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1291 = _T_10 ? memReadDecoder_io_activatedSignals_10 : _GEN_2153; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1292 = _T_10 ? memReadDecoder_io_activatedSignals_10 : _GEN_1132; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1294 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1130[7]}},_GEN_1130}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1295 = _T_10 ? oneHotDecoder_io_writeSignal_10 : _GEN_1131; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1848 = op == 2'h1 & _GEN_853; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2154 = Controller == 2'h3 & _GEN_1848; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1297 = _T_10 ? memReadDecoder_io_activatedSignals_11 : _GEN_2154; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1298 = _T_10 ? memReadDecoder_io_activatedSignals_11 : _GEN_1136; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1300 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1134[7]}},_GEN_1134}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1301 = _T_10 ? oneHotDecoder_io_writeSignal_11 : _GEN_1135; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1849 = op == 2'h1 & _GEN_854; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2155 = Controller == 2'h3 & _GEN_1849; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1303 = _T_10 ? memReadDecoder_io_activatedSignals_12 : _GEN_2155; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1304 = _T_10 ? memReadDecoder_io_activatedSignals_12 : _GEN_1140; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1306 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1138[7]}},_GEN_1138}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1307 = _T_10 ? oneHotDecoder_io_writeSignal_12 : _GEN_1139; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1850 = op == 2'h1 & _GEN_855; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2156 = Controller == 2'h3 & _GEN_1850; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1309 = _T_10 ? memReadDecoder_io_activatedSignals_13 : _GEN_2156; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1310 = _T_10 ? memReadDecoder_io_activatedSignals_13 : _GEN_1144; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1312 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1142[7]}},_GEN_1142}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1313 = _T_10 ? oneHotDecoder_io_writeSignal_13 : _GEN_1143; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1851 = op == 2'h1 & _GEN_856; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2157 = Controller == 2'h3 & _GEN_1851; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1315 = _T_10 ? memReadDecoder_io_activatedSignals_14 : _GEN_2157; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1316 = _T_10 ? memReadDecoder_io_activatedSignals_14 : _GEN_1148; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1318 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1146[7]}},_GEN_1146}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1319 = _T_10 ? oneHotDecoder_io_writeSignal_14 : _GEN_1147; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1852 = op == 2'h1 & _GEN_857; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2158 = Controller == 2'h3 & _GEN_1852; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1321 = _T_10 ? memReadDecoder_io_activatedSignals_15 : _GEN_2158; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1322 = _T_10 ? memReadDecoder_io_activatedSignals_15 : _GEN_1152; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1324 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1150[7]}},_GEN_1150}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1325 = _T_10 ? oneHotDecoder_io_writeSignal_15 : _GEN_1151; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1853 = op == 2'h1 & _GEN_858; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2159 = Controller == 2'h3 & _GEN_1853; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1327 = _T_10 ? memReadDecoder_io_activatedSignals_16 : _GEN_2159; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1328 = _T_10 ? memReadDecoder_io_activatedSignals_16 : _GEN_1156; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1330 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1154[7]}},_GEN_1154}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1331 = _T_10 ? oneHotDecoder_io_writeSignal_16 : _GEN_1155; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1854 = op == 2'h1 & _GEN_859; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2160 = Controller == 2'h3 & _GEN_1854; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1333 = _T_10 ? memReadDecoder_io_activatedSignals_17 : _GEN_2160; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1334 = _T_10 ? memReadDecoder_io_activatedSignals_17 : _GEN_1160; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1336 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1158[7]}},_GEN_1158}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1337 = _T_10 ? oneHotDecoder_io_writeSignal_17 : _GEN_1159; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1855 = op == 2'h1 & _GEN_860; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2161 = Controller == 2'h3 & _GEN_1855; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1339 = _T_10 ? memReadDecoder_io_activatedSignals_18 : _GEN_2161; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1340 = _T_10 ? memReadDecoder_io_activatedSignals_18 : _GEN_1164; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1342 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1162[7]}},_GEN_1162}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1343 = _T_10 ? oneHotDecoder_io_writeSignal_18 : _GEN_1163; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1856 = op == 2'h1 & _GEN_861; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2162 = Controller == 2'h3 & _GEN_1856; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1345 = _T_10 ? memReadDecoder_io_activatedSignals_19 : _GEN_2162; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1346 = _T_10 ? memReadDecoder_io_activatedSignals_19 : _GEN_1168; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1348 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1166[7]}},_GEN_1166}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1349 = _T_10 ? oneHotDecoder_io_writeSignal_19 : _GEN_1167; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1857 = op == 2'h1 & _GEN_862; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2163 = Controller == 2'h3 & _GEN_1857; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1351 = _T_10 ? memReadDecoder_io_activatedSignals_20 : _GEN_2163; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1352 = _T_10 ? memReadDecoder_io_activatedSignals_20 : _GEN_1172; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1354 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1170[7]}},_GEN_1170}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1355 = _T_10 ? oneHotDecoder_io_writeSignal_20 : _GEN_1171; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1858 = op == 2'h1 & _GEN_863; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2164 = Controller == 2'h3 & _GEN_1858; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1357 = _T_10 ? memReadDecoder_io_activatedSignals_21 : _GEN_2164; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1358 = _T_10 ? memReadDecoder_io_activatedSignals_21 : _GEN_1176; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1360 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1174[7]}},_GEN_1174}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1361 = _T_10 ? oneHotDecoder_io_writeSignal_21 : _GEN_1175; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1859 = op == 2'h1 & _GEN_864; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2165 = Controller == 2'h3 & _GEN_1859; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1363 = _T_10 ? memReadDecoder_io_activatedSignals_22 : _GEN_2165; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1364 = _T_10 ? memReadDecoder_io_activatedSignals_22 : _GEN_1180; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1366 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1178[7]}},_GEN_1178}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1367 = _T_10 ? oneHotDecoder_io_writeSignal_22 : _GEN_1179; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1860 = op == 2'h1 & _GEN_865; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2166 = Controller == 2'h3 & _GEN_1860; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1369 = _T_10 ? memReadDecoder_io_activatedSignals_23 : _GEN_2166; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1370 = _T_10 ? memReadDecoder_io_activatedSignals_23 : _GEN_1184; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1372 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1182[7]}},_GEN_1182}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1373 = _T_10 ? oneHotDecoder_io_writeSignal_23 : _GEN_1183; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1861 = op == 2'h1 & _GEN_866; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2167 = Controller == 2'h3 & _GEN_1861; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1375 = _T_10 ? memReadDecoder_io_activatedSignals_24 : _GEN_2167; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1376 = _T_10 ? memReadDecoder_io_activatedSignals_24 : _GEN_1188; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1378 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1186[7]}},_GEN_1186}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1379 = _T_10 ? oneHotDecoder_io_writeSignal_24 : _GEN_1187; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1862 = op == 2'h1 & _GEN_867; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2168 = Controller == 2'h3 & _GEN_1862; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1381 = _T_10 ? memReadDecoder_io_activatedSignals_25 : _GEN_2168; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1382 = _T_10 ? memReadDecoder_io_activatedSignals_25 : _GEN_1192; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1384 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1190[7]}},_GEN_1190}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1385 = _T_10 ? oneHotDecoder_io_writeSignal_25 : _GEN_1191; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1863 = op == 2'h1 & _GEN_868; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2169 = Controller == 2'h3 & _GEN_1863; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1387 = _T_10 ? memReadDecoder_io_activatedSignals_26 : _GEN_2169; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1388 = _T_10 ? memReadDecoder_io_activatedSignals_26 : _GEN_1196; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1390 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1194[7]}},_GEN_1194}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1391 = _T_10 ? oneHotDecoder_io_writeSignal_26 : _GEN_1195; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1864 = op == 2'h1 & _GEN_869; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2170 = Controller == 2'h3 & _GEN_1864; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1393 = _T_10 ? memReadDecoder_io_activatedSignals_27 : _GEN_2170; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1394 = _T_10 ? memReadDecoder_io_activatedSignals_27 : _GEN_1200; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1396 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1198[7]}},_GEN_1198}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1397 = _T_10 ? oneHotDecoder_io_writeSignal_27 : _GEN_1199; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1865 = op == 2'h1 & _GEN_870; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2171 = Controller == 2'h3 & _GEN_1865; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1399 = _T_10 ? memReadDecoder_io_activatedSignals_28 : _GEN_2171; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1400 = _T_10 ? memReadDecoder_io_activatedSignals_28 : _GEN_1204; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1402 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1202[7]}},_GEN_1202}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1403 = _T_10 ? oneHotDecoder_io_writeSignal_28 : _GEN_1203; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1866 = op == 2'h1 & _GEN_871; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2172 = Controller == 2'h3 & _GEN_1866; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1405 = _T_10 ? memReadDecoder_io_activatedSignals_29 : _GEN_2172; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1406 = _T_10 ? memReadDecoder_io_activatedSignals_29 : _GEN_1208; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1408 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1206[7]}},_GEN_1206}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1409 = _T_10 ? oneHotDecoder_io_writeSignal_29 : _GEN_1207; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1867 = op == 2'h1 & _GEN_872; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2173 = Controller == 2'h3 & _GEN_1867; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1411 = _T_10 ? memReadDecoder_io_activatedSignals_30 : _GEN_2173; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1412 = _T_10 ? memReadDecoder_io_activatedSignals_30 : _GEN_1212; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1414 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1210[7]}},_GEN_1210}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1415 = _T_10 ? oneHotDecoder_io_writeSignal_30 : _GEN_1211; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1868 = op == 2'h1 & _GEN_873; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 101:34]
  wire  _GEN_2174 = Controller == 2'h3 & _GEN_1868; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 101:34]
  wire  _GEN_1417 = _T_10 ? memReadDecoder_io_activatedSignals_31 : _GEN_2174; // @[Conditional.scala 40:58 ProcessingCore.scala 303:49 ProcessingCore.scala 99:34]
  wire  _GEN_1418 = _T_10 ? memReadDecoder_io_activatedSignals_31 : _GEN_1216; // @[Conditional.scala 40:58 ProcessingCore.scala 304:49]
  wire [8:0] _GEN_1420 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_1214[7]}},_GEN_1214}); // @[Conditional.scala 40:58 ProcessingCore.scala 306:49]
  wire  _GEN_1421 = _T_10 ? oneHotDecoder_io_writeSignal_31 : _GEN_1215; // @[Conditional.scala 40:58 ProcessingCore.scala 308:49]
  wire  _GEN_1422 = _T_10 ? rdWrEnaFlip : _GEN_1084; // @[Conditional.scala 40:58 ProcessingCore.scala 66:34]
  wire  _GEN_1423 = _T_10 ? 1'h0 : _GEN_1085; // @[Conditional.scala 40:58 ProcessingCore.scala 86:37]
  wire  _GEN_1424 = _T_10 ? 1'h0 : _GEN_1218; // @[Conditional.scala 40:58 ProcessingCore.scala 80:37]
  wire  _GEN_1425 = _T_10 ? 1'h0 : _GEN_1219; // @[Conditional.scala 40:58]
  wire [9:0] _GEN_1426 = _T_10 ? 10'h0 : _GEN_1220; // @[Conditional.scala 40:58]
  wire [13:0] _GEN_1427 = op == 2'h0 ? _GEN_1221 : 14'h0; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 85:37]
  wire [12:0] _GEN_1428 = op == 2'h0 ? _GEN_1222 : 13'h0; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 84:37]
  wire  _GEN_1430 = op == 2'h0 & _GEN_1224; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 82:37]
  wire  _GEN_1432 = op == 2'h0 & _GEN_1226; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 81:37]
  wire  _GEN_1433 = op == 2'h0 & _GEN_1227; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 83:37]
  wire [12:0] _GEN_1435 = op == 2'h0 ? _GEN_1229 : {{7'd0}, weightRdAddrNode}; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 98:34]
  wire  _GEN_1436 = op == 2'h0 ? _GEN_1230 : _GEN_2143; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1437 = op == 2'h0 & _GEN_1231; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [9:0] _GEN_1438 = op == 2'h0 ? _GEN_1232 : 10'h0; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 104:40]
  wire [8:0] _GEN_1439 = op == 2'h0 ? $signed(_GEN_1233) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire [9:0] _GEN_1440 = op == 2'h0 ? _GEN_1234 : 10'h0; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 103:40]
  wire  _GEN_1441 = op == 2'h0 & _GEN_1235; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1443 = op == 2'h0 ? _GEN_1237 : _GEN_2144; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1444 = op == 2'h0 & _GEN_1238; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1446 = op == 2'h0 ? $signed(_GEN_1240) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1447 = op == 2'h0 & _GEN_1241; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1449 = op == 2'h0 ? _GEN_1243 : _GEN_2145; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1450 = op == 2'h0 & _GEN_1244; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1452 = op == 2'h0 ? $signed(_GEN_1246) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1453 = op == 2'h0 & _GEN_1247; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1455 = op == 2'h0 ? _GEN_1249 : _GEN_2146; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1456 = op == 2'h0 & _GEN_1250; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1458 = op == 2'h0 ? $signed(_GEN_1252) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1459 = op == 2'h0 & _GEN_1253; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1461 = op == 2'h0 ? _GEN_1255 : _GEN_2147; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1462 = op == 2'h0 & _GEN_1256; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1464 = op == 2'h0 ? $signed(_GEN_1258) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1465 = op == 2'h0 & _GEN_1259; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1467 = op == 2'h0 ? _GEN_1261 : _GEN_2148; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1468 = op == 2'h0 & _GEN_1262; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1470 = op == 2'h0 ? $signed(_GEN_1264) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1471 = op == 2'h0 & _GEN_1265; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1473 = op == 2'h0 ? _GEN_1267 : _GEN_2149; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1474 = op == 2'h0 & _GEN_1268; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1476 = op == 2'h0 ? $signed(_GEN_1270) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1477 = op == 2'h0 & _GEN_1271; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1479 = op == 2'h0 ? _GEN_1273 : _GEN_2150; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1480 = op == 2'h0 & _GEN_1274; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1482 = op == 2'h0 ? $signed(_GEN_1276) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1483 = op == 2'h0 & _GEN_1277; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1485 = op == 2'h0 ? _GEN_1279 : _GEN_2151; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1486 = op == 2'h0 & _GEN_1280; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1488 = op == 2'h0 ? $signed(_GEN_1282) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1489 = op == 2'h0 & _GEN_1283; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1491 = op == 2'h0 ? _GEN_1285 : _GEN_2152; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1492 = op == 2'h0 & _GEN_1286; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1494 = op == 2'h0 ? $signed(_GEN_1288) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1495 = op == 2'h0 & _GEN_1289; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1497 = op == 2'h0 ? _GEN_1291 : _GEN_2153; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1498 = op == 2'h0 & _GEN_1292; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1500 = op == 2'h0 ? $signed(_GEN_1294) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1501 = op == 2'h0 & _GEN_1295; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1503 = op == 2'h0 ? _GEN_1297 : _GEN_2154; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1504 = op == 2'h0 & _GEN_1298; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1506 = op == 2'h0 ? $signed(_GEN_1300) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1507 = op == 2'h0 & _GEN_1301; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1509 = op == 2'h0 ? _GEN_1303 : _GEN_2155; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1510 = op == 2'h0 & _GEN_1304; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1512 = op == 2'h0 ? $signed(_GEN_1306) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1513 = op == 2'h0 & _GEN_1307; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1515 = op == 2'h0 ? _GEN_1309 : _GEN_2156; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1516 = op == 2'h0 & _GEN_1310; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1518 = op == 2'h0 ? $signed(_GEN_1312) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1519 = op == 2'h0 & _GEN_1313; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1521 = op == 2'h0 ? _GEN_1315 : _GEN_2157; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1522 = op == 2'h0 & _GEN_1316; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1524 = op == 2'h0 ? $signed(_GEN_1318) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1525 = op == 2'h0 & _GEN_1319; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1527 = op == 2'h0 ? _GEN_1321 : _GEN_2158; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1528 = op == 2'h0 & _GEN_1322; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1530 = op == 2'h0 ? $signed(_GEN_1324) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1531 = op == 2'h0 & _GEN_1325; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1533 = op == 2'h0 ? _GEN_1327 : _GEN_2159; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1534 = op == 2'h0 & _GEN_1328; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1536 = op == 2'h0 ? $signed(_GEN_1330) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1537 = op == 2'h0 & _GEN_1331; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1539 = op == 2'h0 ? _GEN_1333 : _GEN_2160; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1540 = op == 2'h0 & _GEN_1334; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1542 = op == 2'h0 ? $signed(_GEN_1336) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1543 = op == 2'h0 & _GEN_1337; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1545 = op == 2'h0 ? _GEN_1339 : _GEN_2161; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1546 = op == 2'h0 & _GEN_1340; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1548 = op == 2'h0 ? $signed(_GEN_1342) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1549 = op == 2'h0 & _GEN_1343; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1551 = op == 2'h0 ? _GEN_1345 : _GEN_2162; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1552 = op == 2'h0 & _GEN_1346; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1554 = op == 2'h0 ? $signed(_GEN_1348) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1555 = op == 2'h0 & _GEN_1349; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1557 = op == 2'h0 ? _GEN_1351 : _GEN_2163; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1558 = op == 2'h0 & _GEN_1352; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1560 = op == 2'h0 ? $signed(_GEN_1354) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1561 = op == 2'h0 & _GEN_1355; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1563 = op == 2'h0 ? _GEN_1357 : _GEN_2164; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1564 = op == 2'h0 & _GEN_1358; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1566 = op == 2'h0 ? $signed(_GEN_1360) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1567 = op == 2'h0 & _GEN_1361; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1569 = op == 2'h0 ? _GEN_1363 : _GEN_2165; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1570 = op == 2'h0 & _GEN_1364; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1572 = op == 2'h0 ? $signed(_GEN_1366) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1573 = op == 2'h0 & _GEN_1367; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1575 = op == 2'h0 ? _GEN_1369 : _GEN_2166; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1576 = op == 2'h0 & _GEN_1370; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1578 = op == 2'h0 ? $signed(_GEN_1372) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1579 = op == 2'h0 & _GEN_1373; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1581 = op == 2'h0 ? _GEN_1375 : _GEN_2167; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1582 = op == 2'h0 & _GEN_1376; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1584 = op == 2'h0 ? $signed(_GEN_1378) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1585 = op == 2'h0 & _GEN_1379; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1587 = op == 2'h0 ? _GEN_1381 : _GEN_2168; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1588 = op == 2'h0 & _GEN_1382; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1590 = op == 2'h0 ? $signed(_GEN_1384) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1591 = op == 2'h0 & _GEN_1385; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1593 = op == 2'h0 ? _GEN_1387 : _GEN_2169; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1594 = op == 2'h0 & _GEN_1388; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1596 = op == 2'h0 ? $signed(_GEN_1390) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1597 = op == 2'h0 & _GEN_1391; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1599 = op == 2'h0 ? _GEN_1393 : _GEN_2170; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1600 = op == 2'h0 & _GEN_1394; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1602 = op == 2'h0 ? $signed(_GEN_1396) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1603 = op == 2'h0 & _GEN_1397; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1605 = op == 2'h0 ? _GEN_1399 : _GEN_2171; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1606 = op == 2'h0 & _GEN_1400; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1608 = op == 2'h0 ? $signed(_GEN_1402) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1609 = op == 2'h0 & _GEN_1403; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1611 = op == 2'h0 ? _GEN_1405 : _GEN_2172; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1612 = op == 2'h0 & _GEN_1406; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1614 = op == 2'h0 ? $signed(_GEN_1408) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1615 = op == 2'h0 & _GEN_1409; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1617 = op == 2'h0 ? _GEN_1411 : _GEN_2173; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1618 = op == 2'h0 & _GEN_1412; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1620 = op == 2'h0 ? $signed(_GEN_1414) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1621 = op == 2'h0 & _GEN_1415; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1623 = op == 2'h0 ? _GEN_1417 : _GEN_2174; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 99:34]
  wire  _GEN_1624 = op == 2'h0 & _GEN_1418; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 105:40]
  wire [8:0] _GEN_1626 = op == 2'h0 ? $signed(_GEN_1420) : $signed(9'sh0); // @[ProcessingCore.scala 278:40 ProcessingCore.scala 107:40]
  wire  _GEN_1627 = op == 2'h0 & _GEN_1421; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 106:40]
  wire  _GEN_1629 = op == 2'h0 & _GEN_1423; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 86:37]
  wire  _GEN_1630 = op == 2'h0 & _GEN_1424; // @[ProcessingCore.scala 278:40 ProcessingCore.scala 80:37]
  wire  _GEN_1631 = op == 2'h0 & _GEN_1425; // @[ProcessingCore.scala 278:40]
  wire [9:0] _GEN_1632 = op == 2'h0 ? _GEN_1426 : 10'h0; // @[ProcessingCore.scala 278:40]
  wire  _GEN_1636 = op == 2'h1 ? _GEN_672 : _GEN_1430; // @[ProcessingCore.scala 209:44]
  wire [12:0] _GEN_1637 = op == 2'h1 ? {{7'd0}, _GEN_673} : _GEN_1428; // @[ProcessingCore.scala 209:44]
  wire [9:0] _GEN_1638 = op == 2'h1 ? _GEN_674 : 10'h0; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1639 = op == 2'h1 ? $signed(_GEN_675) : $signed(12'sh0); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1640 = op == 2'h1 & _GEN_676; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1641 = op == 2'h1 & _GEN_677; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1642 = op == 2'h1 & _GEN_678; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1643 = op == 2'h1 & _GEN_679; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1644 = op == 2'h1 & _GEN_680; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1645 = op == 2'h1 & _GEN_681; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1646 = op == 2'h1 & _GEN_682; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1647 = op == 2'h1 & _GEN_683; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1648 = op == 2'h1 & _GEN_684; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1649 = op == 2'h1 & _GEN_685; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1650 = op == 2'h1 & _GEN_686; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1651 = op == 2'h1 & _GEN_687; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1652 = op == 2'h1 & _GEN_688; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1653 = op == 2'h1 & _GEN_689; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1654 = op == 2'h1 & _GEN_690; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1655 = op == 2'h1 & _GEN_691; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1656 = op == 2'h1 & _GEN_692; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1657 = op == 2'h1 & _GEN_693; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1658 = op == 2'h1 & _GEN_694; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1659 = op == 2'h1 & _GEN_695; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1660 = op == 2'h1 & _GEN_696; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1661 = op == 2'h1 & _GEN_697; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1662 = op == 2'h1 & _GEN_698; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1663 = op == 2'h1 & _GEN_699; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1664 = op == 2'h1 & _GEN_700; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1665 = op == 2'h1 & _GEN_701; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1666 = op == 2'h1 & _GEN_702; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1667 = op == 2'h1 & _GEN_703; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1668 = op == 2'h1 & _GEN_704; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1669 = op == 2'h1 & _GEN_705; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1670 = op == 2'h1 & _GEN_706; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1671 = op == 2'h1 & _GEN_707; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1672 = op == 2'h1 ? _GEN_708 : _GEN_1433; // @[ProcessingCore.scala 209:44]
  wire [13:0] _GEN_1673 = op == 2'h1 ? {{8'd0}, _GEN_709} : _GEN_1427; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1674 = op == 2'h1 ? _GEN_710 : _GEN_1441; // @[ProcessingCore.scala 209:44]
  wire [9:0] _GEN_1675 = op == 2'h1 ? _GEN_711 : _GEN_1440; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1676 = op == 2'h1 ? $signed(_GEN_712) : $signed({{3{_GEN_1439[8]}},_GEN_1439}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1677 = op == 2'h1 ? _GEN_713 : _GEN_1447; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1679 = op == 2'h1 ? $signed(_GEN_715) : $signed({{3{_GEN_1446[8]}},_GEN_1446}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1680 = op == 2'h1 ? _GEN_716 : _GEN_1453; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1682 = op == 2'h1 ? $signed(_GEN_718) : $signed({{3{_GEN_1452[8]}},_GEN_1452}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1683 = op == 2'h1 ? _GEN_719 : _GEN_1459; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1685 = op == 2'h1 ? $signed(_GEN_721) : $signed({{3{_GEN_1458[8]}},_GEN_1458}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1686 = op == 2'h1 ? _GEN_722 : _GEN_1465; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1688 = op == 2'h1 ? $signed(_GEN_724) : $signed({{3{_GEN_1464[8]}},_GEN_1464}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1689 = op == 2'h1 ? _GEN_725 : _GEN_1471; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1691 = op == 2'h1 ? $signed(_GEN_727) : $signed({{3{_GEN_1470[8]}},_GEN_1470}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1692 = op == 2'h1 ? _GEN_728 : _GEN_1477; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1694 = op == 2'h1 ? $signed(_GEN_730) : $signed({{3{_GEN_1476[8]}},_GEN_1476}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1695 = op == 2'h1 ? _GEN_731 : _GEN_1483; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1697 = op == 2'h1 ? $signed(_GEN_733) : $signed({{3{_GEN_1482[8]}},_GEN_1482}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1698 = op == 2'h1 ? _GEN_734 : _GEN_1489; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1700 = op == 2'h1 ? $signed(_GEN_736) : $signed({{3{_GEN_1488[8]}},_GEN_1488}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1701 = op == 2'h1 ? _GEN_737 : _GEN_1495; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1703 = op == 2'h1 ? $signed(_GEN_739) : $signed({{3{_GEN_1494[8]}},_GEN_1494}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1704 = op == 2'h1 ? _GEN_740 : _GEN_1501; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1706 = op == 2'h1 ? $signed(_GEN_742) : $signed({{3{_GEN_1500[8]}},_GEN_1500}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1707 = op == 2'h1 ? _GEN_743 : _GEN_1507; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1709 = op == 2'h1 ? $signed(_GEN_745) : $signed({{3{_GEN_1506[8]}},_GEN_1506}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1710 = op == 2'h1 ? _GEN_746 : _GEN_1513; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1712 = op == 2'h1 ? $signed(_GEN_748) : $signed({{3{_GEN_1512[8]}},_GEN_1512}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1713 = op == 2'h1 ? _GEN_749 : _GEN_1519; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1715 = op == 2'h1 ? $signed(_GEN_751) : $signed({{3{_GEN_1518[8]}},_GEN_1518}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1716 = op == 2'h1 ? _GEN_752 : _GEN_1525; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1718 = op == 2'h1 ? $signed(_GEN_754) : $signed({{3{_GEN_1524[8]}},_GEN_1524}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1719 = op == 2'h1 ? _GEN_755 : _GEN_1531; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1721 = op == 2'h1 ? $signed(_GEN_757) : $signed({{3{_GEN_1530[8]}},_GEN_1530}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1722 = op == 2'h1 ? _GEN_758 : _GEN_1537; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1724 = op == 2'h1 ? $signed(_GEN_760) : $signed({{3{_GEN_1536[8]}},_GEN_1536}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1725 = op == 2'h1 ? _GEN_761 : _GEN_1543; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1727 = op == 2'h1 ? $signed(_GEN_763) : $signed({{3{_GEN_1542[8]}},_GEN_1542}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1728 = op == 2'h1 ? _GEN_764 : _GEN_1549; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1730 = op == 2'h1 ? $signed(_GEN_766) : $signed({{3{_GEN_1548[8]}},_GEN_1548}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1731 = op == 2'h1 ? _GEN_767 : _GEN_1555; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1733 = op == 2'h1 ? $signed(_GEN_769) : $signed({{3{_GEN_1554[8]}},_GEN_1554}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1734 = op == 2'h1 ? _GEN_770 : _GEN_1561; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1736 = op == 2'h1 ? $signed(_GEN_772) : $signed({{3{_GEN_1560[8]}},_GEN_1560}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1737 = op == 2'h1 ? _GEN_773 : _GEN_1567; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1739 = op == 2'h1 ? $signed(_GEN_775) : $signed({{3{_GEN_1566[8]}},_GEN_1566}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1740 = op == 2'h1 ? _GEN_776 : _GEN_1573; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1742 = op == 2'h1 ? $signed(_GEN_778) : $signed({{3{_GEN_1572[8]}},_GEN_1572}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1743 = op == 2'h1 ? _GEN_779 : _GEN_1579; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1745 = op == 2'h1 ? $signed(_GEN_781) : $signed({{3{_GEN_1578[8]}},_GEN_1578}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1746 = op == 2'h1 ? _GEN_782 : _GEN_1585; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1748 = op == 2'h1 ? $signed(_GEN_784) : $signed({{3{_GEN_1584[8]}},_GEN_1584}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1749 = op == 2'h1 ? _GEN_785 : _GEN_1591; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1751 = op == 2'h1 ? $signed(_GEN_787) : $signed({{3{_GEN_1590[8]}},_GEN_1590}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1752 = op == 2'h1 ? _GEN_788 : _GEN_1597; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1754 = op == 2'h1 ? $signed(_GEN_790) : $signed({{3{_GEN_1596[8]}},_GEN_1596}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1755 = op == 2'h1 ? _GEN_791 : _GEN_1603; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1757 = op == 2'h1 ? $signed(_GEN_793) : $signed({{3{_GEN_1602[8]}},_GEN_1602}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1758 = op == 2'h1 ? _GEN_794 : _GEN_1609; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1760 = op == 2'h1 ? $signed(_GEN_796) : $signed({{3{_GEN_1608[8]}},_GEN_1608}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1761 = op == 2'h1 ? _GEN_797 : _GEN_1615; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1763 = op == 2'h1 ? $signed(_GEN_799) : $signed({{3{_GEN_1614[8]}},_GEN_1614}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1764 = op == 2'h1 ? _GEN_800 : _GEN_1621; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1766 = op == 2'h1 ? $signed(_GEN_802) : $signed({{3{_GEN_1620[8]}},_GEN_1620}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1767 = op == 2'h1 ? _GEN_803 : _GEN_1627; // @[ProcessingCore.scala 209:44]
  wire [11:0] _GEN_1769 = op == 2'h1 ? $signed(_GEN_805) : $signed({{3{_GEN_1626[8]}},_GEN_1626}); // @[ProcessingCore.scala 209:44]
  wire  _GEN_1770 = op == 2'h1 ? _GEN_806 : _GEN_1437; // @[ProcessingCore.scala 209:44]
  wire [9:0] _GEN_1771 = op == 2'h1 ? _GEN_807 : _GEN_1438; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1772 = op == 2'h1 ? _GEN_808 : _GEN_1444; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1774 = op == 2'h1 ? _GEN_809 : _GEN_1450; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1776 = op == 2'h1 ? _GEN_810 : _GEN_1456; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1778 = op == 2'h1 ? _GEN_811 : _GEN_1462; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1780 = op == 2'h1 ? _GEN_812 : _GEN_1468; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1782 = op == 2'h1 ? _GEN_813 : _GEN_1474; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1784 = op == 2'h1 ? _GEN_814 : _GEN_1480; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1786 = op == 2'h1 ? _GEN_815 : _GEN_1486; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1788 = op == 2'h1 ? _GEN_816 : _GEN_1492; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1790 = op == 2'h1 ? _GEN_817 : _GEN_1498; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1792 = op == 2'h1 ? _GEN_818 : _GEN_1504; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1794 = op == 2'h1 ? _GEN_819 : _GEN_1510; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1796 = op == 2'h1 ? _GEN_820 : _GEN_1516; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1798 = op == 2'h1 ? _GEN_821 : _GEN_1522; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1800 = op == 2'h1 ? _GEN_822 : _GEN_1528; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1802 = op == 2'h1 ? _GEN_823 : _GEN_1534; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1804 = op == 2'h1 ? _GEN_824 : _GEN_1540; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1806 = op == 2'h1 ? _GEN_825 : _GEN_1546; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1808 = op == 2'h1 ? _GEN_826 : _GEN_1552; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1810 = op == 2'h1 ? _GEN_827 : _GEN_1558; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1812 = op == 2'h1 ? _GEN_828 : _GEN_1564; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1814 = op == 2'h1 ? _GEN_829 : _GEN_1570; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1816 = op == 2'h1 ? _GEN_830 : _GEN_1576; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1818 = op == 2'h1 ? _GEN_831 : _GEN_1582; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1820 = op == 2'h1 ? _GEN_832 : _GEN_1588; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1822 = op == 2'h1 ? _GEN_833 : _GEN_1594; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1824 = op == 2'h1 ? _GEN_834 : _GEN_1600; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1826 = op == 2'h1 ? _GEN_835 : _GEN_1606; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1828 = op == 2'h1 ? _GEN_836 : _GEN_1612; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1830 = op == 2'h1 ? _GEN_837 : _GEN_1618; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1832 = op == 2'h1 ? _GEN_838 : _GEN_1624; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1834 = op == 2'h1 ? _GEN_839 : _GEN_1630; // @[ProcessingCore.scala 209:44]
  wire  _GEN_1836 = op == 2'h1 ? _GEN_841 : _GEN_1432; // @[ProcessingCore.scala 209:44]
  wire [12:0] _GEN_1871 = op == 2'h1 ? {{7'd0}, weightRdAddrNode} : _GEN_1435; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 98:34]
  wire  _GEN_1872 = op == 2'h1 ? _GEN_2143 : _GEN_1436; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1874 = op == 2'h1 ? _GEN_2144 : _GEN_1443; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1876 = op == 2'h1 ? _GEN_2145 : _GEN_1449; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1878 = op == 2'h1 ? _GEN_2146 : _GEN_1455; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1880 = op == 2'h1 ? _GEN_2147 : _GEN_1461; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1882 = op == 2'h1 ? _GEN_2148 : _GEN_1467; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1884 = op == 2'h1 ? _GEN_2149 : _GEN_1473; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1886 = op == 2'h1 ? _GEN_2150 : _GEN_1479; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1888 = op == 2'h1 ? _GEN_2151 : _GEN_1485; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1890 = op == 2'h1 ? _GEN_2152 : _GEN_1491; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1892 = op == 2'h1 ? _GEN_2153 : _GEN_1497; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1894 = op == 2'h1 ? _GEN_2154 : _GEN_1503; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1896 = op == 2'h1 ? _GEN_2155 : _GEN_1509; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1898 = op == 2'h1 ? _GEN_2156 : _GEN_1515; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1900 = op == 2'h1 ? _GEN_2157 : _GEN_1521; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1902 = op == 2'h1 ? _GEN_2158 : _GEN_1527; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1904 = op == 2'h1 ? _GEN_2159 : _GEN_1533; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1906 = op == 2'h1 ? _GEN_2160 : _GEN_1539; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1908 = op == 2'h1 ? _GEN_2161 : _GEN_1545; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1910 = op == 2'h1 ? _GEN_2162 : _GEN_1551; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1912 = op == 2'h1 ? _GEN_2163 : _GEN_1557; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1914 = op == 2'h1 ? _GEN_2164 : _GEN_1563; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1916 = op == 2'h1 ? _GEN_2165 : _GEN_1569; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1918 = op == 2'h1 ? _GEN_2166 : _GEN_1575; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1920 = op == 2'h1 ? _GEN_2167 : _GEN_1581; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1922 = op == 2'h1 ? _GEN_2168 : _GEN_1587; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1924 = op == 2'h1 ? _GEN_2169 : _GEN_1593; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1926 = op == 2'h1 ? _GEN_2170 : _GEN_1599; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1928 = op == 2'h1 ? _GEN_2171 : _GEN_1605; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1930 = op == 2'h1 ? _GEN_2172 : _GEN_1611; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1932 = op == 2'h1 ? _GEN_2173 : _GEN_1617; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1934 = op == 2'h1 ? _GEN_2174 : _GEN_1623; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 99:34]
  wire  _GEN_1936 = op == 2'h1 ? 1'h0 : _GEN_1629; // @[ProcessingCore.scala 209:44 ProcessingCore.scala 86:37]
  wire  _GEN_1937 = op == 2'h1 ? 1'h0 : _GEN_1631; // @[ProcessingCore.scala 209:44]
  wire [9:0] _GEN_1938 = op == 2'h1 ? 10'h0 : _GEN_1632; // @[ProcessingCore.scala 209:44]
  wire [12:0] _GEN_1943 = Controller == 2'h3 ? _GEN_1637 : 13'h0; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 84:37]
  wire [9:0] _GEN_1944 = Controller == 2'h3 ? _GEN_1638 : 10'h0; // @[ProcessingCore.scala 207:33]
  wire [11:0] _GEN_1945 = Controller == 2'h3 ? $signed(_GEN_1639) : $signed(12'sh0); // @[ProcessingCore.scala 207:33]
  wire [13:0] _GEN_1979 = Controller == 2'h3 ? _GEN_1673 : 14'h0; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 85:37]
  wire [9:0] _GEN_1981 = Controller == 2'h3 ? _GEN_1675 : 10'h0; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 103:40]
  wire [11:0] _GEN_1982 = Controller == 2'h3 ? $signed(_GEN_1676) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_1985 = Controller == 2'h3 ? $signed(_GEN_1679) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_1988 = Controller == 2'h3 ? $signed(_GEN_1682) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_1991 = Controller == 2'h3 ? $signed(_GEN_1685) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_1994 = Controller == 2'h3 ? $signed(_GEN_1688) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_1997 = Controller == 2'h3 ? $signed(_GEN_1691) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2000 = Controller == 2'h3 ? $signed(_GEN_1694) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2003 = Controller == 2'h3 ? $signed(_GEN_1697) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2006 = Controller == 2'h3 ? $signed(_GEN_1700) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2009 = Controller == 2'h3 ? $signed(_GEN_1703) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2012 = Controller == 2'h3 ? $signed(_GEN_1706) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2015 = Controller == 2'h3 ? $signed(_GEN_1709) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2018 = Controller == 2'h3 ? $signed(_GEN_1712) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2021 = Controller == 2'h3 ? $signed(_GEN_1715) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2024 = Controller == 2'h3 ? $signed(_GEN_1718) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2027 = Controller == 2'h3 ? $signed(_GEN_1721) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2030 = Controller == 2'h3 ? $signed(_GEN_1724) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2033 = Controller == 2'h3 ? $signed(_GEN_1727) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2036 = Controller == 2'h3 ? $signed(_GEN_1730) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2039 = Controller == 2'h3 ? $signed(_GEN_1733) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2042 = Controller == 2'h3 ? $signed(_GEN_1736) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2045 = Controller == 2'h3 ? $signed(_GEN_1739) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2048 = Controller == 2'h3 ? $signed(_GEN_1742) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2051 = Controller == 2'h3 ? $signed(_GEN_1745) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2054 = Controller == 2'h3 ? $signed(_GEN_1748) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2057 = Controller == 2'h3 ? $signed(_GEN_1751) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2060 = Controller == 2'h3 ? $signed(_GEN_1754) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2063 = Controller == 2'h3 ? $signed(_GEN_1757) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2066 = Controller == 2'h3 ? $signed(_GEN_1760) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2069 = Controller == 2'h3 ? $signed(_GEN_1763) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2072 = Controller == 2'h3 ? $signed(_GEN_1766) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [11:0] _GEN_2075 = Controller == 2'h3 ? $signed(_GEN_1769) : $signed(12'sh0); // @[ProcessingCore.scala 207:33 ProcessingCore.scala 107:40]
  wire [9:0] _GEN_2077 = Controller == 2'h3 ? _GEN_1771 : 10'h0; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 104:40]
  wire [12:0] _GEN_2177 = Controller == 2'h3 ? _GEN_1871 : {{7'd0}, weightRdAddrNode}; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 98:34]
  DualPortedMem DualPortedMem ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_clock),
    .reset(DualPortedMem_reset),
    .io_wrData(DualPortedMem_io_wrData),
    .io_rdData(DualPortedMem_io_rdData),
    .io_readAddr(DualPortedMem_io_readAddr),
    .io_writeAddr(DualPortedMem_io_writeAddr),
    .io_wrEna(DualPortedMem_io_wrEna),
    .io_rdEna(DualPortedMem_io_rdEna)
  );
  DualPortedMem DualPortedMem_1 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_1_clock),
    .reset(DualPortedMem_1_reset),
    .io_wrData(DualPortedMem_1_io_wrData),
    .io_rdData(DualPortedMem_1_io_rdData),
    .io_readAddr(DualPortedMem_1_io_readAddr),
    .io_writeAddr(DualPortedMem_1_io_writeAddr),
    .io_wrEna(DualPortedMem_1_io_wrEna),
    .io_rdEna(DualPortedMem_1_io_rdEna)
  );
  DualPortedMem DualPortedMem_2 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_2_clock),
    .reset(DualPortedMem_2_reset),
    .io_wrData(DualPortedMem_2_io_wrData),
    .io_rdData(DualPortedMem_2_io_rdData),
    .io_readAddr(DualPortedMem_2_io_readAddr),
    .io_writeAddr(DualPortedMem_2_io_writeAddr),
    .io_wrEna(DualPortedMem_2_io_wrEna),
    .io_rdEna(DualPortedMem_2_io_rdEna)
  );
  DualPortedMem DualPortedMem_3 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_3_clock),
    .reset(DualPortedMem_3_reset),
    .io_wrData(DualPortedMem_3_io_wrData),
    .io_rdData(DualPortedMem_3_io_rdData),
    .io_readAddr(DualPortedMem_3_io_readAddr),
    .io_writeAddr(DualPortedMem_3_io_writeAddr),
    .io_wrEna(DualPortedMem_3_io_wrEna),
    .io_rdEna(DualPortedMem_3_io_rdEna)
  );
  DualPortedMem DualPortedMem_4 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_4_clock),
    .reset(DualPortedMem_4_reset),
    .io_wrData(DualPortedMem_4_io_wrData),
    .io_rdData(DualPortedMem_4_io_rdData),
    .io_readAddr(DualPortedMem_4_io_readAddr),
    .io_writeAddr(DualPortedMem_4_io_writeAddr),
    .io_wrEna(DualPortedMem_4_io_wrEna),
    .io_rdEna(DualPortedMem_4_io_rdEna)
  );
  DualPortedMem DualPortedMem_5 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_5_clock),
    .reset(DualPortedMem_5_reset),
    .io_wrData(DualPortedMem_5_io_wrData),
    .io_rdData(DualPortedMem_5_io_rdData),
    .io_readAddr(DualPortedMem_5_io_readAddr),
    .io_writeAddr(DualPortedMem_5_io_writeAddr),
    .io_wrEna(DualPortedMem_5_io_wrEna),
    .io_rdEna(DualPortedMem_5_io_rdEna)
  );
  DualPortedMem DualPortedMem_6 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_6_clock),
    .reset(DualPortedMem_6_reset),
    .io_wrData(DualPortedMem_6_io_wrData),
    .io_rdData(DualPortedMem_6_io_rdData),
    .io_readAddr(DualPortedMem_6_io_readAddr),
    .io_writeAddr(DualPortedMem_6_io_writeAddr),
    .io_wrEna(DualPortedMem_6_io_wrEna),
    .io_rdEna(DualPortedMem_6_io_rdEna)
  );
  DualPortedMem DualPortedMem_7 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_7_clock),
    .reset(DualPortedMem_7_reset),
    .io_wrData(DualPortedMem_7_io_wrData),
    .io_rdData(DualPortedMem_7_io_rdData),
    .io_readAddr(DualPortedMem_7_io_readAddr),
    .io_writeAddr(DualPortedMem_7_io_writeAddr),
    .io_wrEna(DualPortedMem_7_io_wrEna),
    .io_rdEna(DualPortedMem_7_io_rdEna)
  );
  DualPortedMem DualPortedMem_8 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_8_clock),
    .reset(DualPortedMem_8_reset),
    .io_wrData(DualPortedMem_8_io_wrData),
    .io_rdData(DualPortedMem_8_io_rdData),
    .io_readAddr(DualPortedMem_8_io_readAddr),
    .io_writeAddr(DualPortedMem_8_io_writeAddr),
    .io_wrEna(DualPortedMem_8_io_wrEna),
    .io_rdEna(DualPortedMem_8_io_rdEna)
  );
  DualPortedMem DualPortedMem_9 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_9_clock),
    .reset(DualPortedMem_9_reset),
    .io_wrData(DualPortedMem_9_io_wrData),
    .io_rdData(DualPortedMem_9_io_rdData),
    .io_readAddr(DualPortedMem_9_io_readAddr),
    .io_writeAddr(DualPortedMem_9_io_writeAddr),
    .io_wrEna(DualPortedMem_9_io_wrEna),
    .io_rdEna(DualPortedMem_9_io_rdEna)
  );
  DualPortedMem DualPortedMem_10 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_10_clock),
    .reset(DualPortedMem_10_reset),
    .io_wrData(DualPortedMem_10_io_wrData),
    .io_rdData(DualPortedMem_10_io_rdData),
    .io_readAddr(DualPortedMem_10_io_readAddr),
    .io_writeAddr(DualPortedMem_10_io_writeAddr),
    .io_wrEna(DualPortedMem_10_io_wrEna),
    .io_rdEna(DualPortedMem_10_io_rdEna)
  );
  DualPortedMem DualPortedMem_11 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_11_clock),
    .reset(DualPortedMem_11_reset),
    .io_wrData(DualPortedMem_11_io_wrData),
    .io_rdData(DualPortedMem_11_io_rdData),
    .io_readAddr(DualPortedMem_11_io_readAddr),
    .io_writeAddr(DualPortedMem_11_io_writeAddr),
    .io_wrEna(DualPortedMem_11_io_wrEna),
    .io_rdEna(DualPortedMem_11_io_rdEna)
  );
  DualPortedMem DualPortedMem_12 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_12_clock),
    .reset(DualPortedMem_12_reset),
    .io_wrData(DualPortedMem_12_io_wrData),
    .io_rdData(DualPortedMem_12_io_rdData),
    .io_readAddr(DualPortedMem_12_io_readAddr),
    .io_writeAddr(DualPortedMem_12_io_writeAddr),
    .io_wrEna(DualPortedMem_12_io_wrEna),
    .io_rdEna(DualPortedMem_12_io_rdEna)
  );
  DualPortedMem DualPortedMem_13 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_13_clock),
    .reset(DualPortedMem_13_reset),
    .io_wrData(DualPortedMem_13_io_wrData),
    .io_rdData(DualPortedMem_13_io_rdData),
    .io_readAddr(DualPortedMem_13_io_readAddr),
    .io_writeAddr(DualPortedMem_13_io_writeAddr),
    .io_wrEna(DualPortedMem_13_io_wrEna),
    .io_rdEna(DualPortedMem_13_io_rdEna)
  );
  DualPortedMem DualPortedMem_14 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_14_clock),
    .reset(DualPortedMem_14_reset),
    .io_wrData(DualPortedMem_14_io_wrData),
    .io_rdData(DualPortedMem_14_io_rdData),
    .io_readAddr(DualPortedMem_14_io_readAddr),
    .io_writeAddr(DualPortedMem_14_io_writeAddr),
    .io_wrEna(DualPortedMem_14_io_wrEna),
    .io_rdEna(DualPortedMem_14_io_rdEna)
  );
  DualPortedMem DualPortedMem_15 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_15_clock),
    .reset(DualPortedMem_15_reset),
    .io_wrData(DualPortedMem_15_io_wrData),
    .io_rdData(DualPortedMem_15_io_rdData),
    .io_readAddr(DualPortedMem_15_io_readAddr),
    .io_writeAddr(DualPortedMem_15_io_writeAddr),
    .io_wrEna(DualPortedMem_15_io_wrEna),
    .io_rdEna(DualPortedMem_15_io_rdEna)
  );
  DualPortedMem DualPortedMem_16 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_16_clock),
    .reset(DualPortedMem_16_reset),
    .io_wrData(DualPortedMem_16_io_wrData),
    .io_rdData(DualPortedMem_16_io_rdData),
    .io_readAddr(DualPortedMem_16_io_readAddr),
    .io_writeAddr(DualPortedMem_16_io_writeAddr),
    .io_wrEna(DualPortedMem_16_io_wrEna),
    .io_rdEna(DualPortedMem_16_io_rdEna)
  );
  DualPortedMem DualPortedMem_17 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_17_clock),
    .reset(DualPortedMem_17_reset),
    .io_wrData(DualPortedMem_17_io_wrData),
    .io_rdData(DualPortedMem_17_io_rdData),
    .io_readAddr(DualPortedMem_17_io_readAddr),
    .io_writeAddr(DualPortedMem_17_io_writeAddr),
    .io_wrEna(DualPortedMem_17_io_wrEna),
    .io_rdEna(DualPortedMem_17_io_rdEna)
  );
  DualPortedMem DualPortedMem_18 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_18_clock),
    .reset(DualPortedMem_18_reset),
    .io_wrData(DualPortedMem_18_io_wrData),
    .io_rdData(DualPortedMem_18_io_rdData),
    .io_readAddr(DualPortedMem_18_io_readAddr),
    .io_writeAddr(DualPortedMem_18_io_writeAddr),
    .io_wrEna(DualPortedMem_18_io_wrEna),
    .io_rdEna(DualPortedMem_18_io_rdEna)
  );
  DualPortedMem DualPortedMem_19 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_19_clock),
    .reset(DualPortedMem_19_reset),
    .io_wrData(DualPortedMem_19_io_wrData),
    .io_rdData(DualPortedMem_19_io_rdData),
    .io_readAddr(DualPortedMem_19_io_readAddr),
    .io_writeAddr(DualPortedMem_19_io_writeAddr),
    .io_wrEna(DualPortedMem_19_io_wrEna),
    .io_rdEna(DualPortedMem_19_io_rdEna)
  );
  DualPortedMem DualPortedMem_20 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_20_clock),
    .reset(DualPortedMem_20_reset),
    .io_wrData(DualPortedMem_20_io_wrData),
    .io_rdData(DualPortedMem_20_io_rdData),
    .io_readAddr(DualPortedMem_20_io_readAddr),
    .io_writeAddr(DualPortedMem_20_io_writeAddr),
    .io_wrEna(DualPortedMem_20_io_wrEna),
    .io_rdEna(DualPortedMem_20_io_rdEna)
  );
  DualPortedMem DualPortedMem_21 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_21_clock),
    .reset(DualPortedMem_21_reset),
    .io_wrData(DualPortedMem_21_io_wrData),
    .io_rdData(DualPortedMem_21_io_rdData),
    .io_readAddr(DualPortedMem_21_io_readAddr),
    .io_writeAddr(DualPortedMem_21_io_writeAddr),
    .io_wrEna(DualPortedMem_21_io_wrEna),
    .io_rdEna(DualPortedMem_21_io_rdEna)
  );
  DualPortedMem DualPortedMem_22 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_22_clock),
    .reset(DualPortedMem_22_reset),
    .io_wrData(DualPortedMem_22_io_wrData),
    .io_rdData(DualPortedMem_22_io_rdData),
    .io_readAddr(DualPortedMem_22_io_readAddr),
    .io_writeAddr(DualPortedMem_22_io_writeAddr),
    .io_wrEna(DualPortedMem_22_io_wrEna),
    .io_rdEna(DualPortedMem_22_io_rdEna)
  );
  DualPortedMem DualPortedMem_23 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_23_clock),
    .reset(DualPortedMem_23_reset),
    .io_wrData(DualPortedMem_23_io_wrData),
    .io_rdData(DualPortedMem_23_io_rdData),
    .io_readAddr(DualPortedMem_23_io_readAddr),
    .io_writeAddr(DualPortedMem_23_io_writeAddr),
    .io_wrEna(DualPortedMem_23_io_wrEna),
    .io_rdEna(DualPortedMem_23_io_rdEna)
  );
  DualPortedMem DualPortedMem_24 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_24_clock),
    .reset(DualPortedMem_24_reset),
    .io_wrData(DualPortedMem_24_io_wrData),
    .io_rdData(DualPortedMem_24_io_rdData),
    .io_readAddr(DualPortedMem_24_io_readAddr),
    .io_writeAddr(DualPortedMem_24_io_writeAddr),
    .io_wrEna(DualPortedMem_24_io_wrEna),
    .io_rdEna(DualPortedMem_24_io_rdEna)
  );
  DualPortedMem DualPortedMem_25 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_25_clock),
    .reset(DualPortedMem_25_reset),
    .io_wrData(DualPortedMem_25_io_wrData),
    .io_rdData(DualPortedMem_25_io_rdData),
    .io_readAddr(DualPortedMem_25_io_readAddr),
    .io_writeAddr(DualPortedMem_25_io_writeAddr),
    .io_wrEna(DualPortedMem_25_io_wrEna),
    .io_rdEna(DualPortedMem_25_io_rdEna)
  );
  DualPortedMem DualPortedMem_26 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_26_clock),
    .reset(DualPortedMem_26_reset),
    .io_wrData(DualPortedMem_26_io_wrData),
    .io_rdData(DualPortedMem_26_io_rdData),
    .io_readAddr(DualPortedMem_26_io_readAddr),
    .io_writeAddr(DualPortedMem_26_io_writeAddr),
    .io_wrEna(DualPortedMem_26_io_wrEna),
    .io_rdEna(DualPortedMem_26_io_rdEna)
  );
  DualPortedMem DualPortedMem_27 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_27_clock),
    .reset(DualPortedMem_27_reset),
    .io_wrData(DualPortedMem_27_io_wrData),
    .io_rdData(DualPortedMem_27_io_rdData),
    .io_readAddr(DualPortedMem_27_io_readAddr),
    .io_writeAddr(DualPortedMem_27_io_writeAddr),
    .io_wrEna(DualPortedMem_27_io_wrEna),
    .io_rdEna(DualPortedMem_27_io_rdEna)
  );
  DualPortedMem DualPortedMem_28 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_28_clock),
    .reset(DualPortedMem_28_reset),
    .io_wrData(DualPortedMem_28_io_wrData),
    .io_rdData(DualPortedMem_28_io_rdData),
    .io_readAddr(DualPortedMem_28_io_readAddr),
    .io_writeAddr(DualPortedMem_28_io_writeAddr),
    .io_wrEna(DualPortedMem_28_io_wrEna),
    .io_rdEna(DualPortedMem_28_io_rdEna)
  );
  DualPortedMem DualPortedMem_29 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_29_clock),
    .reset(DualPortedMem_29_reset),
    .io_wrData(DualPortedMem_29_io_wrData),
    .io_rdData(DualPortedMem_29_io_rdData),
    .io_readAddr(DualPortedMem_29_io_readAddr),
    .io_writeAddr(DualPortedMem_29_io_writeAddr),
    .io_wrEna(DualPortedMem_29_io_wrEna),
    .io_rdEna(DualPortedMem_29_io_rdEna)
  );
  DualPortedMem DualPortedMem_30 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_30_clock),
    .reset(DualPortedMem_30_reset),
    .io_wrData(DualPortedMem_30_io_wrData),
    .io_rdData(DualPortedMem_30_io_rdData),
    .io_readAddr(DualPortedMem_30_io_readAddr),
    .io_writeAddr(DualPortedMem_30_io_writeAddr),
    .io_wrEna(DualPortedMem_30_io_wrEna),
    .io_rdEna(DualPortedMem_30_io_rdEna)
  );
  DualPortedMem DualPortedMem_31 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_31_clock),
    .reset(DualPortedMem_31_reset),
    .io_wrData(DualPortedMem_31_io_wrData),
    .io_rdData(DualPortedMem_31_io_rdData),
    .io_readAddr(DualPortedMem_31_io_readAddr),
    .io_writeAddr(DualPortedMem_31_io_writeAddr),
    .io_wrEna(DualPortedMem_31_io_wrEna),
    .io_rdEna(DualPortedMem_31_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_32 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_32_clock),
    .reset(DualPortedMem_32_reset),
    .io_wrData(DualPortedMem_32_io_wrData),
    .io_rdData(DualPortedMem_32_io_rdData),
    .io_readAddr(DualPortedMem_32_io_readAddr),
    .io_writeAddr(DualPortedMem_32_io_writeAddr),
    .io_wrEna(DualPortedMem_32_io_wrEna),
    .io_rdEna(DualPortedMem_32_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_33 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_33_clock),
    .reset(DualPortedMem_33_reset),
    .io_wrData(DualPortedMem_33_io_wrData),
    .io_rdData(DualPortedMem_33_io_rdData),
    .io_readAddr(DualPortedMem_33_io_readAddr),
    .io_writeAddr(DualPortedMem_33_io_writeAddr),
    .io_wrEna(DualPortedMem_33_io_wrEna),
    .io_rdEna(DualPortedMem_33_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_34 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_34_clock),
    .reset(DualPortedMem_34_reset),
    .io_wrData(DualPortedMem_34_io_wrData),
    .io_rdData(DualPortedMem_34_io_rdData),
    .io_readAddr(DualPortedMem_34_io_readAddr),
    .io_writeAddr(DualPortedMem_34_io_writeAddr),
    .io_wrEna(DualPortedMem_34_io_wrEna),
    .io_rdEna(DualPortedMem_34_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_35 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_35_clock),
    .reset(DualPortedMem_35_reset),
    .io_wrData(DualPortedMem_35_io_wrData),
    .io_rdData(DualPortedMem_35_io_rdData),
    .io_readAddr(DualPortedMem_35_io_readAddr),
    .io_writeAddr(DualPortedMem_35_io_writeAddr),
    .io_wrEna(DualPortedMem_35_io_wrEna),
    .io_rdEna(DualPortedMem_35_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_36 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_36_clock),
    .reset(DualPortedMem_36_reset),
    .io_wrData(DualPortedMem_36_io_wrData),
    .io_rdData(DualPortedMem_36_io_rdData),
    .io_readAddr(DualPortedMem_36_io_readAddr),
    .io_writeAddr(DualPortedMem_36_io_writeAddr),
    .io_wrEna(DualPortedMem_36_io_wrEna),
    .io_rdEna(DualPortedMem_36_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_37 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_37_clock),
    .reset(DualPortedMem_37_reset),
    .io_wrData(DualPortedMem_37_io_wrData),
    .io_rdData(DualPortedMem_37_io_rdData),
    .io_readAddr(DualPortedMem_37_io_readAddr),
    .io_writeAddr(DualPortedMem_37_io_writeAddr),
    .io_wrEna(DualPortedMem_37_io_wrEna),
    .io_rdEna(DualPortedMem_37_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_38 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_38_clock),
    .reset(DualPortedMem_38_reset),
    .io_wrData(DualPortedMem_38_io_wrData),
    .io_rdData(DualPortedMem_38_io_rdData),
    .io_readAddr(DualPortedMem_38_io_readAddr),
    .io_writeAddr(DualPortedMem_38_io_writeAddr),
    .io_wrEna(DualPortedMem_38_io_wrEna),
    .io_rdEna(DualPortedMem_38_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_39 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_39_clock),
    .reset(DualPortedMem_39_reset),
    .io_wrData(DualPortedMem_39_io_wrData),
    .io_rdData(DualPortedMem_39_io_rdData),
    .io_readAddr(DualPortedMem_39_io_readAddr),
    .io_writeAddr(DualPortedMem_39_io_writeAddr),
    .io_wrEna(DualPortedMem_39_io_wrEna),
    .io_rdEna(DualPortedMem_39_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_40 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_40_clock),
    .reset(DualPortedMem_40_reset),
    .io_wrData(DualPortedMem_40_io_wrData),
    .io_rdData(DualPortedMem_40_io_rdData),
    .io_readAddr(DualPortedMem_40_io_readAddr),
    .io_writeAddr(DualPortedMem_40_io_writeAddr),
    .io_wrEna(DualPortedMem_40_io_wrEna),
    .io_rdEna(DualPortedMem_40_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_41 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_41_clock),
    .reset(DualPortedMem_41_reset),
    .io_wrData(DualPortedMem_41_io_wrData),
    .io_rdData(DualPortedMem_41_io_rdData),
    .io_readAddr(DualPortedMem_41_io_readAddr),
    .io_writeAddr(DualPortedMem_41_io_writeAddr),
    .io_wrEna(DualPortedMem_41_io_wrEna),
    .io_rdEna(DualPortedMem_41_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_42 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_42_clock),
    .reset(DualPortedMem_42_reset),
    .io_wrData(DualPortedMem_42_io_wrData),
    .io_rdData(DualPortedMem_42_io_rdData),
    .io_readAddr(DualPortedMem_42_io_readAddr),
    .io_writeAddr(DualPortedMem_42_io_writeAddr),
    .io_wrEna(DualPortedMem_42_io_wrEna),
    .io_rdEna(DualPortedMem_42_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_43 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_43_clock),
    .reset(DualPortedMem_43_reset),
    .io_wrData(DualPortedMem_43_io_wrData),
    .io_rdData(DualPortedMem_43_io_rdData),
    .io_readAddr(DualPortedMem_43_io_readAddr),
    .io_writeAddr(DualPortedMem_43_io_writeAddr),
    .io_wrEna(DualPortedMem_43_io_wrEna),
    .io_rdEna(DualPortedMem_43_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_44 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_44_clock),
    .reset(DualPortedMem_44_reset),
    .io_wrData(DualPortedMem_44_io_wrData),
    .io_rdData(DualPortedMem_44_io_rdData),
    .io_readAddr(DualPortedMem_44_io_readAddr),
    .io_writeAddr(DualPortedMem_44_io_writeAddr),
    .io_wrEna(DualPortedMem_44_io_wrEna),
    .io_rdEna(DualPortedMem_44_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_45 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_45_clock),
    .reset(DualPortedMem_45_reset),
    .io_wrData(DualPortedMem_45_io_wrData),
    .io_rdData(DualPortedMem_45_io_rdData),
    .io_readAddr(DualPortedMem_45_io_readAddr),
    .io_writeAddr(DualPortedMem_45_io_writeAddr),
    .io_wrEna(DualPortedMem_45_io_wrEna),
    .io_rdEna(DualPortedMem_45_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_46 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_46_clock),
    .reset(DualPortedMem_46_reset),
    .io_wrData(DualPortedMem_46_io_wrData),
    .io_rdData(DualPortedMem_46_io_rdData),
    .io_readAddr(DualPortedMem_46_io_readAddr),
    .io_writeAddr(DualPortedMem_46_io_writeAddr),
    .io_wrEna(DualPortedMem_46_io_wrEna),
    .io_rdEna(DualPortedMem_46_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_47 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_47_clock),
    .reset(DualPortedMem_47_reset),
    .io_wrData(DualPortedMem_47_io_wrData),
    .io_rdData(DualPortedMem_47_io_rdData),
    .io_readAddr(DualPortedMem_47_io_readAddr),
    .io_writeAddr(DualPortedMem_47_io_writeAddr),
    .io_wrEna(DualPortedMem_47_io_wrEna),
    .io_rdEna(DualPortedMem_47_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_48 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_48_clock),
    .reset(DualPortedMem_48_reset),
    .io_wrData(DualPortedMem_48_io_wrData),
    .io_rdData(DualPortedMem_48_io_rdData),
    .io_readAddr(DualPortedMem_48_io_readAddr),
    .io_writeAddr(DualPortedMem_48_io_writeAddr),
    .io_wrEna(DualPortedMem_48_io_wrEna),
    .io_rdEna(DualPortedMem_48_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_49 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_49_clock),
    .reset(DualPortedMem_49_reset),
    .io_wrData(DualPortedMem_49_io_wrData),
    .io_rdData(DualPortedMem_49_io_rdData),
    .io_readAddr(DualPortedMem_49_io_readAddr),
    .io_writeAddr(DualPortedMem_49_io_writeAddr),
    .io_wrEna(DualPortedMem_49_io_wrEna),
    .io_rdEna(DualPortedMem_49_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_50 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_50_clock),
    .reset(DualPortedMem_50_reset),
    .io_wrData(DualPortedMem_50_io_wrData),
    .io_rdData(DualPortedMem_50_io_rdData),
    .io_readAddr(DualPortedMem_50_io_readAddr),
    .io_writeAddr(DualPortedMem_50_io_writeAddr),
    .io_wrEna(DualPortedMem_50_io_wrEna),
    .io_rdEna(DualPortedMem_50_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_51 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_51_clock),
    .reset(DualPortedMem_51_reset),
    .io_wrData(DualPortedMem_51_io_wrData),
    .io_rdData(DualPortedMem_51_io_rdData),
    .io_readAddr(DualPortedMem_51_io_readAddr),
    .io_writeAddr(DualPortedMem_51_io_writeAddr),
    .io_wrEna(DualPortedMem_51_io_wrEna),
    .io_rdEna(DualPortedMem_51_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_52 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_52_clock),
    .reset(DualPortedMem_52_reset),
    .io_wrData(DualPortedMem_52_io_wrData),
    .io_rdData(DualPortedMem_52_io_rdData),
    .io_readAddr(DualPortedMem_52_io_readAddr),
    .io_writeAddr(DualPortedMem_52_io_writeAddr),
    .io_wrEna(DualPortedMem_52_io_wrEna),
    .io_rdEna(DualPortedMem_52_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_53 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_53_clock),
    .reset(DualPortedMem_53_reset),
    .io_wrData(DualPortedMem_53_io_wrData),
    .io_rdData(DualPortedMem_53_io_rdData),
    .io_readAddr(DualPortedMem_53_io_readAddr),
    .io_writeAddr(DualPortedMem_53_io_writeAddr),
    .io_wrEna(DualPortedMem_53_io_wrEna),
    .io_rdEna(DualPortedMem_53_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_54 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_54_clock),
    .reset(DualPortedMem_54_reset),
    .io_wrData(DualPortedMem_54_io_wrData),
    .io_rdData(DualPortedMem_54_io_rdData),
    .io_readAddr(DualPortedMem_54_io_readAddr),
    .io_writeAddr(DualPortedMem_54_io_writeAddr),
    .io_wrEna(DualPortedMem_54_io_wrEna),
    .io_rdEna(DualPortedMem_54_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_55 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_55_clock),
    .reset(DualPortedMem_55_reset),
    .io_wrData(DualPortedMem_55_io_wrData),
    .io_rdData(DualPortedMem_55_io_rdData),
    .io_readAddr(DualPortedMem_55_io_readAddr),
    .io_writeAddr(DualPortedMem_55_io_writeAddr),
    .io_wrEna(DualPortedMem_55_io_wrEna),
    .io_rdEna(DualPortedMem_55_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_56 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_56_clock),
    .reset(DualPortedMem_56_reset),
    .io_wrData(DualPortedMem_56_io_wrData),
    .io_rdData(DualPortedMem_56_io_rdData),
    .io_readAddr(DualPortedMem_56_io_readAddr),
    .io_writeAddr(DualPortedMem_56_io_writeAddr),
    .io_wrEna(DualPortedMem_56_io_wrEna),
    .io_rdEna(DualPortedMem_56_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_57 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_57_clock),
    .reset(DualPortedMem_57_reset),
    .io_wrData(DualPortedMem_57_io_wrData),
    .io_rdData(DualPortedMem_57_io_rdData),
    .io_readAddr(DualPortedMem_57_io_readAddr),
    .io_writeAddr(DualPortedMem_57_io_writeAddr),
    .io_wrEna(DualPortedMem_57_io_wrEna),
    .io_rdEna(DualPortedMem_57_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_58 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_58_clock),
    .reset(DualPortedMem_58_reset),
    .io_wrData(DualPortedMem_58_io_wrData),
    .io_rdData(DualPortedMem_58_io_rdData),
    .io_readAddr(DualPortedMem_58_io_readAddr),
    .io_writeAddr(DualPortedMem_58_io_writeAddr),
    .io_wrEna(DualPortedMem_58_io_wrEna),
    .io_rdEna(DualPortedMem_58_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_59 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_59_clock),
    .reset(DualPortedMem_59_reset),
    .io_wrData(DualPortedMem_59_io_wrData),
    .io_rdData(DualPortedMem_59_io_rdData),
    .io_readAddr(DualPortedMem_59_io_readAddr),
    .io_writeAddr(DualPortedMem_59_io_writeAddr),
    .io_wrEna(DualPortedMem_59_io_wrEna),
    .io_rdEna(DualPortedMem_59_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_60 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_60_clock),
    .reset(DualPortedMem_60_reset),
    .io_wrData(DualPortedMem_60_io_wrData),
    .io_rdData(DualPortedMem_60_io_rdData),
    .io_readAddr(DualPortedMem_60_io_readAddr),
    .io_writeAddr(DualPortedMem_60_io_writeAddr),
    .io_wrEna(DualPortedMem_60_io_wrEna),
    .io_rdEna(DualPortedMem_60_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_61 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_61_clock),
    .reset(DualPortedMem_61_reset),
    .io_wrData(DualPortedMem_61_io_wrData),
    .io_rdData(DualPortedMem_61_io_rdData),
    .io_readAddr(DualPortedMem_61_io_readAddr),
    .io_writeAddr(DualPortedMem_61_io_writeAddr),
    .io_wrEna(DualPortedMem_61_io_wrEna),
    .io_rdEna(DualPortedMem_61_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_62 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_62_clock),
    .reset(DualPortedMem_62_reset),
    .io_wrData(DualPortedMem_62_io_wrData),
    .io_rdData(DualPortedMem_62_io_rdData),
    .io_readAddr(DualPortedMem_62_io_readAddr),
    .io_writeAddr(DualPortedMem_62_io_writeAddr),
    .io_wrEna(DualPortedMem_62_io_wrEna),
    .io_rdEna(DualPortedMem_62_io_rdEna)
  );
  DualPortedMem_32 DualPortedMem_63 ( // @[SRAM.scala 43:79]
    .clock(DualPortedMem_63_clock),
    .reset(DualPortedMem_63_reset),
    .io_wrData(DualPortedMem_63_io_wrData),
    .io_rdData(DualPortedMem_63_io_rdData),
    .io_readAddr(DualPortedMem_63_io_readAddr),
    .io_writeAddr(DualPortedMem_63_io_writeAddr),
    .io_wrEna(DualPortedMem_63_io_wrEna),
    .io_rdEna(DualPortedMem_63_io_rdEna)
  );
  ActivationBlock activationBlock ( // @[ActivationBlock.scala 66:70]
    .io_activationFunc(activationBlock_io_activationFunc),
    .io_weightedSum_0(activationBlock_io_weightedSum_0),
    .io_weightedSum_1(activationBlock_io_weightedSum_1),
    .io_weightedSum_2(activationBlock_io_weightedSum_2),
    .io_weightedSum_3(activationBlock_io_weightedSum_3),
    .io_weightedSum_4(activationBlock_io_weightedSum_4),
    .io_weightedSum_5(activationBlock_io_weightedSum_5),
    .io_weightedSum_6(activationBlock_io_weightedSum_6),
    .io_weightedSum_7(activationBlock_io_weightedSum_7),
    .io_weightedSum_8(activationBlock_io_weightedSum_8),
    .io_weightedSum_9(activationBlock_io_weightedSum_9),
    .io_weightedSum_10(activationBlock_io_weightedSum_10),
    .io_weightedSum_11(activationBlock_io_weightedSum_11),
    .io_weightedSum_12(activationBlock_io_weightedSum_12),
    .io_weightedSum_13(activationBlock_io_weightedSum_13),
    .io_weightedSum_14(activationBlock_io_weightedSum_14),
    .io_weightedSum_15(activationBlock_io_weightedSum_15),
    .io_weightedSum_16(activationBlock_io_weightedSum_16),
    .io_weightedSum_17(activationBlock_io_weightedSum_17),
    .io_weightedSum_18(activationBlock_io_weightedSum_18),
    .io_weightedSum_19(activationBlock_io_weightedSum_19),
    .io_weightedSum_20(activationBlock_io_weightedSum_20),
    .io_weightedSum_21(activationBlock_io_weightedSum_21),
    .io_weightedSum_22(activationBlock_io_weightedSum_22),
    .io_weightedSum_23(activationBlock_io_weightedSum_23),
    .io_weightedSum_24(activationBlock_io_weightedSum_24),
    .io_weightedSum_25(activationBlock_io_weightedSum_25),
    .io_weightedSum_26(activationBlock_io_weightedSum_26),
    .io_weightedSum_27(activationBlock_io_weightedSum_27),
    .io_weightedSum_28(activationBlock_io_weightedSum_28),
    .io_weightedSum_29(activationBlock_io_weightedSum_29),
    .io_weightedSum_30(activationBlock_io_weightedSum_30),
    .io_weightedSum_31(activationBlock_io_weightedSum_31),
    .io_activation_0(activationBlock_io_activation_0),
    .io_activation_1(activationBlock_io_activation_1),
    .io_activation_2(activationBlock_io_activation_2),
    .io_activation_3(activationBlock_io_activation_3),
    .io_activation_4(activationBlock_io_activation_4),
    .io_activation_5(activationBlock_io_activation_5),
    .io_activation_6(activationBlock_io_activation_6),
    .io_activation_7(activationBlock_io_activation_7),
    .io_activation_8(activationBlock_io_activation_8),
    .io_activation_9(activationBlock_io_activation_9),
    .io_activation_10(activationBlock_io_activation_10),
    .io_activation_11(activationBlock_io_activation_11),
    .io_activation_12(activationBlock_io_activation_12),
    .io_activation_13(activationBlock_io_activation_13),
    .io_activation_14(activationBlock_io_activation_14),
    .io_activation_15(activationBlock_io_activation_15),
    .io_activation_16(activationBlock_io_activation_16),
    .io_activation_17(activationBlock_io_activation_17),
    .io_activation_18(activationBlock_io_activation_18),
    .io_activation_19(activationBlock_io_activation_19),
    .io_activation_20(activationBlock_io_activation_20),
    .io_activation_21(activationBlock_io_activation_21),
    .io_activation_22(activationBlock_io_activation_22),
    .io_activation_23(activationBlock_io_activation_23),
    .io_activation_24(activationBlock_io_activation_24),
    .io_activation_25(activationBlock_io_activation_25),
    .io_activation_26(activationBlock_io_activation_26),
    .io_activation_27(activationBlock_io_activation_27),
    .io_activation_28(activationBlock_io_activation_28),
    .io_activation_29(activationBlock_io_activation_29),
    .io_activation_30(activationBlock_io_activation_30),
    .io_activation_31(activationBlock_io_activation_31),
    .io_ena(activationBlock_io_ena)
  );
  OneHotEncoder oneHotDecoder ( // @[utils.scala 95:51]
    .io_memRow(oneHotDecoder_io_memRow),
    .io_enable(oneHotDecoder_io_enable),
    .io_writeSignal_0(oneHotDecoder_io_writeSignal_0),
    .io_writeSignal_1(oneHotDecoder_io_writeSignal_1),
    .io_writeSignal_2(oneHotDecoder_io_writeSignal_2),
    .io_writeSignal_3(oneHotDecoder_io_writeSignal_3),
    .io_writeSignal_4(oneHotDecoder_io_writeSignal_4),
    .io_writeSignal_5(oneHotDecoder_io_writeSignal_5),
    .io_writeSignal_6(oneHotDecoder_io_writeSignal_6),
    .io_writeSignal_7(oneHotDecoder_io_writeSignal_7),
    .io_writeSignal_8(oneHotDecoder_io_writeSignal_8),
    .io_writeSignal_9(oneHotDecoder_io_writeSignal_9),
    .io_writeSignal_10(oneHotDecoder_io_writeSignal_10),
    .io_writeSignal_11(oneHotDecoder_io_writeSignal_11),
    .io_writeSignal_12(oneHotDecoder_io_writeSignal_12),
    .io_writeSignal_13(oneHotDecoder_io_writeSignal_13),
    .io_writeSignal_14(oneHotDecoder_io_writeSignal_14),
    .io_writeSignal_15(oneHotDecoder_io_writeSignal_15),
    .io_writeSignal_16(oneHotDecoder_io_writeSignal_16),
    .io_writeSignal_17(oneHotDecoder_io_writeSignal_17),
    .io_writeSignal_18(oneHotDecoder_io_writeSignal_18),
    .io_writeSignal_19(oneHotDecoder_io_writeSignal_19),
    .io_writeSignal_20(oneHotDecoder_io_writeSignal_20),
    .io_writeSignal_21(oneHotDecoder_io_writeSignal_21),
    .io_writeSignal_22(oneHotDecoder_io_writeSignal_22),
    .io_writeSignal_23(oneHotDecoder_io_writeSignal_23),
    .io_writeSignal_24(oneHotDecoder_io_writeSignal_24),
    .io_writeSignal_25(oneHotDecoder_io_writeSignal_25),
    .io_writeSignal_26(oneHotDecoder_io_writeSignal_26),
    .io_writeSignal_27(oneHotDecoder_io_writeSignal_27),
    .io_writeSignal_28(oneHotDecoder_io_writeSignal_28),
    .io_writeSignal_29(oneHotDecoder_io_writeSignal_29),
    .io_writeSignal_30(oneHotDecoder_io_writeSignal_30),
    .io_writeSignal_31(oneHotDecoder_io_writeSignal_31)
  );
  EnableSignalDecoder memReadDecoder ( // @[utils.scala 70:53]
    .io_activatedSignals_0(memReadDecoder_io_activatedSignals_0),
    .io_activatedSignals_1(memReadDecoder_io_activatedSignals_1),
    .io_activatedSignals_2(memReadDecoder_io_activatedSignals_2),
    .io_activatedSignals_3(memReadDecoder_io_activatedSignals_3),
    .io_activatedSignals_4(memReadDecoder_io_activatedSignals_4),
    .io_activatedSignals_5(memReadDecoder_io_activatedSignals_5),
    .io_activatedSignals_6(memReadDecoder_io_activatedSignals_6),
    .io_activatedSignals_7(memReadDecoder_io_activatedSignals_7),
    .io_activatedSignals_8(memReadDecoder_io_activatedSignals_8),
    .io_activatedSignals_9(memReadDecoder_io_activatedSignals_9),
    .io_activatedSignals_10(memReadDecoder_io_activatedSignals_10),
    .io_activatedSignals_11(memReadDecoder_io_activatedSignals_11),
    .io_activatedSignals_12(memReadDecoder_io_activatedSignals_12),
    .io_activatedSignals_13(memReadDecoder_io_activatedSignals_13),
    .io_activatedSignals_14(memReadDecoder_io_activatedSignals_14),
    .io_activatedSignals_15(memReadDecoder_io_activatedSignals_15),
    .io_activatedSignals_16(memReadDecoder_io_activatedSignals_16),
    .io_activatedSignals_17(memReadDecoder_io_activatedSignals_17),
    .io_activatedSignals_18(memReadDecoder_io_activatedSignals_18),
    .io_activatedSignals_19(memReadDecoder_io_activatedSignals_19),
    .io_activatedSignals_20(memReadDecoder_io_activatedSignals_20),
    .io_activatedSignals_21(memReadDecoder_io_activatedSignals_21),
    .io_activatedSignals_22(memReadDecoder_io_activatedSignals_22),
    .io_activatedSignals_23(memReadDecoder_io_activatedSignals_23),
    .io_activatedSignals_24(memReadDecoder_io_activatedSignals_24),
    .io_activatedSignals_25(memReadDecoder_io_activatedSignals_25),
    .io_activatedSignals_26(memReadDecoder_io_activatedSignals_26),
    .io_activatedSignals_27(memReadDecoder_io_activatedSignals_27),
    .io_activatedSignals_28(memReadDecoder_io_activatedSignals_28),
    .io_activatedSignals_29(memReadDecoder_io_activatedSignals_29),
    .io_activatedSignals_30(memReadDecoder_io_activatedSignals_30),
    .io_activatedSignals_31(memReadDecoder_io_activatedSignals_31),
    .io_PEs(memReadDecoder_io_PEs),
    .io_enable(memReadDecoder_io_enable)
  );
  AdderTree adderTree ( // @[AdderTree.scala 40:58]
    .clock(adderTree_clock),
    .io_in_0(adderTree_io_in_0),
    .io_in_1(adderTree_io_in_1),
    .io_in_2(adderTree_io_in_2),
    .io_in_3(adderTree_io_in_3),
    .io_in_4(adderTree_io_in_4),
    .io_in_5(adderTree_io_in_5),
    .io_in_6(adderTree_io_in_6),
    .io_in_7(adderTree_io_in_7),
    .io_in_8(adderTree_io_in_8),
    .io_in_9(adderTree_io_in_9),
    .io_in_10(adderTree_io_in_10),
    .io_in_11(adderTree_io_in_11),
    .io_in_12(adderTree_io_in_12),
    .io_in_13(adderTree_io_in_13),
    .io_in_14(adderTree_io_in_14),
    .io_in_15(adderTree_io_in_15),
    .io_in_16(adderTree_io_in_16),
    .io_in_17(adderTree_io_in_17),
    .io_in_18(adderTree_io_in_18),
    .io_in_19(adderTree_io_in_19),
    .io_in_20(adderTree_io_in_20),
    .io_in_21(adderTree_io_in_21),
    .io_in_22(adderTree_io_in_22),
    .io_in_23(adderTree_io_in_23),
    .io_in_24(adderTree_io_in_24),
    .io_in_25(adderTree_io_in_25),
    .io_in_26(adderTree_io_in_26),
    .io_in_27(adderTree_io_in_27),
    .io_in_28(adderTree_io_in_28),
    .io_in_29(adderTree_io_in_29),
    .io_in_30(adderTree_io_in_30),
    .io_in_31(adderTree_io_in_31),
    .io_sum(adderTree_io_sum),
    .io_sumValid(adderTree_io_sumValid),
    .io_cal(adderTree_io_cal)
  );
  Max4 actionBlock ( // @[ProcessingCore.scala 54:31]
    .io_in_0(actionBlock_io_in_0),
    .io_in_1(actionBlock_io_in_1),
    .io_in_2(actionBlock_io_in_2),
    .io_in_3(actionBlock_io_in_3),
    .io_index(actionBlock_io_index)
  );
  DelayBoolNCycles rdDataMatrixValid ( // @[utils.scala 111:53]
    .clock(rdDataMatrixValid_clock),
    .io_signal2delay(rdDataMatrixValid_io_signal2delay),
    .io_delayedSignal(rdDataMatrixValid_io_delayedSignal)
  );
  DelayBoolNCycles rdDataVecValid ( // @[utils.scala 111:53]
    .clock(rdDataVecValid_clock),
    .io_signal2delay(rdDataVecValid_io_signal2delay),
    .io_delayedSignal(rdDataVecValid_io_delayedSignal)
  );
  assign io_ready = Controller == 2'h3 ? _GEN_1635 : _T; // @[ProcessingCore.scala 207:33]
  assign io_jumpIP = Controller == 2'h3 & _GEN_1937; // @[ProcessingCore.scala 207:33]
  assign io_IPAddress = Controller == 2'h3 ? _GEN_1938 : 10'h0; // @[ProcessingCore.scala 207:33]
  assign io_increaseIP = _T ? 1'h0 : _GEN_74; // @[Conditional.scala 40:58]
  assign io_action = actionBlock_io_index; // @[ProcessingCore.scala 358:18]
  assign io_actionValid = rdDataVecValid_io_delayedSignal; // @[ProcessingCore.scala 359:18]
  assign DualPortedMem_clock = clock;
  assign DualPortedMem_reset = reset;
  assign DualPortedMem_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_io_wrEna = Controller == 2'h3 & _GEN_1640; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_io_rdEna = Controller == 2'h3 ? _GEN_1872 : _GEN_2143; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_1_clock = clock;
  assign DualPortedMem_1_reset = reset;
  assign DualPortedMem_1_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_1_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_1_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_1_io_wrEna = Controller == 2'h3 & _GEN_1641; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_1_io_rdEna = Controller == 2'h3 ? _GEN_1874 : _GEN_2144; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_2_clock = clock;
  assign DualPortedMem_2_reset = reset;
  assign DualPortedMem_2_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_2_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_2_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_2_io_wrEna = Controller == 2'h3 & _GEN_1642; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_2_io_rdEna = Controller == 2'h3 ? _GEN_1876 : _GEN_2145; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_3_clock = clock;
  assign DualPortedMem_3_reset = reset;
  assign DualPortedMem_3_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_3_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_3_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_3_io_wrEna = Controller == 2'h3 & _GEN_1643; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_3_io_rdEna = Controller == 2'h3 ? _GEN_1878 : _GEN_2146; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_4_clock = clock;
  assign DualPortedMem_4_reset = reset;
  assign DualPortedMem_4_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_4_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_4_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_4_io_wrEna = Controller == 2'h3 & _GEN_1644; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_4_io_rdEna = Controller == 2'h3 ? _GEN_1880 : _GEN_2147; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_5_clock = clock;
  assign DualPortedMem_5_reset = reset;
  assign DualPortedMem_5_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_5_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_5_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_5_io_wrEna = Controller == 2'h3 & _GEN_1645; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_5_io_rdEna = Controller == 2'h3 ? _GEN_1882 : _GEN_2148; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_6_clock = clock;
  assign DualPortedMem_6_reset = reset;
  assign DualPortedMem_6_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_6_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_6_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_6_io_wrEna = Controller == 2'h3 & _GEN_1646; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_6_io_rdEna = Controller == 2'h3 ? _GEN_1884 : _GEN_2149; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_7_clock = clock;
  assign DualPortedMem_7_reset = reset;
  assign DualPortedMem_7_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_7_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_7_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_7_io_wrEna = Controller == 2'h3 & _GEN_1647; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_7_io_rdEna = Controller == 2'h3 ? _GEN_1886 : _GEN_2150; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_8_clock = clock;
  assign DualPortedMem_8_reset = reset;
  assign DualPortedMem_8_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_8_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_8_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_8_io_wrEna = Controller == 2'h3 & _GEN_1648; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_8_io_rdEna = Controller == 2'h3 ? _GEN_1888 : _GEN_2151; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_9_clock = clock;
  assign DualPortedMem_9_reset = reset;
  assign DualPortedMem_9_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_9_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_9_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_9_io_wrEna = Controller == 2'h3 & _GEN_1649; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_9_io_rdEna = Controller == 2'h3 ? _GEN_1890 : _GEN_2152; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_10_clock = clock;
  assign DualPortedMem_10_reset = reset;
  assign DualPortedMem_10_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_10_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_10_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_10_io_wrEna = Controller == 2'h3 & _GEN_1650; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_10_io_rdEna = Controller == 2'h3 ? _GEN_1892 : _GEN_2153; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_11_clock = clock;
  assign DualPortedMem_11_reset = reset;
  assign DualPortedMem_11_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_11_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_11_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_11_io_wrEna = Controller == 2'h3 & _GEN_1651; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_11_io_rdEna = Controller == 2'h3 ? _GEN_1894 : _GEN_2154; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_12_clock = clock;
  assign DualPortedMem_12_reset = reset;
  assign DualPortedMem_12_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_12_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_12_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_12_io_wrEna = Controller == 2'h3 & _GEN_1652; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_12_io_rdEna = Controller == 2'h3 ? _GEN_1896 : _GEN_2155; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_13_clock = clock;
  assign DualPortedMem_13_reset = reset;
  assign DualPortedMem_13_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_13_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_13_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_13_io_wrEna = Controller == 2'h3 & _GEN_1653; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_13_io_rdEna = Controller == 2'h3 ? _GEN_1898 : _GEN_2156; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_14_clock = clock;
  assign DualPortedMem_14_reset = reset;
  assign DualPortedMem_14_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_14_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_14_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_14_io_wrEna = Controller == 2'h3 & _GEN_1654; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_14_io_rdEna = Controller == 2'h3 ? _GEN_1900 : _GEN_2157; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_15_clock = clock;
  assign DualPortedMem_15_reset = reset;
  assign DualPortedMem_15_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_15_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_15_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_15_io_wrEna = Controller == 2'h3 & _GEN_1655; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_15_io_rdEna = Controller == 2'h3 ? _GEN_1902 : _GEN_2158; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_16_clock = clock;
  assign DualPortedMem_16_reset = reset;
  assign DualPortedMem_16_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_16_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_16_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_16_io_wrEna = Controller == 2'h3 & _GEN_1656; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_16_io_rdEna = Controller == 2'h3 ? _GEN_1904 : _GEN_2159; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_17_clock = clock;
  assign DualPortedMem_17_reset = reset;
  assign DualPortedMem_17_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_17_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_17_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_17_io_wrEna = Controller == 2'h3 & _GEN_1657; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_17_io_rdEna = Controller == 2'h3 ? _GEN_1906 : _GEN_2160; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_18_clock = clock;
  assign DualPortedMem_18_reset = reset;
  assign DualPortedMem_18_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_18_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_18_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_18_io_wrEna = Controller == 2'h3 & _GEN_1658; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_18_io_rdEna = Controller == 2'h3 ? _GEN_1908 : _GEN_2161; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_19_clock = clock;
  assign DualPortedMem_19_reset = reset;
  assign DualPortedMem_19_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_19_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_19_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_19_io_wrEna = Controller == 2'h3 & _GEN_1659; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_19_io_rdEna = Controller == 2'h3 ? _GEN_1910 : _GEN_2162; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_20_clock = clock;
  assign DualPortedMem_20_reset = reset;
  assign DualPortedMem_20_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_20_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_20_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_20_io_wrEna = Controller == 2'h3 & _GEN_1660; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_20_io_rdEna = Controller == 2'h3 ? _GEN_1912 : _GEN_2163; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_21_clock = clock;
  assign DualPortedMem_21_reset = reset;
  assign DualPortedMem_21_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_21_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_21_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_21_io_wrEna = Controller == 2'h3 & _GEN_1661; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_21_io_rdEna = Controller == 2'h3 ? _GEN_1914 : _GEN_2164; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_22_clock = clock;
  assign DualPortedMem_22_reset = reset;
  assign DualPortedMem_22_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_22_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_22_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_22_io_wrEna = Controller == 2'h3 & _GEN_1662; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_22_io_rdEna = Controller == 2'h3 ? _GEN_1916 : _GEN_2165; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_23_clock = clock;
  assign DualPortedMem_23_reset = reset;
  assign DualPortedMem_23_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_23_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_23_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_23_io_wrEna = Controller == 2'h3 & _GEN_1663; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_23_io_rdEna = Controller == 2'h3 ? _GEN_1918 : _GEN_2166; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_24_clock = clock;
  assign DualPortedMem_24_reset = reset;
  assign DualPortedMem_24_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_24_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_24_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_24_io_wrEna = Controller == 2'h3 & _GEN_1664; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_24_io_rdEna = Controller == 2'h3 ? _GEN_1920 : _GEN_2167; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_25_clock = clock;
  assign DualPortedMem_25_reset = reset;
  assign DualPortedMem_25_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_25_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_25_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_25_io_wrEna = Controller == 2'h3 & _GEN_1665; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_25_io_rdEna = Controller == 2'h3 ? _GEN_1922 : _GEN_2168; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_26_clock = clock;
  assign DualPortedMem_26_reset = reset;
  assign DualPortedMem_26_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_26_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_26_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_26_io_wrEna = Controller == 2'h3 & _GEN_1666; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_26_io_rdEna = Controller == 2'h3 ? _GEN_1924 : _GEN_2169; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_27_clock = clock;
  assign DualPortedMem_27_reset = reset;
  assign DualPortedMem_27_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_27_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_27_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_27_io_wrEna = Controller == 2'h3 & _GEN_1667; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_27_io_rdEna = Controller == 2'h3 ? _GEN_1926 : _GEN_2170; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_28_clock = clock;
  assign DualPortedMem_28_reset = reset;
  assign DualPortedMem_28_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_28_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_28_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_28_io_wrEna = Controller == 2'h3 & _GEN_1668; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_28_io_rdEna = Controller == 2'h3 ? _GEN_1928 : _GEN_2171; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_29_clock = clock;
  assign DualPortedMem_29_reset = reset;
  assign DualPortedMem_29_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_29_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_29_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_29_io_wrEna = Controller == 2'h3 & _GEN_1669; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_29_io_rdEna = Controller == 2'h3 ? _GEN_1930 : _GEN_2172; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_30_clock = clock;
  assign DualPortedMem_30_reset = reset;
  assign DualPortedMem_30_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_30_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_30_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_30_io_wrEna = Controller == 2'h3 & _GEN_1670; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_30_io_rdEna = Controller == 2'h3 ? _GEN_1932 : _GEN_2173; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_31_clock = clock;
  assign DualPortedMem_31_reset = reset;
  assign DualPortedMem_31_io_wrData = _GEN_1945[7:0]; // @[ProcessingCore.scala 96:34]
  assign DualPortedMem_31_io_readAddr = _GEN_2177[5:0];
  assign DualPortedMem_31_io_writeAddr = _GEN_1944[5:0]; // @[ProcessingCore.scala 97:34]
  assign DualPortedMem_31_io_wrEna = Controller == 2'h3 & _GEN_1671; // @[ProcessingCore.scala 207:33]
  assign DualPortedMem_31_io_rdEna = Controller == 2'h3 ? _GEN_1934 : _GEN_2174; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 99:34]
  assign DualPortedMem_32_clock = clock;
  assign DualPortedMem_32_reset = reset;
  assign DualPortedMem_32_io_wrData = _GEN_1982[7:0];
  assign DualPortedMem_32_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_32_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_32_io_wrEna = Controller == 2'h3 & _GEN_1674; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_32_io_rdEna = Controller == 2'h3 & _GEN_1770; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_33_clock = clock;
  assign DualPortedMem_33_reset = reset;
  assign DualPortedMem_33_io_wrData = _GEN_1985[7:0];
  assign DualPortedMem_33_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_33_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_33_io_wrEna = Controller == 2'h3 & _GEN_1677; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_33_io_rdEna = Controller == 2'h3 & _GEN_1772; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_34_clock = clock;
  assign DualPortedMem_34_reset = reset;
  assign DualPortedMem_34_io_wrData = _GEN_1988[7:0];
  assign DualPortedMem_34_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_34_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_34_io_wrEna = Controller == 2'h3 & _GEN_1680; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_34_io_rdEna = Controller == 2'h3 & _GEN_1774; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_35_clock = clock;
  assign DualPortedMem_35_reset = reset;
  assign DualPortedMem_35_io_wrData = _GEN_1991[7:0];
  assign DualPortedMem_35_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_35_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_35_io_wrEna = Controller == 2'h3 & _GEN_1683; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_35_io_rdEna = Controller == 2'h3 & _GEN_1776; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_36_clock = clock;
  assign DualPortedMem_36_reset = reset;
  assign DualPortedMem_36_io_wrData = _GEN_1994[7:0];
  assign DualPortedMem_36_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_36_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_36_io_wrEna = Controller == 2'h3 & _GEN_1686; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_36_io_rdEna = Controller == 2'h3 & _GEN_1778; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_37_clock = clock;
  assign DualPortedMem_37_reset = reset;
  assign DualPortedMem_37_io_wrData = _GEN_1997[7:0];
  assign DualPortedMem_37_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_37_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_37_io_wrEna = Controller == 2'h3 & _GEN_1689; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_37_io_rdEna = Controller == 2'h3 & _GEN_1780; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_38_clock = clock;
  assign DualPortedMem_38_reset = reset;
  assign DualPortedMem_38_io_wrData = _GEN_2000[7:0];
  assign DualPortedMem_38_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_38_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_38_io_wrEna = Controller == 2'h3 & _GEN_1692; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_38_io_rdEna = Controller == 2'h3 & _GEN_1782; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_39_clock = clock;
  assign DualPortedMem_39_reset = reset;
  assign DualPortedMem_39_io_wrData = _GEN_2003[7:0];
  assign DualPortedMem_39_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_39_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_39_io_wrEna = Controller == 2'h3 & _GEN_1695; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_39_io_rdEna = Controller == 2'h3 & _GEN_1784; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_40_clock = clock;
  assign DualPortedMem_40_reset = reset;
  assign DualPortedMem_40_io_wrData = _GEN_2006[7:0];
  assign DualPortedMem_40_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_40_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_40_io_wrEna = Controller == 2'h3 & _GEN_1698; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_40_io_rdEna = Controller == 2'h3 & _GEN_1786; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_41_clock = clock;
  assign DualPortedMem_41_reset = reset;
  assign DualPortedMem_41_io_wrData = _GEN_2009[7:0];
  assign DualPortedMem_41_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_41_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_41_io_wrEna = Controller == 2'h3 & _GEN_1701; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_41_io_rdEna = Controller == 2'h3 & _GEN_1788; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_42_clock = clock;
  assign DualPortedMem_42_reset = reset;
  assign DualPortedMem_42_io_wrData = _GEN_2012[7:0];
  assign DualPortedMem_42_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_42_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_42_io_wrEna = Controller == 2'h3 & _GEN_1704; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_42_io_rdEna = Controller == 2'h3 & _GEN_1790; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_43_clock = clock;
  assign DualPortedMem_43_reset = reset;
  assign DualPortedMem_43_io_wrData = _GEN_2015[7:0];
  assign DualPortedMem_43_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_43_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_43_io_wrEna = Controller == 2'h3 & _GEN_1707; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_43_io_rdEna = Controller == 2'h3 & _GEN_1792; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_44_clock = clock;
  assign DualPortedMem_44_reset = reset;
  assign DualPortedMem_44_io_wrData = _GEN_2018[7:0];
  assign DualPortedMem_44_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_44_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_44_io_wrEna = Controller == 2'h3 & _GEN_1710; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_44_io_rdEna = Controller == 2'h3 & _GEN_1794; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_45_clock = clock;
  assign DualPortedMem_45_reset = reset;
  assign DualPortedMem_45_io_wrData = _GEN_2021[7:0];
  assign DualPortedMem_45_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_45_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_45_io_wrEna = Controller == 2'h3 & _GEN_1713; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_45_io_rdEna = Controller == 2'h3 & _GEN_1796; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_46_clock = clock;
  assign DualPortedMem_46_reset = reset;
  assign DualPortedMem_46_io_wrData = _GEN_2024[7:0];
  assign DualPortedMem_46_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_46_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_46_io_wrEna = Controller == 2'h3 & _GEN_1716; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_46_io_rdEna = Controller == 2'h3 & _GEN_1798; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_47_clock = clock;
  assign DualPortedMem_47_reset = reset;
  assign DualPortedMem_47_io_wrData = _GEN_2027[7:0];
  assign DualPortedMem_47_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_47_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_47_io_wrEna = Controller == 2'h3 & _GEN_1719; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_47_io_rdEna = Controller == 2'h3 & _GEN_1800; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_48_clock = clock;
  assign DualPortedMem_48_reset = reset;
  assign DualPortedMem_48_io_wrData = _GEN_2030[7:0];
  assign DualPortedMem_48_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_48_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_48_io_wrEna = Controller == 2'h3 & _GEN_1722; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_48_io_rdEna = Controller == 2'h3 & _GEN_1802; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_49_clock = clock;
  assign DualPortedMem_49_reset = reset;
  assign DualPortedMem_49_io_wrData = _GEN_2033[7:0];
  assign DualPortedMem_49_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_49_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_49_io_wrEna = Controller == 2'h3 & _GEN_1725; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_49_io_rdEna = Controller == 2'h3 & _GEN_1804; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_50_clock = clock;
  assign DualPortedMem_50_reset = reset;
  assign DualPortedMem_50_io_wrData = _GEN_2036[7:0];
  assign DualPortedMem_50_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_50_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_50_io_wrEna = Controller == 2'h3 & _GEN_1728; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_50_io_rdEna = Controller == 2'h3 & _GEN_1806; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_51_clock = clock;
  assign DualPortedMem_51_reset = reset;
  assign DualPortedMem_51_io_wrData = _GEN_2039[7:0];
  assign DualPortedMem_51_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_51_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_51_io_wrEna = Controller == 2'h3 & _GEN_1731; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_51_io_rdEna = Controller == 2'h3 & _GEN_1808; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_52_clock = clock;
  assign DualPortedMem_52_reset = reset;
  assign DualPortedMem_52_io_wrData = _GEN_2042[7:0];
  assign DualPortedMem_52_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_52_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_52_io_wrEna = Controller == 2'h3 & _GEN_1734; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_52_io_rdEna = Controller == 2'h3 & _GEN_1810; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_53_clock = clock;
  assign DualPortedMem_53_reset = reset;
  assign DualPortedMem_53_io_wrData = _GEN_2045[7:0];
  assign DualPortedMem_53_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_53_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_53_io_wrEna = Controller == 2'h3 & _GEN_1737; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_53_io_rdEna = Controller == 2'h3 & _GEN_1812; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_54_clock = clock;
  assign DualPortedMem_54_reset = reset;
  assign DualPortedMem_54_io_wrData = _GEN_2048[7:0];
  assign DualPortedMem_54_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_54_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_54_io_wrEna = Controller == 2'h3 & _GEN_1740; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_54_io_rdEna = Controller == 2'h3 & _GEN_1814; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_55_clock = clock;
  assign DualPortedMem_55_reset = reset;
  assign DualPortedMem_55_io_wrData = _GEN_2051[7:0];
  assign DualPortedMem_55_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_55_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_55_io_wrEna = Controller == 2'h3 & _GEN_1743; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_55_io_rdEna = Controller == 2'h3 & _GEN_1816; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_56_clock = clock;
  assign DualPortedMem_56_reset = reset;
  assign DualPortedMem_56_io_wrData = _GEN_2054[7:0];
  assign DualPortedMem_56_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_56_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_56_io_wrEna = Controller == 2'h3 & _GEN_1746; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_56_io_rdEna = Controller == 2'h3 & _GEN_1818; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_57_clock = clock;
  assign DualPortedMem_57_reset = reset;
  assign DualPortedMem_57_io_wrData = _GEN_2057[7:0];
  assign DualPortedMem_57_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_57_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_57_io_wrEna = Controller == 2'h3 & _GEN_1749; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_57_io_rdEna = Controller == 2'h3 & _GEN_1820; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_58_clock = clock;
  assign DualPortedMem_58_reset = reset;
  assign DualPortedMem_58_io_wrData = _GEN_2060[7:0];
  assign DualPortedMem_58_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_58_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_58_io_wrEna = Controller == 2'h3 & _GEN_1752; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_58_io_rdEna = Controller == 2'h3 & _GEN_1822; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_59_clock = clock;
  assign DualPortedMem_59_reset = reset;
  assign DualPortedMem_59_io_wrData = _GEN_2063[7:0];
  assign DualPortedMem_59_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_59_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_59_io_wrEna = Controller == 2'h3 & _GEN_1755; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_59_io_rdEna = Controller == 2'h3 & _GEN_1824; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_60_clock = clock;
  assign DualPortedMem_60_reset = reset;
  assign DualPortedMem_60_io_wrData = _GEN_2066[7:0];
  assign DualPortedMem_60_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_60_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_60_io_wrEna = Controller == 2'h3 & _GEN_1758; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_60_io_rdEna = Controller == 2'h3 & _GEN_1826; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_61_clock = clock;
  assign DualPortedMem_61_reset = reset;
  assign DualPortedMem_61_io_wrData = _GEN_2069[7:0];
  assign DualPortedMem_61_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_61_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_61_io_wrEna = Controller == 2'h3 & _GEN_1761; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_61_io_rdEna = Controller == 2'h3 & _GEN_1828; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_62_clock = clock;
  assign DualPortedMem_62_reset = reset;
  assign DualPortedMem_62_io_wrData = _GEN_2072[7:0];
  assign DualPortedMem_62_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_62_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_62_io_wrEna = Controller == 2'h3 & _GEN_1764; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_62_io_rdEna = Controller == 2'h3 & _GEN_1830; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign DualPortedMem_63_clock = clock;
  assign DualPortedMem_63_reset = reset;
  assign DualPortedMem_63_io_wrData = _GEN_2075[7:0];
  assign DualPortedMem_63_io_readAddr = _GEN_2077[2:0];
  assign DualPortedMem_63_io_writeAddr = _GEN_1981[2:0];
  assign DualPortedMem_63_io_wrEna = Controller == 2'h3 & _GEN_1767; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 106:40]
  assign DualPortedMem_63_io_rdEna = Controller == 2'h3 & _GEN_1832; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 105:40]
  assign activationBlock_io_activationFunc = instructionRegister[26:25]; // @[ProcessingCore.scala 87:59]
  assign activationBlock_io_weightedSum_0 = DualPortedMem_32_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_1 = DualPortedMem_33_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_2 = DualPortedMem_34_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_3 = DualPortedMem_35_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_4 = DualPortedMem_36_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_5 = DualPortedMem_37_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_6 = DualPortedMem_38_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_7 = DualPortedMem_39_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_8 = DualPortedMem_40_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_9 = DualPortedMem_41_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_10 = DualPortedMem_42_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_11 = DualPortedMem_43_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_12 = DualPortedMem_44_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_13 = DualPortedMem_45_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_14 = DualPortedMem_46_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_15 = DualPortedMem_47_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_16 = DualPortedMem_48_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_17 = DualPortedMem_49_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_18 = DualPortedMem_50_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_19 = DualPortedMem_51_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_20 = DualPortedMem_52_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_21 = DualPortedMem_53_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_22 = DualPortedMem_54_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_23 = DualPortedMem_55_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_24 = DualPortedMem_56_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_25 = DualPortedMem_57_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_26 = DualPortedMem_58_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_27 = DualPortedMem_59_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_28 = DualPortedMem_60_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_29 = DualPortedMem_61_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_30 = DualPortedMem_62_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_weightedSum_31 = DualPortedMem_63_io_rdData; // @[ProcessingCore.scala 108:40]
  assign activationBlock_io_ena = Controller == 2'h3 & _GEN_1936; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 86:37]
  assign oneHotDecoder_io_memRow = _GEN_1943[4:0];
  assign oneHotDecoder_io_enable = Controller == 2'h3 & _GEN_1636; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 82:37]
  assign memReadDecoder_io_PEs = _GEN_1979[4:0];
  assign memReadDecoder_io_enable = Controller == 2'h3 & _GEN_1672; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 83:37]
  assign adderTree_clock = clock;
  assign adderTree_io_in_0 = mulResults_0; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_1 = mulResults_1; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_2 = mulResults_2; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_3 = mulResults_3; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_4 = mulResults_4; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_5 = mulResults_5; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_6 = mulResults_6; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_7 = mulResults_7; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_8 = mulResults_8; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_9 = mulResults_9; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_10 = mulResults_10; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_11 = mulResults_11; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_12 = mulResults_12; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_13 = mulResults_13; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_14 = mulResults_14; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_15 = mulResults_15; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_16 = mulResults_16; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_17 = mulResults_17; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_18 = mulResults_18; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_19 = mulResults_19; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_20 = mulResults_20; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_21 = mulResults_21; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_22 = mulResults_22; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_23 = mulResults_23; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_24 = mulResults_24; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_25 = mulResults_25; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_26 = mulResults_26; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_27 = mulResults_27; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_28 = mulResults_28; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_29 = mulResults_29; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_30 = mulResults_30; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_in_31 = mulResults_31; // @[ProcessingCore.scala 112:25]
  assign adderTree_io_cal = adderTree_io_cal_REG; // @[ProcessingCore.scala 90:20]
  assign actionBlock_io_in_0 = DualPortedMem_32_io_rdData; // @[ProcessingCore.scala 92:74]
  assign actionBlock_io_in_1 = DualPortedMem_33_io_rdData; // @[ProcessingCore.scala 92:74]
  assign actionBlock_io_in_2 = DualPortedMem_34_io_rdData; // @[ProcessingCore.scala 92:74]
  assign actionBlock_io_in_3 = DualPortedMem_35_io_rdData; // @[ProcessingCore.scala 92:74]
  assign rdDataMatrixValid_clock = clock;
  assign rdDataMatrixValid_io_signal2delay = Controller == 2'h3 & _GEN_1836; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 81:37]
  assign rdDataVecValid_clock = clock;
  assign rdDataVecValid_io_signal2delay = Controller == 2'h3 & _GEN_1834; // @[ProcessingCore.scala 207:33 ProcessingCore.scala 80:37]
  always @(posedge clock) begin
    if (reset) begin // @[ProcessingCore.scala 43:36]
      instructionRegister <= 32'h0; // @[ProcessingCore.scala 43:36]
    end else if (Controller == 2'h1) begin // @[ProcessingCore.scala 196:29]
      instructionRegister <= io_instruction; // @[ProcessingCore.scala 197:25]
    end
    mulResults_0 <= $signed(DualPortedMem_io_rdData) * $signed(DualPortedMem_32_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_1 <= $signed(DualPortedMem_1_io_rdData) * $signed(DualPortedMem_33_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_2 <= $signed(DualPortedMem_2_io_rdData) * $signed(DualPortedMem_34_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_3 <= $signed(DualPortedMem_3_io_rdData) * $signed(DualPortedMem_35_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_4 <= $signed(DualPortedMem_4_io_rdData) * $signed(DualPortedMem_36_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_5 <= $signed(DualPortedMem_5_io_rdData) * $signed(DualPortedMem_37_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_6 <= $signed(DualPortedMem_6_io_rdData) * $signed(DualPortedMem_38_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_7 <= $signed(DualPortedMem_7_io_rdData) * $signed(DualPortedMem_39_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_8 <= $signed(DualPortedMem_8_io_rdData) * $signed(DualPortedMem_40_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_9 <= $signed(DualPortedMem_9_io_rdData) * $signed(DualPortedMem_41_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_10 <= $signed(DualPortedMem_10_io_rdData) * $signed(DualPortedMem_42_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_11 <= $signed(DualPortedMem_11_io_rdData) * $signed(DualPortedMem_43_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_12 <= $signed(DualPortedMem_12_io_rdData) * $signed(DualPortedMem_44_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_13 <= $signed(DualPortedMem_13_io_rdData) * $signed(DualPortedMem_45_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_14 <= $signed(DualPortedMem_14_io_rdData) * $signed(DualPortedMem_46_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_15 <= $signed(DualPortedMem_15_io_rdData) * $signed(DualPortedMem_47_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_16 <= $signed(DualPortedMem_16_io_rdData) * $signed(DualPortedMem_48_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_17 <= $signed(DualPortedMem_17_io_rdData) * $signed(DualPortedMem_49_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_18 <= $signed(DualPortedMem_18_io_rdData) * $signed(DualPortedMem_50_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_19 <= $signed(DualPortedMem_19_io_rdData) * $signed(DualPortedMem_51_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_20 <= $signed(DualPortedMem_20_io_rdData) * $signed(DualPortedMem_52_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_21 <= $signed(DualPortedMem_21_io_rdData) * $signed(DualPortedMem_53_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_22 <= $signed(DualPortedMem_22_io_rdData) * $signed(DualPortedMem_54_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_23 <= $signed(DualPortedMem_23_io_rdData) * $signed(DualPortedMem_55_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_24 <= $signed(DualPortedMem_24_io_rdData) * $signed(DualPortedMem_56_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_25 <= $signed(DualPortedMem_25_io_rdData) * $signed(DualPortedMem_57_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_26 <= $signed(DualPortedMem_26_io_rdData) * $signed(DualPortedMem_58_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_27 <= $signed(DualPortedMem_27_io_rdData) * $signed(DualPortedMem_59_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_28 <= $signed(DualPortedMem_28_io_rdData) * $signed(DualPortedMem_60_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_29 <= $signed(DualPortedMem_29_io_rdData) * $signed(DualPortedMem_61_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_30 <= $signed(DualPortedMem_30_io_rdData) * $signed(DualPortedMem_62_io_rdData); // @[ProcessingCore.scala 111:54]
    mulResults_31 <= $signed(DualPortedMem_31_io_rdData) * $signed(DualPortedMem_63_io_rdData); // @[ProcessingCore.scala 111:54]
    if (reset) begin // @[ProcessingCore.scala 66:34]
      rdWrEnaFlip <= 1'h0; // @[ProcessingCore.scala 66:34]
    end else if (Controller == 2'h3) begin // @[ProcessingCore.scala 207:33]
      if (!(op == 2'h1)) begin // @[ProcessingCore.scala 209:44]
        if (op == 2'h0) begin // @[ProcessingCore.scala 278:40]
          rdWrEnaFlip <= _GEN_1422;
        end
      end
    end
    if (reset) begin // @[ProcessingCore.scala 74:33]
      colBanksCounter <= 13'h0; // @[ProcessingCore.scala 74:33]
    end else if (Controller == 2'h3) begin // @[ProcessingCore.scala 207:33]
      if (op == 2'h1) begin // @[ProcessingCore.scala 209:44]
        colBanksCounter <= _GEN_81;
      end else if (op == 2'h0) begin // @[ProcessingCore.scala 278:40]
        colBanksCounter <= _GEN_1228;
      end else begin
        colBanksCounter <= _GEN_81;
      end
    end else begin
      colBanksCounter <= _GEN_81;
    end
    if (reset) begin // @[ProcessingCore.scala 75:33]
      matrixRowCounter <= 13'h0; // @[ProcessingCore.scala 75:33]
    end else if (Controller == 2'h3) begin // @[ProcessingCore.scala 207:33]
      if (op == 2'h1) begin // @[ProcessingCore.scala 209:44]
        matrixRowCounter <= _GEN_82;
      end else if (op == 2'h0) begin // @[ProcessingCore.scala 278:40]
        matrixRowCounter <= _GEN_1223;
      end else begin
        matrixRowCounter <= _GEN_82;
      end
    end else begin
      matrixRowCounter <= _GEN_82;
    end
    if (reset) begin // @[ProcessingCore.scala 76:33]
      VinSizeReg <= 14'h0; // @[ProcessingCore.scala 76:33]
    end else if (Controller == 2'h3) begin // @[ProcessingCore.scala 207:33]
      if (op == 2'h1) begin // @[ProcessingCore.scala 209:44]
        if (_T_10) begin // @[Conditional.scala 40:58]
          VinSizeReg <= VinSize; // @[ProcessingCore.scala 213:27]
        end
      end
    end
    if (reset) begin // @[ProcessingCore.scala 77:33]
      VoutSizeReg <= 13'h0; // @[ProcessingCore.scala 77:33]
    end else if (Controller == 2'h3) begin // @[ProcessingCore.scala 207:33]
      if (op == 2'h1) begin // @[ProcessingCore.scala 209:44]
        if (_T_10) begin // @[Conditional.scala 40:58]
          VoutSizeReg <= VoutSize; // @[ProcessingCore.scala 214:27]
        end
      end
    end
    adderTree_io_cal_REG <= rdDataMatrixValid_io_delayedSignal; // @[ProcessingCore.scala 90:30]
    if (reset) begin // @[ProcessingCore.scala 161:32]
      Controller <= 2'h0; // @[ProcessingCore.scala 161:32]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_instructionValid) begin // @[ProcessingCore.scala 168:32]
        Controller <= 2'h1; // @[ProcessingCore.scala 169:25]
      end
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      Controller <= 2'h2; // @[ProcessingCore.scala 173:25]
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      Controller <= 2'h3; // @[ProcessingCore.scala 177:25]
    end else begin
      Controller <= _GEN_68;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  instructionRegister = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  mulResults_0 = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  mulResults_1 = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  mulResults_2 = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  mulResults_3 = _RAND_4[15:0];
  _RAND_5 = {1{`RANDOM}};
  mulResults_4 = _RAND_5[15:0];
  _RAND_6 = {1{`RANDOM}};
  mulResults_5 = _RAND_6[15:0];
  _RAND_7 = {1{`RANDOM}};
  mulResults_6 = _RAND_7[15:0];
  _RAND_8 = {1{`RANDOM}};
  mulResults_7 = _RAND_8[15:0];
  _RAND_9 = {1{`RANDOM}};
  mulResults_8 = _RAND_9[15:0];
  _RAND_10 = {1{`RANDOM}};
  mulResults_9 = _RAND_10[15:0];
  _RAND_11 = {1{`RANDOM}};
  mulResults_10 = _RAND_11[15:0];
  _RAND_12 = {1{`RANDOM}};
  mulResults_11 = _RAND_12[15:0];
  _RAND_13 = {1{`RANDOM}};
  mulResults_12 = _RAND_13[15:0];
  _RAND_14 = {1{`RANDOM}};
  mulResults_13 = _RAND_14[15:0];
  _RAND_15 = {1{`RANDOM}};
  mulResults_14 = _RAND_15[15:0];
  _RAND_16 = {1{`RANDOM}};
  mulResults_15 = _RAND_16[15:0];
  _RAND_17 = {1{`RANDOM}};
  mulResults_16 = _RAND_17[15:0];
  _RAND_18 = {1{`RANDOM}};
  mulResults_17 = _RAND_18[15:0];
  _RAND_19 = {1{`RANDOM}};
  mulResults_18 = _RAND_19[15:0];
  _RAND_20 = {1{`RANDOM}};
  mulResults_19 = _RAND_20[15:0];
  _RAND_21 = {1{`RANDOM}};
  mulResults_20 = _RAND_21[15:0];
  _RAND_22 = {1{`RANDOM}};
  mulResults_21 = _RAND_22[15:0];
  _RAND_23 = {1{`RANDOM}};
  mulResults_22 = _RAND_23[15:0];
  _RAND_24 = {1{`RANDOM}};
  mulResults_23 = _RAND_24[15:0];
  _RAND_25 = {1{`RANDOM}};
  mulResults_24 = _RAND_25[15:0];
  _RAND_26 = {1{`RANDOM}};
  mulResults_25 = _RAND_26[15:0];
  _RAND_27 = {1{`RANDOM}};
  mulResults_26 = _RAND_27[15:0];
  _RAND_28 = {1{`RANDOM}};
  mulResults_27 = _RAND_28[15:0];
  _RAND_29 = {1{`RANDOM}};
  mulResults_28 = _RAND_29[15:0];
  _RAND_30 = {1{`RANDOM}};
  mulResults_29 = _RAND_30[15:0];
  _RAND_31 = {1{`RANDOM}};
  mulResults_30 = _RAND_31[15:0];
  _RAND_32 = {1{`RANDOM}};
  mulResults_31 = _RAND_32[15:0];
  _RAND_33 = {1{`RANDOM}};
  rdWrEnaFlip = _RAND_33[0:0];
  _RAND_34 = {1{`RANDOM}};
  colBanksCounter = _RAND_34[12:0];
  _RAND_35 = {1{`RANDOM}};
  matrixRowCounter = _RAND_35[12:0];
  _RAND_36 = {1{`RANDOM}};
  VinSizeReg = _RAND_36[13:0];
  _RAND_37 = {1{`RANDOM}};
  VoutSizeReg = _RAND_37[12:0];
  _RAND_38 = {1{`RANDOM}};
  adderTree_io_cal_REG = _RAND_38[0:0];
  _RAND_39 = {1{`RANDOM}};
  Controller = _RAND_39[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SinglePortedRam(
  input         clock,
  input  [9:0]  io_addr,
  input  [31:0] io_dataIn,
  output [31:0] io_dataOut,
  input         io_wrEna,
  input         io_rdEna
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] mem [0:1023]; // @[SRAM.scala 35:24]
  wire [31:0] mem_io_dataOut_MPORT_data; // @[SRAM.scala 35:24]
  wire [9:0] mem_io_dataOut_MPORT_addr; // @[SRAM.scala 35:24]
  wire [31:0] mem_MPORT_data; // @[SRAM.scala 35:24]
  wire [9:0] mem_MPORT_addr; // @[SRAM.scala 35:24]
  wire  mem_MPORT_mask; // @[SRAM.scala 35:24]
  wire  mem_MPORT_en; // @[SRAM.scala 35:24]
  reg  mem_io_dataOut_MPORT_en_pipe_0;
  reg [9:0] mem_io_dataOut_MPORT_addr_pipe_0;
  assign mem_io_dataOut_MPORT_addr = mem_io_dataOut_MPORT_addr_pipe_0;
  assign mem_io_dataOut_MPORT_data = mem[mem_io_dataOut_MPORT_addr]; // @[SRAM.scala 35:24]
  assign mem_MPORT_data = io_dataIn;
  assign mem_MPORT_addr = io_addr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wrEna;
  assign io_dataOut = mem_io_dataOut_MPORT_data; // @[SRAM.scala 39:14]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[SRAM.scala 35:24]
    end
    mem_io_dataOut_MPORT_en_pipe_0 <= io_rdEna;
    if (io_rdEna) begin
      mem_io_dataOut_MPORT_addr_pipe_0 <= io_addr;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    mem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_io_dataOut_MPORT_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_io_dataOut_MPORT_addr_pipe_0 = _RAND_2[9:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Agent(
  input        clock,
  input        reset,
  input  [2:0] io_x_initial,
  input  [2:0] io_y_initial,
  input        io_loadInitalState,
  input  [2:0] io_mazeSize,
  input  [1:0] io_action,
  input        io_actionValid,
  input  [2:0] io_reward,
  output [5:0] io_state,
  output       io_observe,
  output       io_terminate,
  output       io_newStateFound
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] mazeSize; // @[Agent.scala 19:26]
  reg [2:0] x; // @[Agent.scala 20:26]
  reg [2:0] y; // @[Agent.scala 21:26]
  wire [2:0] _GEN_0 = io_loadInitalState ? io_x_initial : x; // @[Agent.scala 24:27 Agent.scala 25:15 Agent.scala 20:26]
  wire [2:0] _GEN_1 = io_loadInitalState ? io_y_initial : y; // @[Agent.scala 24:27 Agent.scala 26:15 Agent.scala 21:26]
  wire [2:0] _x_T_1 = x + 3'h1; // @[Agent.scala 33:14]
  wire [2:0] _y_T_1 = y - 3'h1; // @[Agent.scala 35:14]
  wire [2:0] _x_T_3 = x - 3'h1; // @[Agent.scala 37:14]
  wire [2:0] _y_T_3 = y + 3'h1; // @[Agent.scala 39:14]
  wire [2:0] _GEN_3 = io_action == 2'h2 ? _x_T_3 : _GEN_0; // @[Agent.scala 36:34 Agent.scala 37:9]
  wire [2:0] _GEN_4 = io_action == 2'h2 ? _GEN_1 : _y_T_3; // @[Agent.scala 36:34 Agent.scala 39:9]
  reg  io_observe_REG; // @[Agent.scala 50:24]
  wire [5:0] _io_state_T = y * mazeSize; // @[Agent.scala 51:24]
  wire [5:0] _GEN_13 = {{3'd0}, x}; // @[Agent.scala 51:21]
  reg  io_newStateFound_REG; // @[Agent.scala 52:30]
  assign io_state = _GEN_13 + _io_state_T; // @[Agent.scala 51:21]
  assign io_observe = io_observe_REG; // @[Agent.scala 50:14]
  assign io_terminate = $signed(io_reward) == 3'sh2; // @[Agent.scala 45:18]
  assign io_newStateFound = io_newStateFound_REG; // @[Agent.scala 52:20]
  always @(posedge clock) begin
    if (reset) begin // @[Agent.scala 19:26]
      mazeSize <= 3'h0; // @[Agent.scala 19:26]
    end else if (io_loadInitalState) begin // @[Agent.scala 24:27]
      mazeSize <= io_mazeSize; // @[Agent.scala 27:15]
    end
    if (reset) begin // @[Agent.scala 20:26]
      x <= 3'h0; // @[Agent.scala 20:26]
    end else if (io_actionValid) begin // @[Agent.scala 30:23]
      if (io_action == 2'h0) begin // @[Agent.scala 32:28]
        x <= _x_T_1; // @[Agent.scala 33:9]
      end else if (io_action == 2'h1) begin // @[Agent.scala 34:34]
        x <= _GEN_0;
      end else begin
        x <= _GEN_3;
      end
    end else begin
      x <= _GEN_0;
    end
    if (reset) begin // @[Agent.scala 21:26]
      y <= 3'h0; // @[Agent.scala 21:26]
    end else if (io_actionValid) begin // @[Agent.scala 30:23]
      if (io_action == 2'h0) begin // @[Agent.scala 32:28]
        y <= _GEN_1;
      end else if (io_action == 2'h1) begin // @[Agent.scala 34:34]
        y <= _y_T_1; // @[Agent.scala 35:9]
      end else begin
        y <= _GEN_4;
      end
    end else begin
      y <= _GEN_1;
    end
    io_observe_REG <= io_actionValid; // @[Agent.scala 30:23 Agent.scala 31:13 Agent.scala 42:13]
    io_newStateFound_REG <= io_actionValid; // @[Agent.scala 52:30]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mazeSize = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  x = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  y = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  io_observe_REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_newStateFound_REG = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Environment(
  input        clock,
  input  [4:0] io_state,
  input  [2:0] io_rewardIn,
  input        io_wrEna,
  input        io_rdEna,
  output [2:0] io_reward
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] environment [0:24]; // @[Environment.scala 14:32]
  wire [2:0] environment_io_reward_MPORT_data; // @[Environment.scala 14:32]
  wire [4:0] environment_io_reward_MPORT_addr; // @[Environment.scala 14:32]
  wire [2:0] environment_MPORT_data; // @[Environment.scala 14:32]
  wire [4:0] environment_MPORT_addr; // @[Environment.scala 14:32]
  wire  environment_MPORT_mask; // @[Environment.scala 14:32]
  wire  environment_MPORT_en; // @[Environment.scala 14:32]
  reg  environment_io_reward_MPORT_en_pipe_0;
  reg [4:0] environment_io_reward_MPORT_addr_pipe_0;
  assign environment_io_reward_MPORT_addr = environment_io_reward_MPORT_addr_pipe_0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign environment_io_reward_MPORT_data = environment[environment_io_reward_MPORT_addr]; // @[Environment.scala 14:32]
  `else
  assign environment_io_reward_MPORT_data = environment_io_reward_MPORT_addr >= 5'h19 ? _RAND_1[2:0] :
    environment[environment_io_reward_MPORT_addr]; // @[Environment.scala 14:32]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign environment_MPORT_data = io_rewardIn;
  assign environment_MPORT_addr = io_state;
  assign environment_MPORT_mask = 1'h1;
  assign environment_MPORT_en = io_wrEna;
  assign io_reward = environment_io_reward_MPORT_data; // @[Environment.scala 18:13]
  always @(posedge clock) begin
    if(environment_MPORT_en & environment_MPORT_mask) begin
      environment[environment_MPORT_addr] <= environment_MPORT_data; // @[Environment.scala 14:32]
    end
    environment_io_reward_MPORT_en_pipe_0 <= io_rdEna;
    if (io_rdEna) begin
      environment_io_reward_MPORT_addr_pipe_0 <= io_state;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 25; initvar = initvar+1)
    environment[initvar] = _RAND_0[2:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  environment_io_reward_MPORT_en_pipe_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  environment_io_reward_MPORT_addr_pipe_0 = _RAND_3[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DQNAccelertorTop(
  input         clock,
  input         reset,
  input  [31:0] io_instruction,
  input         io_wrEna,
  input  [9:0]  io_instructionAddr,
  input         io_pointIR,
  input         io_runProgram,
  output        io_doneInference,
  input  [2:0]  io_rewardIn,
  input  [4:0]  io_state,
  input         io_wrEnaEnv,
  input  [2:0]  io_x_initial,
  input  [2:0]  io_y_initial,
  input         io_loadInitalState,
  input  [2:0]  io_mazeSize,
  output        io_newStateFound,
  output [4:0]  io_nextState
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  DQNCore_clock; // @[DQNAcceleratorTop.scala 64:23]
  wire  DQNCore_reset; // @[DQNAcceleratorTop.scala 64:23]
  wire [31:0] DQNCore_io_instruction; // @[DQNAcceleratorTop.scala 64:23]
  wire  DQNCore_io_instructionValid; // @[DQNAcceleratorTop.scala 64:23]
  wire [5:0] DQNCore_io_state; // @[DQNAcceleratorTop.scala 64:23]
  wire  DQNCore_io_terminate; // @[DQNAcceleratorTop.scala 64:23]
  wire  DQNCore_io_ready; // @[DQNAcceleratorTop.scala 64:23]
  wire  DQNCore_io_jumpIP; // @[DQNAcceleratorTop.scala 64:23]
  wire [9:0] DQNCore_io_IPAddress; // @[DQNAcceleratorTop.scala 64:23]
  wire  DQNCore_io_increaseIP; // @[DQNAcceleratorTop.scala 64:23]
  wire [1:0] DQNCore_io_action; // @[DQNAcceleratorTop.scala 64:23]
  wire  DQNCore_io_actionValid; // @[DQNAcceleratorTop.scala 64:23]
  wire  instructionMemory_clock; // @[SRAM.scala 47:81]
  wire [9:0] instructionMemory_io_addr; // @[SRAM.scala 47:81]
  wire [31:0] instructionMemory_io_dataIn; // @[SRAM.scala 47:81]
  wire [31:0] instructionMemory_io_dataOut; // @[SRAM.scala 47:81]
  wire  instructionMemory_io_wrEna; // @[SRAM.scala 47:81]
  wire  instructionMemory_io_rdEna; // @[SRAM.scala 47:81]
  wire  agent_clock; // @[DQNAcceleratorTop.scala 68:34]
  wire  agent_reset; // @[DQNAcceleratorTop.scala 68:34]
  wire [2:0] agent_io_x_initial; // @[DQNAcceleratorTop.scala 68:34]
  wire [2:0] agent_io_y_initial; // @[DQNAcceleratorTop.scala 68:34]
  wire  agent_io_loadInitalState; // @[DQNAcceleratorTop.scala 68:34]
  wire [2:0] agent_io_mazeSize; // @[DQNAcceleratorTop.scala 68:34]
  wire [1:0] agent_io_action; // @[DQNAcceleratorTop.scala 68:34]
  wire  agent_io_actionValid; // @[DQNAcceleratorTop.scala 68:34]
  wire [2:0] agent_io_reward; // @[DQNAcceleratorTop.scala 68:34]
  wire [5:0] agent_io_state; // @[DQNAcceleratorTop.scala 68:34]
  wire  agent_io_observe; // @[DQNAcceleratorTop.scala 68:34]
  wire  agent_io_terminate; // @[DQNAcceleratorTop.scala 68:34]
  wire  agent_io_newStateFound; // @[DQNAcceleratorTop.scala 68:34]
  wire  environment_clock; // @[DQNAcceleratorTop.scala 69:34]
  wire [4:0] environment_io_state; // @[DQNAcceleratorTop.scala 69:34]
  wire [2:0] environment_io_rewardIn; // @[DQNAcceleratorTop.scala 69:34]
  wire  environment_io_wrEna; // @[DQNAcceleratorTop.scala 69:34]
  wire  environment_io_rdEna; // @[DQNAcceleratorTop.scala 69:34]
  wire [2:0] environment_io_reward; // @[DQNAcceleratorTop.scala 69:34]
  reg [9:0] instructionPointer; // @[DQNAcceleratorTop.scala 70:35]
  reg  instructionValid; // @[DQNAcceleratorTop.scala 71:35]
  wire [9:0] _instructionPointer_T_1 = instructionPointer + 10'h1; // @[DQNAcceleratorTop.scala 83:46]
  wire  _GEN_0 = DQNCore_io_ready ? 1'h0 : instructionValid; // @[DQNAcceleratorTop.scala 90:31 DQNAcceleratorTop.scala 91:22 DQNAcceleratorTop.scala 71:35]
  wire [9:0] _GEN_1 = io_runProgram ? _instructionPointer_T_1 : instructionPointer; // @[DQNAcceleratorTop.scala 86:28 DQNAcceleratorTop.scala 87:24 DQNAcceleratorTop.scala 70:35]
  wire  _GEN_3 = io_runProgram | _GEN_0; // @[DQNAcceleratorTop.scala 86:28 DQNAcceleratorTop.scala 89:24]
  wire  _GEN_5 = DQNCore_io_increaseIP | io_runProgram; // @[DQNAcceleratorTop.scala 82:36 DQNAcceleratorTop.scala 84:24]
  wire  _GEN_6 = DQNCore_io_increaseIP | _GEN_3; // @[DQNAcceleratorTop.scala 82:36 DQNAcceleratorTop.scala 85:24]
  wire  _GEN_8 = DQNCore_io_jumpIP | _GEN_5; // @[DQNAcceleratorTop.scala 78:32 DQNAcceleratorTop.scala 80:24]
  wire  _GEN_9 = DQNCore_io_jumpIP | _GEN_6; // @[DQNAcceleratorTop.scala 78:32 DQNAcceleratorTop.scala 81:24]
  wire [5:0] _GEN_14 = io_wrEnaEnv ? {{1'd0}, io_state} : agent_io_state; // @[DQNAcceleratorTop.scala 108:20 DQNAcceleratorTop.scala 109:26 DQNAcceleratorTop.scala 111:26]
  ProcessingCore DQNCore ( // @[DQNAcceleratorTop.scala 64:23]
    .clock(DQNCore_clock),
    .reset(DQNCore_reset),
    .io_instruction(DQNCore_io_instruction),
    .io_instructionValid(DQNCore_io_instructionValid),
    .io_state(DQNCore_io_state),
    .io_terminate(DQNCore_io_terminate),
    .io_ready(DQNCore_io_ready),
    .io_jumpIP(DQNCore_io_jumpIP),
    .io_IPAddress(DQNCore_io_IPAddress),
    .io_increaseIP(DQNCore_io_increaseIP),
    .io_action(DQNCore_io_action),
    .io_actionValid(DQNCore_io_actionValid)
  );
  SinglePortedRam instructionMemory ( // @[SRAM.scala 47:81]
    .clock(instructionMemory_clock),
    .io_addr(instructionMemory_io_addr),
    .io_dataIn(instructionMemory_io_dataIn),
    .io_dataOut(instructionMemory_io_dataOut),
    .io_wrEna(instructionMemory_io_wrEna),
    .io_rdEna(instructionMemory_io_rdEna)
  );
  Agent agent ( // @[DQNAcceleratorTop.scala 68:34]
    .clock(agent_clock),
    .reset(agent_reset),
    .io_x_initial(agent_io_x_initial),
    .io_y_initial(agent_io_y_initial),
    .io_loadInitalState(agent_io_loadInitalState),
    .io_mazeSize(agent_io_mazeSize),
    .io_action(agent_io_action),
    .io_actionValid(agent_io_actionValid),
    .io_reward(agent_io_reward),
    .io_state(agent_io_state),
    .io_observe(agent_io_observe),
    .io_terminate(agent_io_terminate),
    .io_newStateFound(agent_io_newStateFound)
  );
  Environment environment ( // @[DQNAcceleratorTop.scala 69:34]
    .clock(environment_clock),
    .io_state(environment_io_state),
    .io_rewardIn(environment_io_rewardIn),
    .io_wrEna(environment_io_wrEna),
    .io_rdEna(environment_io_rdEna),
    .io_reward(environment_io_reward)
  );
  assign io_doneInference = agent_io_terminate; // @[DQNAcceleratorTop.scala 129:20]
  assign io_newStateFound = agent_io_newStateFound; // @[DQNAcceleratorTop.scala 131:20]
  assign io_nextState = agent_io_state[4:0]; // @[DQNAcceleratorTop.scala 130:20]
  assign DQNCore_clock = clock;
  assign DQNCore_reset = reset;
  assign DQNCore_io_instruction = instructionMemory_io_dataOut; // @[DQNAcceleratorTop.scala 125:31]
  assign DQNCore_io_instructionValid = instructionValid; // @[DQNAcceleratorTop.scala 126:31]
  assign DQNCore_io_state = agent_io_state; // @[DQNAcceleratorTop.scala 124:31]
  assign DQNCore_io_terminate = agent_io_terminate; // @[DQNAcceleratorTop.scala 123:31]
  assign instructionMemory_clock = clock;
  assign instructionMemory_io_addr = io_wrEna ? io_instructionAddr : instructionPointer; // @[DQNAcceleratorTop.scala 94:17 DQNAcceleratorTop.scala 95:31 DQNAcceleratorTop.scala 97:31]
  assign instructionMemory_io_dataIn = io_instruction; // @[DQNAcceleratorTop.scala 102:31]
  assign instructionMemory_io_wrEna = io_wrEna; // @[DQNAcceleratorTop.scala 101:31]
  assign instructionMemory_io_rdEna = io_pointIR ? 1'h0 : _GEN_8; // @[DQNAcceleratorTop.scala 76:19]
  assign agent_clock = clock;
  assign agent_reset = reset;
  assign agent_io_x_initial = io_x_initial; // @[DQNAcceleratorTop.scala 115:28]
  assign agent_io_y_initial = io_y_initial; // @[DQNAcceleratorTop.scala 116:28]
  assign agent_io_loadInitalState = io_loadInitalState; // @[DQNAcceleratorTop.scala 117:28]
  assign agent_io_mazeSize = io_mazeSize; // @[DQNAcceleratorTop.scala 118:28]
  assign agent_io_action = DQNCore_io_action; // @[DQNAcceleratorTop.scala 122:31]
  assign agent_io_actionValid = DQNCore_io_actionValid; // @[DQNAcceleratorTop.scala 121:31]
  assign agent_io_reward = environment_io_reward; // @[DQNAcceleratorTop.scala 114:28]
  assign environment_clock = clock;
  assign environment_io_state = _GEN_14[4:0];
  assign environment_io_rewardIn = io_rewardIn; // @[DQNAcceleratorTop.scala 106:31]
  assign environment_io_wrEna = io_wrEnaEnv; // @[DQNAcceleratorTop.scala 105:31]
  assign environment_io_rdEna = agent_io_observe; // @[DQNAcceleratorTop.scala 119:28]
  always @(posedge clock) begin
    if (reset) begin // @[DQNAcceleratorTop.scala 70:35]
      instructionPointer <= 10'h0; // @[DQNAcceleratorTop.scala 70:35]
    end else if (io_pointIR) begin // @[DQNAcceleratorTop.scala 76:19]
      instructionPointer <= io_instructionAddr; // @[DQNAcceleratorTop.scala 77:24]
    end else if (DQNCore_io_jumpIP) begin // @[DQNAcceleratorTop.scala 78:32]
      instructionPointer <= DQNCore_io_IPAddress; // @[DQNAcceleratorTop.scala 79:24]
    end else if (DQNCore_io_increaseIP) begin // @[DQNAcceleratorTop.scala 82:36]
      instructionPointer <= _instructionPointer_T_1; // @[DQNAcceleratorTop.scala 83:24]
    end else begin
      instructionPointer <= _GEN_1;
    end
    if (reset) begin // @[DQNAcceleratorTop.scala 71:35]
      instructionValid <= 1'h0; // @[DQNAcceleratorTop.scala 71:35]
    end else if (!(io_pointIR)) begin // @[DQNAcceleratorTop.scala 76:19]
      instructionValid <= _GEN_9;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  instructionPointer = _RAND_0[9:0];
  _RAND_1 = {1{`RANDOM}};
  instructionValid = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
