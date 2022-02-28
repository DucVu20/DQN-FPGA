module ActivationBlock(
  input  [1:0] io_activationFunc,
  input  [9:0] io_weightedSum_0,
  input  [9:0] io_weightedSum_1,
  input  [9:0] io_weightedSum_2,
  input  [9:0] io_weightedSum_3,
  input  [9:0] io_weightedSum_4,
  input  [9:0] io_weightedSum_5,
  input  [9:0] io_weightedSum_6,
  input  [9:0] io_weightedSum_7,
  input  [9:0] io_weightedSum_8,
  input  [9:0] io_weightedSum_9,
  input  [9:0] io_weightedSum_10,
  input  [9:0] io_weightedSum_11,
  input  [9:0] io_weightedSum_12,
  input  [9:0] io_weightedSum_13,
  input  [9:0] io_weightedSum_14,
  input  [9:0] io_weightedSum_15,
  input  [9:0] io_weightedSum_16,
  input  [9:0] io_weightedSum_17,
  input  [9:0] io_weightedSum_18,
  input  [9:0] io_weightedSum_19,
  input  [9:0] io_weightedSum_20,
  input  [9:0] io_weightedSum_21,
  input  [9:0] io_weightedSum_22,
  input  [9:0] io_weightedSum_23,
  input  [9:0] io_weightedSum_24,
  input  [9:0] io_weightedSum_25,
  input  [9:0] io_weightedSum_26,
  input  [9:0] io_weightedSum_27,
  input  [9:0] io_weightedSum_28,
  input  [9:0] io_weightedSum_29,
  input  [9:0] io_weightedSum_30,
  input  [9:0] io_weightedSum_31,
  output [9:0] io_activation_0,
  output [9:0] io_activation_1,
  output [9:0] io_activation_2,
  output [9:0] io_activation_3,
  output [9:0] io_activation_4,
  output [9:0] io_activation_5,
  output [9:0] io_activation_6,
  output [9:0] io_activation_7,
  output [9:0] io_activation_8,
  output [9:0] io_activation_9,
  output [9:0] io_activation_10,
  output [9:0] io_activation_11,
  output [9:0] io_activation_12,
  output [9:0] io_activation_13,
  output [9:0] io_activation_14,
  output [9:0] io_activation_15,
  output [9:0] io_activation_16,
  output [9:0] io_activation_17,
  output [9:0] io_activation_18,
  output [9:0] io_activation_19,
  output [9:0] io_activation_20,
  output [9:0] io_activation_21,
  output [9:0] io_activation_22,
  output [9:0] io_activation_23,
  output [9:0] io_activation_24,
  output [9:0] io_activation_25,
  output [9:0] io_activation_26,
  output [9:0] io_activation_27,
  output [9:0] io_activation_28,
  output [9:0] io_activation_29,
  output [9:0] io_activation_30,
  output [9:0] io_activation_31,
  input        io_ena
);
  wire [9:0] _io_activation_0_T_2 = io_weightedSum_0[9] ? $signed(10'sh0) : $signed(io_weightedSum_0); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_0 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_0) : $signed(_io_activation_0_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_1_T_2 = io_weightedSum_1[9] ? $signed(10'sh0) : $signed(io_weightedSum_1); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_2 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_1) : $signed(_io_activation_1_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_2_T_2 = io_weightedSum_2[9] ? $signed(10'sh0) : $signed(io_weightedSum_2); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_4 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_2) : $signed(_io_activation_2_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_3_T_2 = io_weightedSum_3[9] ? $signed(10'sh0) : $signed(io_weightedSum_3); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_6 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_3) : $signed(_io_activation_3_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_4_T_2 = io_weightedSum_4[9] ? $signed(10'sh0) : $signed(io_weightedSum_4); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_8 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_4) : $signed(_io_activation_4_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_5_T_2 = io_weightedSum_5[9] ? $signed(10'sh0) : $signed(io_weightedSum_5); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_10 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_5) : $signed(_io_activation_5_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_6_T_2 = io_weightedSum_6[9] ? $signed(10'sh0) : $signed(io_weightedSum_6); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_12 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_6) : $signed(_io_activation_6_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_7_T_2 = io_weightedSum_7[9] ? $signed(10'sh0) : $signed(io_weightedSum_7); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_14 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_7) : $signed(_io_activation_7_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_8_T_2 = io_weightedSum_8[9] ? $signed(10'sh0) : $signed(io_weightedSum_8); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_16 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_8) : $signed(_io_activation_8_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_9_T_2 = io_weightedSum_9[9] ? $signed(10'sh0) : $signed(io_weightedSum_9); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_18 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_9) : $signed(_io_activation_9_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_10_T_2 = io_weightedSum_10[9] ? $signed(10'sh0) : $signed(io_weightedSum_10); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_20 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_10) : $signed(_io_activation_10_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_11_T_2 = io_weightedSum_11[9] ? $signed(10'sh0) : $signed(io_weightedSum_11); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_22 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_11) : $signed(_io_activation_11_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_12_T_2 = io_weightedSum_12[9] ? $signed(10'sh0) : $signed(io_weightedSum_12); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_24 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_12) : $signed(_io_activation_12_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_13_T_2 = io_weightedSum_13[9] ? $signed(10'sh0) : $signed(io_weightedSum_13); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_26 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_13) : $signed(_io_activation_13_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_14_T_2 = io_weightedSum_14[9] ? $signed(10'sh0) : $signed(io_weightedSum_14); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_28 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_14) : $signed(_io_activation_14_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_15_T_2 = io_weightedSum_15[9] ? $signed(10'sh0) : $signed(io_weightedSum_15); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_30 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_15) : $signed(_io_activation_15_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_16_T_2 = io_weightedSum_16[9] ? $signed(10'sh0) : $signed(io_weightedSum_16); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_32 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_16) : $signed(_io_activation_16_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_17_T_2 = io_weightedSum_17[9] ? $signed(10'sh0) : $signed(io_weightedSum_17); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_34 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_17) : $signed(_io_activation_17_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_18_T_2 = io_weightedSum_18[9] ? $signed(10'sh0) : $signed(io_weightedSum_18); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_36 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_18) : $signed(_io_activation_18_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_19_T_2 = io_weightedSum_19[9] ? $signed(10'sh0) : $signed(io_weightedSum_19); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_38 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_19) : $signed(_io_activation_19_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_20_T_2 = io_weightedSum_20[9] ? $signed(10'sh0) : $signed(io_weightedSum_20); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_40 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_20) : $signed(_io_activation_20_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_21_T_2 = io_weightedSum_21[9] ? $signed(10'sh0) : $signed(io_weightedSum_21); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_42 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_21) : $signed(_io_activation_21_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_22_T_2 = io_weightedSum_22[9] ? $signed(10'sh0) : $signed(io_weightedSum_22); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_44 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_22) : $signed(_io_activation_22_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_23_T_2 = io_weightedSum_23[9] ? $signed(10'sh0) : $signed(io_weightedSum_23); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_46 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_23) : $signed(_io_activation_23_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_24_T_2 = io_weightedSum_24[9] ? $signed(10'sh0) : $signed(io_weightedSum_24); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_48 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_24) : $signed(_io_activation_24_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_25_T_2 = io_weightedSum_25[9] ? $signed(10'sh0) : $signed(io_weightedSum_25); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_50 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_25) : $signed(_io_activation_25_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_26_T_2 = io_weightedSum_26[9] ? $signed(10'sh0) : $signed(io_weightedSum_26); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_52 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_26) : $signed(_io_activation_26_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_27_T_2 = io_weightedSum_27[9] ? $signed(10'sh0) : $signed(io_weightedSum_27); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_54 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_27) : $signed(_io_activation_27_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_28_T_2 = io_weightedSum_28[9] ? $signed(10'sh0) : $signed(io_weightedSum_28); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_56 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_28) : $signed(_io_activation_28_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_29_T_2 = io_weightedSum_29[9] ? $signed(10'sh0) : $signed(io_weightedSum_29); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_58 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_29) : $signed(_io_activation_29_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_30_T_2 = io_weightedSum_30[9] ? $signed(10'sh0) : $signed(io_weightedSum_30); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_60 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_30) : $signed(_io_activation_30_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  wire [9:0] _io_activation_31_T_2 = io_weightedSum_31[9] ? $signed(10'sh0) : $signed(io_weightedSum_31); // @[ActivationBlock.scala 56:32]
  wire [9:0] _GEN_62 = io_activationFunc == 2'h0 ? $signed(io_weightedSum_31) : $signed(_io_activation_31_T_2); // @[ActivationBlock.scala 53:43 ActivationBlock.scala 54:26 ActivationBlock.scala 56:26]
  assign io_activation_0 = io_ena ? $signed(_GEN_0) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_1 = io_ena ? $signed(_GEN_2) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_2 = io_ena ? $signed(_GEN_4) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_3 = io_ena ? $signed(_GEN_6) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_4 = io_ena ? $signed(_GEN_8) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_5 = io_ena ? $signed(_GEN_10) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_6 = io_ena ? $signed(_GEN_12) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_7 = io_ena ? $signed(_GEN_14) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_8 = io_ena ? $signed(_GEN_16) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_9 = io_ena ? $signed(_GEN_18) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_10 = io_ena ? $signed(_GEN_20) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_11 = io_ena ? $signed(_GEN_22) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_12 = io_ena ? $signed(_GEN_24) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_13 = io_ena ? $signed(_GEN_26) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_14 = io_ena ? $signed(_GEN_28) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_15 = io_ena ? $signed(_GEN_30) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_16 = io_ena ? $signed(_GEN_32) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_17 = io_ena ? $signed(_GEN_34) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_18 = io_ena ? $signed(_GEN_36) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_19 = io_ena ? $signed(_GEN_38) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_20 = io_ena ? $signed(_GEN_40) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_21 = io_ena ? $signed(_GEN_42) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_22 = io_ena ? $signed(_GEN_44) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_23 = io_ena ? $signed(_GEN_46) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_24 = io_ena ? $signed(_GEN_48) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_25 = io_ena ? $signed(_GEN_50) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_26 = io_ena ? $signed(_GEN_52) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_27 = io_ena ? $signed(_GEN_54) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_28 = io_ena ? $signed(_GEN_56) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_29 = io_ena ? $signed(_GEN_58) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_30 = io_ena ? $signed(_GEN_60) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
  assign io_activation_31 = io_ena ? $signed(_GEN_62) : $signed(10'sh0); // @[ActivationBlock.scala 52:17 ActivationBlock.scala 59:24]
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
  input  [19:0] io_in_0,
  input  [19:0] io_in_1,
  input  [19:0] io_in_2,
  input  [19:0] io_in_3,
  input  [19:0] io_in_4,
  input  [19:0] io_in_5,
  input  [19:0] io_in_6,
  input  [19:0] io_in_7,
  input  [19:0] io_in_8,
  input  [19:0] io_in_9,
  input  [19:0] io_in_10,
  input  [19:0] io_in_11,
  input  [19:0] io_in_12,
  input  [19:0] io_in_13,
  input  [19:0] io_in_14,
  input  [19:0] io_in_15,
  input  [19:0] io_in_16,
  input  [19:0] io_in_17,
  input  [19:0] io_in_18,
  input  [19:0] io_in_19,
  input  [19:0] io_in_20,
  input  [19:0] io_in_21,
  input  [19:0] io_in_22,
  input  [19:0] io_in_23,
  input  [19:0] io_in_24,
  input  [19:0] io_in_25,
  input  [19:0] io_in_26,
  input  [19:0] io_in_27,
  input  [19:0] io_in_28,
  input  [19:0] io_in_29,
  input  [19:0] io_in_30,
  input  [19:0] io_in_31,
  output [19:0] io_sum,
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
  reg [19:0] registerArray2_0; // @[AdderTree.scala 16:27]
  reg [19:0] registerArray2_1; // @[AdderTree.scala 16:27]
  reg [19:0] registerArray2_2; // @[AdderTree.scala 16:27]
  reg [19:0] registerArray2_3; // @[AdderTree.scala 16:27]
  wire [19:0] registerArray0_0 = $signed(io_in_0) + $signed(io_in_1); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_1 = $signed(io_in_2) + $signed(io_in_3); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_2 = $signed(io_in_4) + $signed(io_in_5); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_3 = $signed(io_in_6) + $signed(io_in_7); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_4 = $signed(io_in_8) + $signed(io_in_9); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_5 = $signed(io_in_10) + $signed(io_in_11); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_6 = $signed(io_in_12) + $signed(io_in_13); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_7 = $signed(io_in_14) + $signed(io_in_15); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_8 = $signed(io_in_16) + $signed(io_in_17); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_9 = $signed(io_in_18) + $signed(io_in_19); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_10 = $signed(io_in_20) + $signed(io_in_21); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_11 = $signed(io_in_22) + $signed(io_in_23); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_12 = $signed(io_in_24) + $signed(io_in_25); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_13 = $signed(io_in_26) + $signed(io_in_27); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_14 = $signed(io_in_28) + $signed(io_in_29); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray0_15 = $signed(io_in_30) + $signed(io_in_31); // @[AdderTree.scala 21:41]
  wire [19:0] registerArray1_0 = $signed(registerArray0_0) + $signed(registerArray0_1); // @[AdderTree.scala 25:50]
  wire [19:0] registerArray1_1 = $signed(registerArray0_2) + $signed(registerArray0_3); // @[AdderTree.scala 25:50]
  wire [19:0] registerArray1_2 = $signed(registerArray0_4) + $signed(registerArray0_5); // @[AdderTree.scala 25:50]
  wire [19:0] registerArray1_3 = $signed(registerArray0_6) + $signed(registerArray0_7); // @[AdderTree.scala 25:50]
  wire [19:0] registerArray1_4 = $signed(registerArray0_8) + $signed(registerArray0_9); // @[AdderTree.scala 25:50]
  wire [19:0] registerArray1_5 = $signed(registerArray0_10) + $signed(registerArray0_11); // @[AdderTree.scala 25:50]
  wire [19:0] registerArray1_6 = $signed(registerArray0_12) + $signed(registerArray0_13); // @[AdderTree.scala 25:50]
  wire [19:0] registerArray1_7 = $signed(registerArray0_14) + $signed(registerArray0_15); // @[AdderTree.scala 25:50]
  wire [19:0] registerArray3_0 = $signed(registerArray2_0) + $signed(registerArray2_1); // @[AdderTree.scala 31:50]
  wire [19:0] registerArray3_1 = $signed(registerArray2_2) + $signed(registerArray2_3); // @[AdderTree.scala 31:50]
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
  registerArray2_0 = _RAND_0[19:0];
  _RAND_1 = {1{`RANDOM}};
  registerArray2_1 = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  registerArray2_2 = _RAND_2[19:0];
  _RAND_3 = {1{`RANDOM}};
  registerArray2_3 = _RAND_3[19:0];
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
  input  [9:0] io_in_0,
  input  [9:0] io_in_1,
  input  [9:0] io_in_2,
  input  [9:0] io_in_3,
  output [1:0] io_index
);
  wire [9:0] _io_max_T_1 = $signed(io_in_0) > $signed(io_in_1) ? $signed(io_in_0) : $signed(io_in_1); // @[Max.scala 28:43]
  wire [9:0] _io_max_T_3 = $signed(_io_max_T_1) > $signed(io_in_2) ? $signed(_io_max_T_1) : $signed(io_in_2); // @[Max.scala 28:43]
  wire [9:0] _io_max_T_5 = $signed(_io_max_T_3) > $signed(io_in_3) ? $signed(_io_max_T_3) : $signed(io_in_3); // @[Max.scala 28:43]
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
module ProcessingCoreBlackBoxMem(
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
  wire  DualPortedMemBlackBox_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_1_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_1_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_1_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_1_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_1_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_1_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_1_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_2_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_2_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_2_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_2_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_2_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_2_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_2_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_3_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_3_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_3_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_3_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_3_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_3_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_3_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_4_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_4_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_4_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_4_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_4_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_4_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_4_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_5_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_5_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_5_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_5_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_5_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_5_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_5_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_6_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_6_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_6_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_6_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_6_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_6_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_6_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_7_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_7_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_7_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_7_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_7_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_7_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_7_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_8_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_8_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_8_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_8_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_8_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_8_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_8_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_9_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_9_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_9_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_9_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_9_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_9_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_9_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_10_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_10_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_10_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_10_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_10_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_10_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_10_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_11_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_11_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_11_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_11_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_11_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_11_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_11_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_12_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_12_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_12_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_12_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_12_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_12_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_12_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_13_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_13_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_13_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_13_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_13_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_13_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_13_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_14_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_14_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_14_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_14_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_14_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_14_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_14_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_15_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_15_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_15_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_15_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_15_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_15_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_15_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_16_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_16_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_16_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_16_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_16_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_16_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_16_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_17_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_17_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_17_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_17_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_17_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_17_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_17_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_18_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_18_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_18_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_18_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_18_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_18_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_18_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_19_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_19_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_19_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_19_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_19_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_19_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_19_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_20_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_20_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_20_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_20_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_20_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_20_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_20_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_21_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_21_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_21_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_21_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_21_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_21_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_21_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_22_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_22_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_22_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_22_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_22_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_22_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_22_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_23_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_23_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_23_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_23_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_23_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_23_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_23_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_24_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_24_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_24_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_24_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_24_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_24_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_24_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_25_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_25_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_25_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_25_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_25_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_25_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_25_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_26_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_26_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_26_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_26_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_26_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_26_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_26_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_27_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_27_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_27_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_27_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_27_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_27_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_27_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_28_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_28_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_28_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_28_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_28_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_28_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_28_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_29_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_29_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_29_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_29_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_29_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_29_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_29_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_30_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_30_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_30_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_30_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_30_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_30_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_30_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_31_clock; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_31_wrData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [9:0] DualPortedMemBlackBox_31_rdData; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_31_readAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire [6:0] DualPortedMemBlackBox_31_writeAddr; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_31_wrEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_31_rdEna; // @[DQNAcceleratorBlackBox.scala 44:61]
  wire  DualPortedMemBlackBox_32_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_32_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_32_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_32_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_32_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_32_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_32_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_33_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_33_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_33_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_33_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_33_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_33_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_33_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_34_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_34_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_34_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_34_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_34_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_34_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_34_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_35_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_35_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_35_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_35_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_35_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_35_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_35_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_36_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_36_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_36_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_36_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_36_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_36_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_36_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_37_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_37_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_37_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_37_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_37_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_37_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_37_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_38_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_38_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_38_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_38_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_38_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_38_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_38_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_39_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_39_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_39_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_39_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_39_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_39_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_39_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_40_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_40_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_40_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_40_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_40_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_40_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_40_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_41_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_41_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_41_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_41_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_41_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_41_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_41_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_42_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_42_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_42_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_42_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_42_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_42_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_42_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_43_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_43_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_43_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_43_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_43_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_43_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_43_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_44_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_44_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_44_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_44_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_44_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_44_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_44_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_45_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_45_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_45_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_45_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_45_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_45_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_45_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_46_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_46_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_46_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_46_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_46_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_46_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_46_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_47_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_47_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_47_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_47_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_47_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_47_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_47_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_48_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_48_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_48_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_48_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_48_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_48_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_48_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_49_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_49_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_49_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_49_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_49_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_49_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_49_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_50_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_50_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_50_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_50_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_50_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_50_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_50_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_51_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_51_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_51_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_51_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_51_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_51_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_51_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_52_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_52_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_52_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_52_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_52_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_52_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_52_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_53_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_53_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_53_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_53_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_53_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_53_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_53_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_54_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_54_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_54_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_54_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_54_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_54_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_54_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_55_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_55_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_55_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_55_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_55_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_55_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_55_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_56_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_56_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_56_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_56_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_56_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_56_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_56_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_57_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_57_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_57_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_57_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_57_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_57_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_57_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_58_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_58_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_58_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_58_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_58_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_58_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_58_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_59_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_59_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_59_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_59_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_59_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_59_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_59_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_60_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_60_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_60_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_60_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_60_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_60_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_60_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_61_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_61_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_61_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_61_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_61_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_61_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_61_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_62_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_62_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_62_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_62_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_62_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_62_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_62_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_63_clock; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_63_wrData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [9:0] DualPortedMemBlackBox_63_rdData; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_63_readAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [3:0] DualPortedMemBlackBox_63_writeAddr; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_63_wrEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire  DualPortedMemBlackBox_63_rdEna; // @[DQNAcceleratorBlackBox.scala 45:61]
  wire [1:0] activationBlock_io_activationFunc; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_0; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_1; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_2; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_3; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_4; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_5; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_6; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_7; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_8; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_9; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_10; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_11; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_12; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_13; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_14; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_15; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_16; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_17; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_18; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_19; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_20; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_21; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_22; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_23; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_24; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_25; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_26; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_27; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_28; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_29; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_30; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_weightedSum_31; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_0; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_1; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_2; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_3; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_4; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_5; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_6; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_7; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_8; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_9; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_10; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_11; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_12; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_13; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_14; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_15; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_16; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_17; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_18; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_19; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_20; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_21; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_22; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_23; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_24; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_25; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_26; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_27; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_28; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_29; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_30; // @[ActivationBlock.scala 66:70]
  wire [9:0] activationBlock_io_activation_31; // @[ActivationBlock.scala 66:70]
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
  wire [19:0] adderTree_io_in_0; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_1; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_2; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_3; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_4; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_5; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_6; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_7; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_8; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_9; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_10; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_11; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_12; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_13; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_14; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_15; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_16; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_17; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_18; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_19; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_20; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_21; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_22; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_23; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_24; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_25; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_26; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_27; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_28; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_29; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_30; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_in_31; // @[AdderTree.scala 40:58]
  wire [19:0] adderTree_io_sum; // @[AdderTree.scala 40:58]
  wire  adderTree_io_sumValid; // @[AdderTree.scala 40:58]
  wire  adderTree_io_cal; // @[AdderTree.scala 40:58]
  wire [9:0] actionBlock_io_in_0; // @[DQNAcceleratorBlackBox.scala 54:31]
  wire [9:0] actionBlock_io_in_1; // @[DQNAcceleratorBlackBox.scala 54:31]
  wire [9:0] actionBlock_io_in_2; // @[DQNAcceleratorBlackBox.scala 54:31]
  wire [9:0] actionBlock_io_in_3; // @[DQNAcceleratorBlackBox.scala 54:31]
  wire [1:0] actionBlock_io_index; // @[DQNAcceleratorBlackBox.scala 54:31]
  wire  rdDataMatrixValid_clock; // @[utils.scala 111:53]
  wire  rdDataMatrixValid_io_signal2delay; // @[utils.scala 111:53]
  wire  rdDataMatrixValid_io_delayedSignal; // @[utils.scala 111:53]
  wire  rdDataVecValid_clock; // @[utils.scala 111:53]
  wire  rdDataVecValid_io_signal2delay; // @[utils.scala 111:53]
  wire  rdDataVecValid_io_delayedSignal; // @[utils.scala 111:53]
  reg [31:0] instructionRegister; // @[DQNAcceleratorBlackBox.scala 43:36]
  reg [19:0] mulResults_0; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_1; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_2; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_3; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_4; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_5; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_6; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_7; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_8; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_9; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_10; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_11; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_12; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_13; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_14; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_15; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_16; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_17; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_18; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_19; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_20; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_21; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_22; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_23; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_24; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_25; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_26; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_27; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_28; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_29; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_30; // @[DQNAcceleratorBlackBox.scala 52:28]
  reg [19:0] mulResults_31; // @[DQNAcceleratorBlackBox.scala 52:28]
  wire [10:0] quantizedSum = adderTree_io_sum[17:7]; // @[DQNAcceleratorBlackBox.scala 53:86]
  reg  rdWrEnaFlip; // @[DQNAcceleratorBlackBox.scala 65:34]
  reg [12:0] colBanksCounter; // @[DQNAcceleratorBlackBox.scala 73:33]
  reg [12:0] matrixRowCounter; // @[DQNAcceleratorBlackBox.scala 74:33]
  reg [13:0] VinSizeReg; // @[DQNAcceleratorBlackBox.scala 75:33]
  reg [12:0] VoutSizeReg; // @[DQNAcceleratorBlackBox.scala 76:33]
  reg  adderTree_io_cal_REG; // @[DQNAcceleratorBlackBox.scala 89:30]
  wire [1:0] op = instructionRegister[31:30]; // @[DQNAcceleratorBlackBox.scala 128:33]
  wire [2:0] func = instructionRegister[29:27]; // @[DQNAcceleratorBlackBox.scala 129:33]
  wire [4:0] matrixCol = instructionRegister[26:22]; // @[DQNAcceleratorBlackBox.scala 134:40]
  wire [9:0] matrixRow = instructionRegister[21:12]; // @[DQNAcceleratorBlackBox.scala 135:40]
  wire [11:0] weightValue = instructionRegister[11:0]; // @[DQNAcceleratorBlackBox.scala 136:54]
  wire [13:0] VinSize = instructionRegister[26:13]; // @[DQNAcceleratorBlackBox.scala 142:40]
  wire [12:0] VoutSize = instructionRegister[12:0]; // @[DQNAcceleratorBlackBox.scala 143:40]
  wire [11:0] MinAddr = instructionRegister[23:12]; // @[DQNAcceleratorBlackBox.scala 147:37]
  wire [4:0] VinAddr = instructionRegister[11:7]; // @[DQNAcceleratorBlackBox.scala 148:37]
  wire [6:0] VoutAddr = instructionRegister[6:0]; // @[DQNAcceleratorBlackBox.scala 149:37]
  wire [9:0] vinAddr = instructionRegister[24:15]; // @[DQNAcceleratorBlackBox.scala 157:43]
  wire [4:0] vinSize = instructionRegister[14:10]; // @[DQNAcceleratorBlackBox.scala 158:43]
  reg [1:0] Controller; // @[DQNAcceleratorBlackBox.scala 162:32]
  wire  _T = 2'h0 == Controller; // @[Conditional.scala 37:30]
  wire  _T_1 = 2'h1 == Controller; // @[Conditional.scala 37:30]
  wire  _T_2 = 2'h2 == Controller; // @[Conditional.scala 37:30]
  wire  _GEN_1 = op == 2'h3 ? 1'h0 : 1'h1; // @[DQNAcceleratorBlackBox.scala 180:25 DQNAcceleratorBlackBox.scala 181:25 DQNAcceleratorBlackBox.scala 183:25]
  wire  _T_4 = 2'h3 == Controller; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_2 = io_instructionValid ? 2'h1 : 2'h0; // @[DQNAcceleratorBlackBox.scala 188:34 DQNAcceleratorBlackBox.scala 189:25 DQNAcceleratorBlackBox.scala 191:25]
  wire  _T_10 = 3'h0 == func; // @[Conditional.scala 37:30]
  wire  _T_11 = 3'h1 == func; // @[Conditional.scala 37:30]
  wire  _T_12 = 3'h2 == func; // @[Conditional.scala 37:30]
  wire  _T_141 = 3'h3 == func; // @[Conditional.scala 37:30]
  wire  _GEN_21 = _T_141 | _T; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 248:27]
  wire  _GEN_156 = _T_12 | _GEN_21; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 242:27]
  wire  _GEN_160 = _T_11 | _GEN_156; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 223:35]
  wire  _GEN_294 = _T_10 | _GEN_160; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 216:27]
  wire  _GEN_431 = matrixRowCounter == VoutSizeReg | _T; // @[DQNAcceleratorBlackBox.scala 293:51 DQNAcceleratorBlackBox.scala 294:31]
  wire  _GEN_432 = colBanksCounter == VoutSizeReg ? _GEN_431 : _T; // @[DQNAcceleratorBlackBox.scala 292:50]
  wire  _GEN_555 = rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip
     | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (
    rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip
     | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (rdWrEnaFlip | (
    rdWrEnaFlip | _T))))))))))))))))))))))))))))); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 323:31]
  wire  _GEN_563 = rdWrEnaFlip | (rdWrEnaFlip | _GEN_555); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 323:31]
  wire  _instructionDone_T = ~rdWrEnaFlip; // @[DQNAcceleratorBlackBox.scala 331:45]
  wire  _GEN_569 = _T_12 ? ~rdWrEnaFlip : _GEN_21; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 331:42]
  wire  _GEN_646 = _T_11 ? _GEN_563 : _GEN_569; // @[Conditional.scala 39:67]
  wire  _GEN_780 = _T_10 ? _GEN_432 : _GEN_646; // @[Conditional.scala 40:58]
  wire  _GEN_986 = op == 2'h0 ? _GEN_780 : 1'h1; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 351:23]
  wire  _GEN_1190 = op == 2'h1 ? _GEN_294 : _GEN_986; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  instructionDone = Controller == 2'h3 ? _GEN_1190 : _T; // @[DQNAcceleratorBlackBox.scala 208:33]
  wire [1:0] _GEN_3 = instructionDone ? _GEN_2 : Controller; // @[DQNAcceleratorBlackBox.scala 187:28 DQNAcceleratorBlackBox.scala 162:32]
  wire [1:0] _GEN_4 = _T_4 ? _GEN_3 : Controller; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 162:32]
  wire  _GEN_10 = _T_1 ? 1'h0 : _T_2 & _GEN_1; // @[Conditional.scala 39:67]
  wire [12:0] _GEN_15 = func == 3'h0 ? 13'h0 : colBanksCounter; // @[DQNAcceleratorBlackBox.scala 201:25 DQNAcceleratorBlackBox.scala 202:25 DQNAcceleratorBlackBox.scala 73:33]
  wire [12:0] _GEN_16 = func == 3'h0 ? 13'h0 : matrixRowCounter; // @[DQNAcceleratorBlackBox.scala 201:25 DQNAcceleratorBlackBox.scala 203:25 DQNAcceleratorBlackBox.scala 74:33]
  wire [12:0] _GEN_17 = Controller == 2'h2 ? _GEN_15 : colBanksCounter; // @[DQNAcceleratorBlackBox.scala 200:30 DQNAcceleratorBlackBox.scala 73:33]
  wire [12:0] _GEN_18 = Controller == 2'h2 ? _GEN_16 : matrixRowCounter; // @[DQNAcceleratorBlackBox.scala 200:30 DQNAcceleratorBlackBox.scala 74:33]
  wire [1:0] _T_14 = {1'h0,oneHotDecoder_io_writeSignal_0}; // @[Cat.scala 30:58]
  wire [8:0] _T_16 = {_T_14, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_18 = {1'h0,oneHotDecoder_io_writeSignal_1}; // @[Cat.scala 30:58]
  wire [8:0] _T_20 = {_T_18, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_22 = {1'h0,oneHotDecoder_io_writeSignal_2}; // @[Cat.scala 30:58]
  wire [8:0] _T_24 = {_T_22, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_26 = {1'h0,oneHotDecoder_io_writeSignal_3}; // @[Cat.scala 30:58]
  wire [8:0] _T_28 = {_T_26, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_30 = {1'h0,oneHotDecoder_io_writeSignal_4}; // @[Cat.scala 30:58]
  wire [8:0] _T_32 = {_T_30, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_34 = {1'h0,oneHotDecoder_io_writeSignal_5}; // @[Cat.scala 30:58]
  wire [8:0] _T_36 = {_T_34, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_38 = {1'h0,oneHotDecoder_io_writeSignal_6}; // @[Cat.scala 30:58]
  wire [8:0] _T_40 = {_T_38, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_42 = {1'h0,oneHotDecoder_io_writeSignal_7}; // @[Cat.scala 30:58]
  wire [8:0] _T_44 = {_T_42, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_46 = {1'h0,oneHotDecoder_io_writeSignal_8}; // @[Cat.scala 30:58]
  wire [8:0] _T_48 = {_T_46, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_50 = {1'h0,oneHotDecoder_io_writeSignal_9}; // @[Cat.scala 30:58]
  wire [8:0] _T_52 = {_T_50, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_54 = {1'h0,oneHotDecoder_io_writeSignal_10}; // @[Cat.scala 30:58]
  wire [8:0] _T_56 = {_T_54, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_58 = {1'h0,oneHotDecoder_io_writeSignal_11}; // @[Cat.scala 30:58]
  wire [8:0] _T_60 = {_T_58, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_62 = {1'h0,oneHotDecoder_io_writeSignal_12}; // @[Cat.scala 30:58]
  wire [8:0] _T_64 = {_T_62, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_66 = {1'h0,oneHotDecoder_io_writeSignal_13}; // @[Cat.scala 30:58]
  wire [8:0] _T_68 = {_T_66, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_70 = {1'h0,oneHotDecoder_io_writeSignal_14}; // @[Cat.scala 30:58]
  wire [8:0] _T_72 = {_T_70, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_74 = {1'h0,oneHotDecoder_io_writeSignal_15}; // @[Cat.scala 30:58]
  wire [8:0] _T_76 = {_T_74, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_78 = {1'h0,oneHotDecoder_io_writeSignal_16}; // @[Cat.scala 30:58]
  wire [8:0] _T_80 = {_T_78, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_82 = {1'h0,oneHotDecoder_io_writeSignal_17}; // @[Cat.scala 30:58]
  wire [8:0] _T_84 = {_T_82, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_86 = {1'h0,oneHotDecoder_io_writeSignal_18}; // @[Cat.scala 30:58]
  wire [8:0] _T_88 = {_T_86, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_90 = {1'h0,oneHotDecoder_io_writeSignal_19}; // @[Cat.scala 30:58]
  wire [8:0] _T_92 = {_T_90, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_94 = {1'h0,oneHotDecoder_io_writeSignal_20}; // @[Cat.scala 30:58]
  wire [8:0] _T_96 = {_T_94, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_98 = {1'h0,oneHotDecoder_io_writeSignal_21}; // @[Cat.scala 30:58]
  wire [8:0] _T_100 = {_T_98, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_102 = {1'h0,oneHotDecoder_io_writeSignal_22}; // @[Cat.scala 30:58]
  wire [8:0] _T_104 = {_T_102, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_106 = {1'h0,oneHotDecoder_io_writeSignal_23}; // @[Cat.scala 30:58]
  wire [8:0] _T_108 = {_T_106, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_110 = {1'h0,oneHotDecoder_io_writeSignal_24}; // @[Cat.scala 30:58]
  wire [8:0] _T_112 = {_T_110, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_114 = {1'h0,oneHotDecoder_io_writeSignal_25}; // @[Cat.scala 30:58]
  wire [8:0] _T_116 = {_T_114, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_118 = {1'h0,oneHotDecoder_io_writeSignal_26}; // @[Cat.scala 30:58]
  wire [8:0] _T_120 = {_T_118, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_122 = {1'h0,oneHotDecoder_io_writeSignal_27}; // @[Cat.scala 30:58]
  wire [8:0] _T_124 = {_T_122, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_126 = {1'h0,oneHotDecoder_io_writeSignal_28}; // @[Cat.scala 30:58]
  wire [8:0] _T_128 = {_T_126, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_130 = {1'h0,oneHotDecoder_io_writeSignal_29}; // @[Cat.scala 30:58]
  wire [8:0] _T_132 = {_T_130, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_134 = {1'h0,oneHotDecoder_io_writeSignal_30}; // @[Cat.scala 30:58]
  wire [8:0] _T_136 = {_T_134, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [1:0] _T_138 = {1'h0,oneHotDecoder_io_writeSignal_31}; // @[Cat.scala 30:58]
  wire [8:0] _T_140 = {_T_138, 7'h0}; // @[DQNAcceleratorBlackBox.scala 240:126]
  wire [4:0] _GEN_20 = _T_141 ? matrixCol : 5'h0; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 247:35 DQNAcceleratorBlackBox.scala 83:37]
  wire  _GEN_22 = _T_141 & oneHotDecoder_io_writeSignal_0; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire [9:0] _GEN_23 = _T_141 ? matrixRow : 10'h0; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 251:49 DQNAcceleratorBlackBox.scala 103:40]
  wire [11:0] _GEN_24 = _T_141 ? $signed(weightValue) : $signed(12'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 252:49 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_25 = _T_141 & oneHotDecoder_io_writeSignal_1; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_26 = _T_141 & oneHotDecoder_io_writeSignal_2; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_27 = _T_141 & oneHotDecoder_io_writeSignal_3; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_28 = _T_141 & oneHotDecoder_io_writeSignal_4; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_29 = _T_141 & oneHotDecoder_io_writeSignal_5; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_30 = _T_141 & oneHotDecoder_io_writeSignal_6; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_31 = _T_141 & oneHotDecoder_io_writeSignal_7; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_32 = _T_141 & oneHotDecoder_io_writeSignal_8; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_33 = _T_141 & oneHotDecoder_io_writeSignal_9; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_34 = _T_141 & oneHotDecoder_io_writeSignal_10; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_35 = _T_141 & oneHotDecoder_io_writeSignal_11; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_36 = _T_141 & oneHotDecoder_io_writeSignal_12; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_37 = _T_141 & oneHotDecoder_io_writeSignal_13; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_38 = _T_141 & oneHotDecoder_io_writeSignal_14; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_39 = _T_141 & oneHotDecoder_io_writeSignal_15; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_40 = _T_141 & oneHotDecoder_io_writeSignal_16; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_41 = _T_141 & oneHotDecoder_io_writeSignal_17; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_42 = _T_141 & oneHotDecoder_io_writeSignal_18; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_43 = _T_141 & oneHotDecoder_io_writeSignal_19; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_44 = _T_141 & oneHotDecoder_io_writeSignal_20; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_45 = _T_141 & oneHotDecoder_io_writeSignal_21; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_46 = _T_141 & oneHotDecoder_io_writeSignal_22; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_47 = _T_141 & oneHotDecoder_io_writeSignal_23; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_48 = _T_141 & oneHotDecoder_io_writeSignal_24; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_49 = _T_141 & oneHotDecoder_io_writeSignal_25; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_50 = _T_141 & oneHotDecoder_io_writeSignal_26; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_51 = _T_141 & oneHotDecoder_io_writeSignal_27; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_52 = _T_141 & oneHotDecoder_io_writeSignal_28; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_53 = _T_141 & oneHotDecoder_io_writeSignal_29; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_54 = _T_141 & oneHotDecoder_io_writeSignal_30; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_55 = _T_141 & oneHotDecoder_io_writeSignal_31; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 250:49 DQNAcceleratorBlackBox.scala 106:40]
  wire [5:0] _GEN_57 = _T_12 ? io_state : 6'h0; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 234:36 DQNAcceleratorBlackBox.scala 84:37]
  wire  _GEN_58 = _T_12 | _T_141; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 235:36]
  wire [5:0] _GEN_59 = _T_12 ? io_state : {{1'd0}, _GEN_20}; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 236:36]
  wire  _GEN_60 = _T_12 ? memReadDecoder_io_activatedSignals_0 : _GEN_22; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [9:0] _GEN_61 = _T_12 ? matrixRow : _GEN_23; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 239:49]
  wire [11:0] _GEN_62 = _T_12 ? $signed({{3{_T_16[8]}},_T_16}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_63 = _T_12 ? memReadDecoder_io_activatedSignals_1 : _GEN_25; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_65 = _T_12 ? $signed({{3{_T_20[8]}},_T_20}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_66 = _T_12 ? memReadDecoder_io_activatedSignals_2 : _GEN_26; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_68 = _T_12 ? $signed({{3{_T_24[8]}},_T_24}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_69 = _T_12 ? memReadDecoder_io_activatedSignals_3 : _GEN_27; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_71 = _T_12 ? $signed({{3{_T_28[8]}},_T_28}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_72 = _T_12 ? memReadDecoder_io_activatedSignals_4 : _GEN_28; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_74 = _T_12 ? $signed({{3{_T_32[8]}},_T_32}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_75 = _T_12 ? memReadDecoder_io_activatedSignals_5 : _GEN_29; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_77 = _T_12 ? $signed({{3{_T_36[8]}},_T_36}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_78 = _T_12 ? memReadDecoder_io_activatedSignals_6 : _GEN_30; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_80 = _T_12 ? $signed({{3{_T_40[8]}},_T_40}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_81 = _T_12 ? memReadDecoder_io_activatedSignals_7 : _GEN_31; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_83 = _T_12 ? $signed({{3{_T_44[8]}},_T_44}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_84 = _T_12 ? memReadDecoder_io_activatedSignals_8 : _GEN_32; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_86 = _T_12 ? $signed({{3{_T_48[8]}},_T_48}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_87 = _T_12 ? memReadDecoder_io_activatedSignals_9 : _GEN_33; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_89 = _T_12 ? $signed({{3{_T_52[8]}},_T_52}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_90 = _T_12 ? memReadDecoder_io_activatedSignals_10 : _GEN_34; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_92 = _T_12 ? $signed({{3{_T_56[8]}},_T_56}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_93 = _T_12 ? memReadDecoder_io_activatedSignals_11 : _GEN_35; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_95 = _T_12 ? $signed({{3{_T_60[8]}},_T_60}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_96 = _T_12 ? memReadDecoder_io_activatedSignals_12 : _GEN_36; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_98 = _T_12 ? $signed({{3{_T_64[8]}},_T_64}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_99 = _T_12 ? memReadDecoder_io_activatedSignals_13 : _GEN_37; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_101 = _T_12 ? $signed({{3{_T_68[8]}},_T_68}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_102 = _T_12 ? memReadDecoder_io_activatedSignals_14 : _GEN_38; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_104 = _T_12 ? $signed({{3{_T_72[8]}},_T_72}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_105 = _T_12 ? memReadDecoder_io_activatedSignals_15 : _GEN_39; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_107 = _T_12 ? $signed({{3{_T_76[8]}},_T_76}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_108 = _T_12 ? memReadDecoder_io_activatedSignals_16 : _GEN_40; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_110 = _T_12 ? $signed({{3{_T_80[8]}},_T_80}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_111 = _T_12 ? memReadDecoder_io_activatedSignals_17 : _GEN_41; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_113 = _T_12 ? $signed({{3{_T_84[8]}},_T_84}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_114 = _T_12 ? memReadDecoder_io_activatedSignals_18 : _GEN_42; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_116 = _T_12 ? $signed({{3{_T_88[8]}},_T_88}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_117 = _T_12 ? memReadDecoder_io_activatedSignals_19 : _GEN_43; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_119 = _T_12 ? $signed({{3{_T_92[8]}},_T_92}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_120 = _T_12 ? memReadDecoder_io_activatedSignals_20 : _GEN_44; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_122 = _T_12 ? $signed({{3{_T_96[8]}},_T_96}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_123 = _T_12 ? memReadDecoder_io_activatedSignals_21 : _GEN_45; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_125 = _T_12 ? $signed({{3{_T_100[8]}},_T_100}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_126 = _T_12 ? memReadDecoder_io_activatedSignals_22 : _GEN_46; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_128 = _T_12 ? $signed({{3{_T_104[8]}},_T_104}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_129 = _T_12 ? memReadDecoder_io_activatedSignals_23 : _GEN_47; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_131 = _T_12 ? $signed({{3{_T_108[8]}},_T_108}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_132 = _T_12 ? memReadDecoder_io_activatedSignals_24 : _GEN_48; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_134 = _T_12 ? $signed({{3{_T_112[8]}},_T_112}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_135 = _T_12 ? memReadDecoder_io_activatedSignals_25 : _GEN_49; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_137 = _T_12 ? $signed({{3{_T_116[8]}},_T_116}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_138 = _T_12 ? memReadDecoder_io_activatedSignals_26 : _GEN_50; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_140 = _T_12 ? $signed({{3{_T_120[8]}},_T_120}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_141 = _T_12 ? memReadDecoder_io_activatedSignals_27 : _GEN_51; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_143 = _T_12 ? $signed({{3{_T_124[8]}},_T_124}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_144 = _T_12 ? memReadDecoder_io_activatedSignals_28 : _GEN_52; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_146 = _T_12 ? $signed({{3{_T_128[8]}},_T_128}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_147 = _T_12 ? memReadDecoder_io_activatedSignals_29 : _GEN_53; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_149 = _T_12 ? $signed({{3{_T_132[8]}},_T_132}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_150 = _T_12 ? memReadDecoder_io_activatedSignals_30 : _GEN_54; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_152 = _T_12 ? $signed({{3{_T_136[8]}},_T_136}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_153 = _T_12 ? memReadDecoder_io_activatedSignals_31 : _GEN_55; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 238:49]
  wire [11:0] _GEN_155 = _T_12 ? $signed({{3{_T_140[8]}},_T_140}) : $signed(_GEN_24); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 240:49]
  wire  _GEN_157 = _T_11 | _GEN_58; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 220:35]
  wire [5:0] _GEN_158 = _T_11 ? {{1'd0}, matrixCol} : _GEN_59; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 221:35]
  wire [9:0] _GEN_159 = _T_11 ? matrixRow : 10'h0; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 222:35]
  wire [11:0] _GEN_161 = _T_11 ? $signed(weightValue) : $signed(12'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 225:33]
  wire  _GEN_162 = _T_11 & oneHotDecoder_io_writeSignal_0; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_163 = _T_11 & oneHotDecoder_io_writeSignal_1; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_164 = _T_11 & oneHotDecoder_io_writeSignal_2; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_165 = _T_11 & oneHotDecoder_io_writeSignal_3; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_166 = _T_11 & oneHotDecoder_io_writeSignal_4; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_167 = _T_11 & oneHotDecoder_io_writeSignal_5; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_168 = _T_11 & oneHotDecoder_io_writeSignal_6; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_169 = _T_11 & oneHotDecoder_io_writeSignal_7; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_170 = _T_11 & oneHotDecoder_io_writeSignal_8; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_171 = _T_11 & oneHotDecoder_io_writeSignal_9; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_172 = _T_11 & oneHotDecoder_io_writeSignal_10; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_173 = _T_11 & oneHotDecoder_io_writeSignal_11; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_174 = _T_11 & oneHotDecoder_io_writeSignal_12; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_175 = _T_11 & oneHotDecoder_io_writeSignal_13; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_176 = _T_11 & oneHotDecoder_io_writeSignal_14; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_177 = _T_11 & oneHotDecoder_io_writeSignal_15; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_178 = _T_11 & oneHotDecoder_io_writeSignal_16; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_179 = _T_11 & oneHotDecoder_io_writeSignal_17; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_180 = _T_11 & oneHotDecoder_io_writeSignal_18; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_181 = _T_11 & oneHotDecoder_io_writeSignal_19; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_182 = _T_11 & oneHotDecoder_io_writeSignal_20; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_183 = _T_11 & oneHotDecoder_io_writeSignal_21; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_184 = _T_11 & oneHotDecoder_io_writeSignal_22; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_185 = _T_11 & oneHotDecoder_io_writeSignal_23; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_186 = _T_11 & oneHotDecoder_io_writeSignal_24; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_187 = _T_11 & oneHotDecoder_io_writeSignal_25; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_188 = _T_11 & oneHotDecoder_io_writeSignal_26; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_189 = _T_11 & oneHotDecoder_io_writeSignal_27; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_190 = _T_11 & oneHotDecoder_io_writeSignal_28; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_191 = _T_11 & oneHotDecoder_io_writeSignal_29; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_192 = _T_11 & oneHotDecoder_io_writeSignal_30; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_193 = _T_11 & oneHotDecoder_io_writeSignal_31; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 226:33]
  wire  _GEN_194 = _T_11 ? 1'h0 : _T_12; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 82:37]
  wire [5:0] _GEN_195 = _T_11 ? 6'h0 : _GEN_57; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 84:37]
  wire  _GEN_196 = _T_11 ? 1'h0 : _GEN_60; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [9:0] _GEN_197 = _T_11 ? 10'h0 : _GEN_61; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 103:40]
  wire [11:0] _GEN_198 = _T_11 ? $signed(12'sh0) : $signed(_GEN_62); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_199 = _T_11 ? 1'h0 : _GEN_63; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_201 = _T_11 ? $signed(12'sh0) : $signed(_GEN_65); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_202 = _T_11 ? 1'h0 : _GEN_66; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_204 = _T_11 ? $signed(12'sh0) : $signed(_GEN_68); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_205 = _T_11 ? 1'h0 : _GEN_69; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_207 = _T_11 ? $signed(12'sh0) : $signed(_GEN_71); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_208 = _T_11 ? 1'h0 : _GEN_72; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_210 = _T_11 ? $signed(12'sh0) : $signed(_GEN_74); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_211 = _T_11 ? 1'h0 : _GEN_75; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_213 = _T_11 ? $signed(12'sh0) : $signed(_GEN_77); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_214 = _T_11 ? 1'h0 : _GEN_78; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_216 = _T_11 ? $signed(12'sh0) : $signed(_GEN_80); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_217 = _T_11 ? 1'h0 : _GEN_81; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_219 = _T_11 ? $signed(12'sh0) : $signed(_GEN_83); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_220 = _T_11 ? 1'h0 : _GEN_84; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_222 = _T_11 ? $signed(12'sh0) : $signed(_GEN_86); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_223 = _T_11 ? 1'h0 : _GEN_87; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_225 = _T_11 ? $signed(12'sh0) : $signed(_GEN_89); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_226 = _T_11 ? 1'h0 : _GEN_90; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_228 = _T_11 ? $signed(12'sh0) : $signed(_GEN_92); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_229 = _T_11 ? 1'h0 : _GEN_93; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_231 = _T_11 ? $signed(12'sh0) : $signed(_GEN_95); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_232 = _T_11 ? 1'h0 : _GEN_96; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_234 = _T_11 ? $signed(12'sh0) : $signed(_GEN_98); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_235 = _T_11 ? 1'h0 : _GEN_99; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_237 = _T_11 ? $signed(12'sh0) : $signed(_GEN_101); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_238 = _T_11 ? 1'h0 : _GEN_102; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_240 = _T_11 ? $signed(12'sh0) : $signed(_GEN_104); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_241 = _T_11 ? 1'h0 : _GEN_105; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_243 = _T_11 ? $signed(12'sh0) : $signed(_GEN_107); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_244 = _T_11 ? 1'h0 : _GEN_108; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_246 = _T_11 ? $signed(12'sh0) : $signed(_GEN_110); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_247 = _T_11 ? 1'h0 : _GEN_111; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_249 = _T_11 ? $signed(12'sh0) : $signed(_GEN_113); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_250 = _T_11 ? 1'h0 : _GEN_114; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_252 = _T_11 ? $signed(12'sh0) : $signed(_GEN_116); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_253 = _T_11 ? 1'h0 : _GEN_117; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_255 = _T_11 ? $signed(12'sh0) : $signed(_GEN_119); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_256 = _T_11 ? 1'h0 : _GEN_120; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_258 = _T_11 ? $signed(12'sh0) : $signed(_GEN_122); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_259 = _T_11 ? 1'h0 : _GEN_123; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_261 = _T_11 ? $signed(12'sh0) : $signed(_GEN_125); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_262 = _T_11 ? 1'h0 : _GEN_126; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_264 = _T_11 ? $signed(12'sh0) : $signed(_GEN_128); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_265 = _T_11 ? 1'h0 : _GEN_129; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_267 = _T_11 ? $signed(12'sh0) : $signed(_GEN_131); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_268 = _T_11 ? 1'h0 : _GEN_132; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_270 = _T_11 ? $signed(12'sh0) : $signed(_GEN_134); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_271 = _T_11 ? 1'h0 : _GEN_135; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_273 = _T_11 ? $signed(12'sh0) : $signed(_GEN_137); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_274 = _T_11 ? 1'h0 : _GEN_138; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_276 = _T_11 ? $signed(12'sh0) : $signed(_GEN_140); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_277 = _T_11 ? 1'h0 : _GEN_141; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_279 = _T_11 ? $signed(12'sh0) : $signed(_GEN_143); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_280 = _T_11 ? 1'h0 : _GEN_144; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_282 = _T_11 ? $signed(12'sh0) : $signed(_GEN_146); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_283 = _T_11 ? 1'h0 : _GEN_147; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_285 = _T_11 ? $signed(12'sh0) : $signed(_GEN_149); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_286 = _T_11 ? 1'h0 : _GEN_150; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_288 = _T_11 ? $signed(12'sh0) : $signed(_GEN_152); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_289 = _T_11 ? 1'h0 : _GEN_153; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_291 = _T_11 ? $signed(12'sh0) : $signed(_GEN_155); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_295 = _T_10 ? 1'h0 : _GEN_157; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 81:37]
  wire [5:0] _GEN_296 = _T_10 ? 6'h0 : _GEN_158; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 83:37]
  wire [9:0] _GEN_297 = _T_10 ? 10'h0 : _GEN_159; // @[Conditional.scala 40:58]
  wire [11:0] _GEN_298 = _T_10 ? $signed(12'sh0) : $signed(_GEN_161); // @[Conditional.scala 40:58]
  wire  _GEN_299 = _T_10 ? 1'h0 : _GEN_162; // @[Conditional.scala 40:58]
  wire  _GEN_300 = _T_10 ? 1'h0 : _GEN_163; // @[Conditional.scala 40:58]
  wire  _GEN_301 = _T_10 ? 1'h0 : _GEN_164; // @[Conditional.scala 40:58]
  wire  _GEN_302 = _T_10 ? 1'h0 : _GEN_165; // @[Conditional.scala 40:58]
  wire  _GEN_303 = _T_10 ? 1'h0 : _GEN_166; // @[Conditional.scala 40:58]
  wire  _GEN_304 = _T_10 ? 1'h0 : _GEN_167; // @[Conditional.scala 40:58]
  wire  _GEN_305 = _T_10 ? 1'h0 : _GEN_168; // @[Conditional.scala 40:58]
  wire  _GEN_306 = _T_10 ? 1'h0 : _GEN_169; // @[Conditional.scala 40:58]
  wire  _GEN_307 = _T_10 ? 1'h0 : _GEN_170; // @[Conditional.scala 40:58]
  wire  _GEN_308 = _T_10 ? 1'h0 : _GEN_171; // @[Conditional.scala 40:58]
  wire  _GEN_309 = _T_10 ? 1'h0 : _GEN_172; // @[Conditional.scala 40:58]
  wire  _GEN_310 = _T_10 ? 1'h0 : _GEN_173; // @[Conditional.scala 40:58]
  wire  _GEN_311 = _T_10 ? 1'h0 : _GEN_174; // @[Conditional.scala 40:58]
  wire  _GEN_312 = _T_10 ? 1'h0 : _GEN_175; // @[Conditional.scala 40:58]
  wire  _GEN_313 = _T_10 ? 1'h0 : _GEN_176; // @[Conditional.scala 40:58]
  wire  _GEN_314 = _T_10 ? 1'h0 : _GEN_177; // @[Conditional.scala 40:58]
  wire  _GEN_315 = _T_10 ? 1'h0 : _GEN_178; // @[Conditional.scala 40:58]
  wire  _GEN_316 = _T_10 ? 1'h0 : _GEN_179; // @[Conditional.scala 40:58]
  wire  _GEN_317 = _T_10 ? 1'h0 : _GEN_180; // @[Conditional.scala 40:58]
  wire  _GEN_318 = _T_10 ? 1'h0 : _GEN_181; // @[Conditional.scala 40:58]
  wire  _GEN_319 = _T_10 ? 1'h0 : _GEN_182; // @[Conditional.scala 40:58]
  wire  _GEN_320 = _T_10 ? 1'h0 : _GEN_183; // @[Conditional.scala 40:58]
  wire  _GEN_321 = _T_10 ? 1'h0 : _GEN_184; // @[Conditional.scala 40:58]
  wire  _GEN_322 = _T_10 ? 1'h0 : _GEN_185; // @[Conditional.scala 40:58]
  wire  _GEN_323 = _T_10 ? 1'h0 : _GEN_186; // @[Conditional.scala 40:58]
  wire  _GEN_324 = _T_10 ? 1'h0 : _GEN_187; // @[Conditional.scala 40:58]
  wire  _GEN_325 = _T_10 ? 1'h0 : _GEN_188; // @[Conditional.scala 40:58]
  wire  _GEN_326 = _T_10 ? 1'h0 : _GEN_189; // @[Conditional.scala 40:58]
  wire  _GEN_327 = _T_10 ? 1'h0 : _GEN_190; // @[Conditional.scala 40:58]
  wire  _GEN_328 = _T_10 ? 1'h0 : _GEN_191; // @[Conditional.scala 40:58]
  wire  _GEN_329 = _T_10 ? 1'h0 : _GEN_192; // @[Conditional.scala 40:58]
  wire  _GEN_330 = _T_10 ? 1'h0 : _GEN_193; // @[Conditional.scala 40:58]
  wire  _GEN_331 = _T_10 ? 1'h0 : _GEN_194; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 82:37]
  wire [5:0] _GEN_332 = _T_10 ? 6'h0 : _GEN_195; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 84:37]
  wire  _GEN_333 = _T_10 ? 1'h0 : _GEN_196; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [9:0] _GEN_334 = _T_10 ? 10'h0 : _GEN_197; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 103:40]
  wire [11:0] _GEN_335 = _T_10 ? $signed(12'sh0) : $signed(_GEN_198); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_336 = _T_10 ? 1'h0 : _GEN_199; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_338 = _T_10 ? $signed(12'sh0) : $signed(_GEN_201); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_339 = _T_10 ? 1'h0 : _GEN_202; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_341 = _T_10 ? $signed(12'sh0) : $signed(_GEN_204); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_342 = _T_10 ? 1'h0 : _GEN_205; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_344 = _T_10 ? $signed(12'sh0) : $signed(_GEN_207); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_345 = _T_10 ? 1'h0 : _GEN_208; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_347 = _T_10 ? $signed(12'sh0) : $signed(_GEN_210); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_348 = _T_10 ? 1'h0 : _GEN_211; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_350 = _T_10 ? $signed(12'sh0) : $signed(_GEN_213); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_351 = _T_10 ? 1'h0 : _GEN_214; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_353 = _T_10 ? $signed(12'sh0) : $signed(_GEN_216); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_354 = _T_10 ? 1'h0 : _GEN_217; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_356 = _T_10 ? $signed(12'sh0) : $signed(_GEN_219); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_357 = _T_10 ? 1'h0 : _GEN_220; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_359 = _T_10 ? $signed(12'sh0) : $signed(_GEN_222); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_360 = _T_10 ? 1'h0 : _GEN_223; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_362 = _T_10 ? $signed(12'sh0) : $signed(_GEN_225); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_363 = _T_10 ? 1'h0 : _GEN_226; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_365 = _T_10 ? $signed(12'sh0) : $signed(_GEN_228); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_366 = _T_10 ? 1'h0 : _GEN_229; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_368 = _T_10 ? $signed(12'sh0) : $signed(_GEN_231); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_369 = _T_10 ? 1'h0 : _GEN_232; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_371 = _T_10 ? $signed(12'sh0) : $signed(_GEN_234); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_372 = _T_10 ? 1'h0 : _GEN_235; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_374 = _T_10 ? $signed(12'sh0) : $signed(_GEN_237); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_375 = _T_10 ? 1'h0 : _GEN_238; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_377 = _T_10 ? $signed(12'sh0) : $signed(_GEN_240); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_378 = _T_10 ? 1'h0 : _GEN_241; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_380 = _T_10 ? $signed(12'sh0) : $signed(_GEN_243); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_381 = _T_10 ? 1'h0 : _GEN_244; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_383 = _T_10 ? $signed(12'sh0) : $signed(_GEN_246); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_384 = _T_10 ? 1'h0 : _GEN_247; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_386 = _T_10 ? $signed(12'sh0) : $signed(_GEN_249); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_387 = _T_10 ? 1'h0 : _GEN_250; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_389 = _T_10 ? $signed(12'sh0) : $signed(_GEN_252); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_390 = _T_10 ? 1'h0 : _GEN_253; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_392 = _T_10 ? $signed(12'sh0) : $signed(_GEN_255); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_393 = _T_10 ? 1'h0 : _GEN_256; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_395 = _T_10 ? $signed(12'sh0) : $signed(_GEN_258); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_396 = _T_10 ? 1'h0 : _GEN_259; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_398 = _T_10 ? $signed(12'sh0) : $signed(_GEN_261); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_399 = _T_10 ? 1'h0 : _GEN_262; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_401 = _T_10 ? $signed(12'sh0) : $signed(_GEN_264); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_402 = _T_10 ? 1'h0 : _GEN_265; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_404 = _T_10 ? $signed(12'sh0) : $signed(_GEN_267); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_405 = _T_10 ? 1'h0 : _GEN_268; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_407 = _T_10 ? $signed(12'sh0) : $signed(_GEN_270); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_408 = _T_10 ? 1'h0 : _GEN_271; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_410 = _T_10 ? $signed(12'sh0) : $signed(_GEN_273); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_411 = _T_10 ? 1'h0 : _GEN_274; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_413 = _T_10 ? $signed(12'sh0) : $signed(_GEN_276); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_414 = _T_10 ? 1'h0 : _GEN_277; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_416 = _T_10 ? $signed(12'sh0) : $signed(_GEN_279); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_417 = _T_10 ? 1'h0 : _GEN_280; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_419 = _T_10 ? $signed(12'sh0) : $signed(_GEN_282); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_420 = _T_10 ? 1'h0 : _GEN_283; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_422 = _T_10 ? $signed(12'sh0) : $signed(_GEN_285); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_423 = _T_10 ? 1'h0 : _GEN_286; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_425 = _T_10 ? $signed(12'sh0) : $signed(_GEN_288); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_426 = _T_10 ? 1'h0 : _GEN_289; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 106:40]
  wire [11:0] _GEN_428 = _T_10 ? $signed(12'sh0) : $signed(_GEN_291); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 107:40]
  wire [12:0] _matrixRowCounter_T_1 = matrixRowCounter + 13'h1; // @[DQNAcceleratorBlackBox.scala 289:57]
  wire [12:0] _GEN_429 = adderTree_io_sumValid ? _matrixRowCounter_T_1 : _GEN_18; // @[DQNAcceleratorBlackBox.scala 288:38 DQNAcceleratorBlackBox.scala 289:37]
  wire  _GEN_430 = adderTree_io_sumValid; // @[DQNAcceleratorBlackBox.scala 288:38 DQNAcceleratorBlackBox.scala 290:37 DQNAcceleratorBlackBox.scala 81:37]
  wire [12:0] _colBanksCounter_T_1 = colBanksCounter + 13'h1; // @[DQNAcceleratorBlackBox.scala 299:66]
  wire  _GEN_433 = colBanksCounter == VoutSizeReg ? 1'h0 : 1'h1; // @[DQNAcceleratorBlackBox.scala 292:50 DQNAcceleratorBlackBox.scala 80:37 DQNAcceleratorBlackBox.scala 297:47]
  wire [12:0] _GEN_434 = colBanksCounter == VoutSizeReg ? _GEN_17 : _colBanksCounter_T_1; // @[DQNAcceleratorBlackBox.scala 292:50 DQNAcceleratorBlackBox.scala 299:47]
  wire [12:0] _GEN_1734 = {{1'd0}, MinAddr}; // @[DQNAcceleratorBlackBox.scala 303:60]
  wire [12:0] _T_147 = _GEN_1734 + colBanksCounter; // @[DQNAcceleratorBlackBox.scala 303:60]
  wire [9:0] _GEN_435 = rdWrEnaFlip ? $signed(activationBlock_io_activation_0) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_436 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_0; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire [9:0] _GEN_437 = rdWrEnaFlip ? vinAddr : 10'h0; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 322:51 DQNAcceleratorBlackBox.scala 103:40]
  wire  _GEN_439 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_0; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_440 = rdWrEnaFlip ? 10'h0 : vinAddr; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 104:40 DQNAcceleratorBlackBox.scala 326:50]
  wire [9:0] _GEN_441 = rdWrEnaFlip ? $signed(activationBlock_io_activation_1) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_442 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_1; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_444 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_1; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_445 = rdWrEnaFlip ? $signed(activationBlock_io_activation_2) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_446 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_2; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_448 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_2; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_449 = rdWrEnaFlip ? $signed(activationBlock_io_activation_3) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_450 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_3; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_452 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_3; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_453 = rdWrEnaFlip ? $signed(activationBlock_io_activation_4) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_454 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_4; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_456 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_4; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_457 = rdWrEnaFlip ? $signed(activationBlock_io_activation_5) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_458 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_5; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_460 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_5; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_461 = rdWrEnaFlip ? $signed(activationBlock_io_activation_6) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_462 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_6; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_464 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_6; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_465 = rdWrEnaFlip ? $signed(activationBlock_io_activation_7) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_466 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_7; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_468 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_7; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_469 = rdWrEnaFlip ? $signed(activationBlock_io_activation_8) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_470 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_8; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_472 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_8; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_473 = rdWrEnaFlip ? $signed(activationBlock_io_activation_9) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_474 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_9; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_476 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_9; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_477 = rdWrEnaFlip ? $signed(activationBlock_io_activation_10) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_478 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_10; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_480 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_10; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_481 = rdWrEnaFlip ? $signed(activationBlock_io_activation_11) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_482 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_11; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_484 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_11; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_485 = rdWrEnaFlip ? $signed(activationBlock_io_activation_12) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_486 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_12; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_488 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_12; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_489 = rdWrEnaFlip ? $signed(activationBlock_io_activation_13) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_490 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_13; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_492 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_13; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_493 = rdWrEnaFlip ? $signed(activationBlock_io_activation_14) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_494 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_14; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_496 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_14; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_497 = rdWrEnaFlip ? $signed(activationBlock_io_activation_15) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_498 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_15; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_500 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_15; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_501 = rdWrEnaFlip ? $signed(activationBlock_io_activation_16) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_502 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_16; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_504 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_16; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_505 = rdWrEnaFlip ? $signed(activationBlock_io_activation_17) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_506 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_17; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_508 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_17; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_509 = rdWrEnaFlip ? $signed(activationBlock_io_activation_18) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_510 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_18; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_512 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_18; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_513 = rdWrEnaFlip ? $signed(activationBlock_io_activation_19) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_514 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_19; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_516 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_19; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_517 = rdWrEnaFlip ? $signed(activationBlock_io_activation_20) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_518 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_20; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_520 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_20; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_521 = rdWrEnaFlip ? $signed(activationBlock_io_activation_21) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_522 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_21; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_524 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_21; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_525 = rdWrEnaFlip ? $signed(activationBlock_io_activation_22) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_526 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_22; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_528 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_22; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_529 = rdWrEnaFlip ? $signed(activationBlock_io_activation_23) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_530 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_23; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_532 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_23; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_533 = rdWrEnaFlip ? $signed(activationBlock_io_activation_24) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_534 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_24; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_536 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_24; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_537 = rdWrEnaFlip ? $signed(activationBlock_io_activation_25) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_538 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_25; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_540 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_25; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_541 = rdWrEnaFlip ? $signed(activationBlock_io_activation_26) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_542 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_26; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_544 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_26; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_545 = rdWrEnaFlip ? $signed(activationBlock_io_activation_27) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_546 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_27; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_548 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_27; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_549 = rdWrEnaFlip ? $signed(activationBlock_io_activation_28) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_550 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_28; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_552 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_28; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_553 = rdWrEnaFlip ? $signed(activationBlock_io_activation_29) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_554 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_29; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_556 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_29; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_557 = rdWrEnaFlip ? $signed(activationBlock_io_activation_30) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_558 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_30; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_560 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_30; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_561 = rdWrEnaFlip ? $signed(activationBlock_io_activation_31) : $signed(10'sh0); // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 320:51 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_562 = rdWrEnaFlip & memReadDecoder_io_activatedSignals_31; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 321:51 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_564 = rdWrEnaFlip ? 1'h0 : memReadDecoder_io_activatedSignals_31; // @[DQNAcceleratorBlackBox.scala 319:30 DQNAcceleratorBlackBox.scala 105:40 DQNAcceleratorBlackBox.scala 325:50]
  wire [9:0] _GEN_565 = io_terminate ? instructionRegister[26:17] : instructionRegister[16:7]; // @[DQNAcceleratorBlackBox.scala 342:29 DQNAcceleratorBlackBox.scala 343:23 DQNAcceleratorBlackBox.scala 345:23]
  wire [9:0] _GEN_567 = _T_141 ? _GEN_565 : 10'h0; // @[Conditional.scala 39:67]
  wire  _GEN_570 = _T_12 & _instructionDone_T; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 332:42 DQNAcceleratorBlackBox.scala 79:37]
  wire [2:0] _GEN_572 = _T_12 ? instructionRegister[16:14] : 3'h0; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 334:42 DQNAcceleratorBlackBox.scala 84:37]
  wire [9:0] _GEN_573 = _T_12 ? instructionRegister[26:17] : 10'h0; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 336:48 DQNAcceleratorBlackBox.scala 104:40]
  wire  _GEN_574 = _T_12 & memReadDecoder_io_activatedSignals_0; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_576 = _T_12 & memReadDecoder_io_activatedSignals_1; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_578 = _T_12 & memReadDecoder_io_activatedSignals_2; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_580 = _T_12 & memReadDecoder_io_activatedSignals_3; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_582 = _T_12 & memReadDecoder_io_activatedSignals_4; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_584 = _T_12 & memReadDecoder_io_activatedSignals_5; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_586 = _T_12 & memReadDecoder_io_activatedSignals_6; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_588 = _T_12 & memReadDecoder_io_activatedSignals_7; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_590 = _T_12 & memReadDecoder_io_activatedSignals_8; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_592 = _T_12 & memReadDecoder_io_activatedSignals_9; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_594 = _T_12 & memReadDecoder_io_activatedSignals_10; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_596 = _T_12 & memReadDecoder_io_activatedSignals_11; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_598 = _T_12 & memReadDecoder_io_activatedSignals_12; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_600 = _T_12 & memReadDecoder_io_activatedSignals_13; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_602 = _T_12 & memReadDecoder_io_activatedSignals_14; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_604 = _T_12 & memReadDecoder_io_activatedSignals_15; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_606 = _T_12 & memReadDecoder_io_activatedSignals_16; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_608 = _T_12 & memReadDecoder_io_activatedSignals_17; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_610 = _T_12 & memReadDecoder_io_activatedSignals_18; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_612 = _T_12 & memReadDecoder_io_activatedSignals_19; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_614 = _T_12 & memReadDecoder_io_activatedSignals_20; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_616 = _T_12 & memReadDecoder_io_activatedSignals_21; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_618 = _T_12 & memReadDecoder_io_activatedSignals_22; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_620 = _T_12 & memReadDecoder_io_activatedSignals_23; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_622 = _T_12 & memReadDecoder_io_activatedSignals_24; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_624 = _T_12 & memReadDecoder_io_activatedSignals_25; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_626 = _T_12 & memReadDecoder_io_activatedSignals_26; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_628 = _T_12 & memReadDecoder_io_activatedSignals_27; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_630 = _T_12 & memReadDecoder_io_activatedSignals_28; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_632 = _T_12 & memReadDecoder_io_activatedSignals_29; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_634 = _T_12 & memReadDecoder_io_activatedSignals_30; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_636 = _T_12 & memReadDecoder_io_activatedSignals_31; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 337:48 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_637 = _T_12 ? 1'h0 : _T_141; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_638 = _T_12 ? 10'h0 : _GEN_567; // @[Conditional.scala 39:67]
  wire  _GEN_639 = _T_11 ? _instructionDone_T : rdWrEnaFlip; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 313:36 DQNAcceleratorBlackBox.scala 65:34]
  wire  _GEN_640 = _T_11 & rdWrEnaFlip; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 314:36 DQNAcceleratorBlackBox.scala 85:37]
  wire  _GEN_641 = _T_11 | _T_12; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 315:36]
  wire [4:0] _GEN_642 = _T_11 ? vinSize : {{2'd0}, _GEN_572}; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 316:36]
  wire [9:0] _GEN_643 = _T_11 ? $signed(_GEN_435) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_644 = _T_11 & _GEN_436; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire [9:0] _GEN_645 = _T_11 ? _GEN_437 : 10'h0; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 103:40]
  wire  _GEN_647 = _T_11 ? _GEN_439 : _GEN_574; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_648 = _T_11 ? _GEN_440 : _GEN_573; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_649 = _T_11 ? $signed(_GEN_441) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_650 = _T_11 & _GEN_442; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_651 = _T_11 ? _GEN_444 : _GEN_576; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_653 = _T_11 ? $signed(_GEN_445) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_654 = _T_11 & _GEN_446; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_655 = _T_11 ? _GEN_448 : _GEN_578; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_657 = _T_11 ? $signed(_GEN_449) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_658 = _T_11 & _GEN_450; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_659 = _T_11 ? _GEN_452 : _GEN_580; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_661 = _T_11 ? $signed(_GEN_453) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_662 = _T_11 & _GEN_454; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_663 = _T_11 ? _GEN_456 : _GEN_582; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_665 = _T_11 ? $signed(_GEN_457) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_666 = _T_11 & _GEN_458; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_667 = _T_11 ? _GEN_460 : _GEN_584; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_669 = _T_11 ? $signed(_GEN_461) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_670 = _T_11 & _GEN_462; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_671 = _T_11 ? _GEN_464 : _GEN_586; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_673 = _T_11 ? $signed(_GEN_465) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_674 = _T_11 & _GEN_466; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_675 = _T_11 ? _GEN_468 : _GEN_588; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_677 = _T_11 ? $signed(_GEN_469) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_678 = _T_11 & _GEN_470; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_679 = _T_11 ? _GEN_472 : _GEN_590; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_681 = _T_11 ? $signed(_GEN_473) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_682 = _T_11 & _GEN_474; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_683 = _T_11 ? _GEN_476 : _GEN_592; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_685 = _T_11 ? $signed(_GEN_477) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_686 = _T_11 & _GEN_478; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_687 = _T_11 ? _GEN_480 : _GEN_594; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_689 = _T_11 ? $signed(_GEN_481) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_690 = _T_11 & _GEN_482; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_691 = _T_11 ? _GEN_484 : _GEN_596; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_693 = _T_11 ? $signed(_GEN_485) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_694 = _T_11 & _GEN_486; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_695 = _T_11 ? _GEN_488 : _GEN_598; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_697 = _T_11 ? $signed(_GEN_489) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_698 = _T_11 & _GEN_490; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_699 = _T_11 ? _GEN_492 : _GEN_600; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_701 = _T_11 ? $signed(_GEN_493) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_702 = _T_11 & _GEN_494; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_703 = _T_11 ? _GEN_496 : _GEN_602; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_705 = _T_11 ? $signed(_GEN_497) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_706 = _T_11 & _GEN_498; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_707 = _T_11 ? _GEN_500 : _GEN_604; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_709 = _T_11 ? $signed(_GEN_501) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_710 = _T_11 & _GEN_502; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_711 = _T_11 ? _GEN_504 : _GEN_606; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_713 = _T_11 ? $signed(_GEN_505) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_714 = _T_11 & _GEN_506; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_715 = _T_11 ? _GEN_508 : _GEN_608; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_717 = _T_11 ? $signed(_GEN_509) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_718 = _T_11 & _GEN_510; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_719 = _T_11 ? _GEN_512 : _GEN_610; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_721 = _T_11 ? $signed(_GEN_513) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_722 = _T_11 & _GEN_514; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_723 = _T_11 ? _GEN_516 : _GEN_612; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_725 = _T_11 ? $signed(_GEN_517) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_726 = _T_11 & _GEN_518; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_727 = _T_11 ? _GEN_520 : _GEN_614; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_729 = _T_11 ? $signed(_GEN_521) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_730 = _T_11 & _GEN_522; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_731 = _T_11 ? _GEN_524 : _GEN_616; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_733 = _T_11 ? $signed(_GEN_525) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_734 = _T_11 & _GEN_526; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_735 = _T_11 ? _GEN_528 : _GEN_618; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_737 = _T_11 ? $signed(_GEN_529) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_738 = _T_11 & _GEN_530; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_739 = _T_11 ? _GEN_532 : _GEN_620; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_741 = _T_11 ? $signed(_GEN_533) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_742 = _T_11 & _GEN_534; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_743 = _T_11 ? _GEN_536 : _GEN_622; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_745 = _T_11 ? $signed(_GEN_537) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_746 = _T_11 & _GEN_538; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_747 = _T_11 ? _GEN_540 : _GEN_624; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_749 = _T_11 ? $signed(_GEN_541) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_750 = _T_11 & _GEN_542; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_751 = _T_11 ? _GEN_544 : _GEN_626; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_753 = _T_11 ? $signed(_GEN_545) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_754 = _T_11 & _GEN_546; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_755 = _T_11 ? _GEN_548 : _GEN_628; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_757 = _T_11 ? $signed(_GEN_549) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_758 = _T_11 & _GEN_550; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_759 = _T_11 ? _GEN_552 : _GEN_630; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_761 = _T_11 ? $signed(_GEN_553) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_762 = _T_11 & _GEN_554; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_763 = _T_11 ? _GEN_556 : _GEN_632; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_765 = _T_11 ? $signed(_GEN_557) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_766 = _T_11 & _GEN_558; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_767 = _T_11 ? _GEN_560 : _GEN_634; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_769 = _T_11 ? $signed(_GEN_561) : $signed(10'sh0); // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_770 = _T_11 & _GEN_562; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_771 = _T_11 ? _GEN_564 : _GEN_636; // @[Conditional.scala 39:67]
  wire  _GEN_773 = _T_11 ? 1'h0 : _GEN_570; // @[Conditional.scala 39:67 DQNAcceleratorBlackBox.scala 79:37]
  wire  _GEN_774 = _T_11 ? 1'h0 : _GEN_637; // @[Conditional.scala 39:67]
  wire [9:0] _GEN_775 = _T_11 ? 10'h0 : _GEN_638; // @[Conditional.scala 39:67]
  wire [13:0] _GEN_776 = _T_10 ? VinSizeReg : {{9'd0}, _GEN_642}; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 286:37]
  wire [12:0] _GEN_777 = _T_10 ? matrixRowCounter : 13'h0; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 287:37 DQNAcceleratorBlackBox.scala 83:37]
  wire [12:0] _GEN_778 = _T_10 ? _GEN_429 : _GEN_18; // @[Conditional.scala 40:58]
  wire  _GEN_779 = _T_10 & _GEN_430; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 81:37]
  wire  _GEN_781 = _T_10 & _GEN_433; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 80:37]
  wire  _GEN_782 = _T_10 ? _GEN_433 : _GEN_641; // @[Conditional.scala 40:58]
  wire [12:0] _GEN_783 = _T_10 ? _GEN_434 : _GEN_17; // @[Conditional.scala 40:58]
  wire [12:0] _GEN_784 = _T_10 ? _T_147 : 13'h0; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 303:49 DQNAcceleratorBlackBox.scala 98:34]
  wire  _GEN_785 = _T_10 & memReadDecoder_io_activatedSignals_0; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_786 = _T_10 ? memReadDecoder_io_activatedSignals_0 : _GEN_647; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [9:0] _GEN_787 = _T_10 ? {{5'd0}, VinAddr} : _GEN_648; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 306:49]
  wire [10:0] _GEN_788 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_643[9]}},_GEN_643}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire [9:0] _GEN_789 = _T_10 ? {{3'd0}, VoutAddr} : _GEN_645; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 308:49]
  wire  _GEN_790 = _T_10 ? oneHotDecoder_io_writeSignal_0 : _GEN_644; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_792 = _T_10 & memReadDecoder_io_activatedSignals_1; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_793 = _T_10 ? memReadDecoder_io_activatedSignals_1 : _GEN_651; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_795 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_649[9]}},_GEN_649}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_796 = _T_10 ? oneHotDecoder_io_writeSignal_1 : _GEN_650; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_798 = _T_10 & memReadDecoder_io_activatedSignals_2; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_799 = _T_10 ? memReadDecoder_io_activatedSignals_2 : _GEN_655; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_801 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_653[9]}},_GEN_653}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_802 = _T_10 ? oneHotDecoder_io_writeSignal_2 : _GEN_654; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_804 = _T_10 & memReadDecoder_io_activatedSignals_3; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_805 = _T_10 ? memReadDecoder_io_activatedSignals_3 : _GEN_659; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_807 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_657[9]}},_GEN_657}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_808 = _T_10 ? oneHotDecoder_io_writeSignal_3 : _GEN_658; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_810 = _T_10 & memReadDecoder_io_activatedSignals_4; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_811 = _T_10 ? memReadDecoder_io_activatedSignals_4 : _GEN_663; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_813 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_661[9]}},_GEN_661}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_814 = _T_10 ? oneHotDecoder_io_writeSignal_4 : _GEN_662; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_816 = _T_10 & memReadDecoder_io_activatedSignals_5; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_817 = _T_10 ? memReadDecoder_io_activatedSignals_5 : _GEN_667; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_819 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_665[9]}},_GEN_665}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_820 = _T_10 ? oneHotDecoder_io_writeSignal_5 : _GEN_666; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_822 = _T_10 & memReadDecoder_io_activatedSignals_6; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_823 = _T_10 ? memReadDecoder_io_activatedSignals_6 : _GEN_671; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_825 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_669[9]}},_GEN_669}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_826 = _T_10 ? oneHotDecoder_io_writeSignal_6 : _GEN_670; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_828 = _T_10 & memReadDecoder_io_activatedSignals_7; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_829 = _T_10 ? memReadDecoder_io_activatedSignals_7 : _GEN_675; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_831 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_673[9]}},_GEN_673}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_832 = _T_10 ? oneHotDecoder_io_writeSignal_7 : _GEN_674; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_834 = _T_10 & memReadDecoder_io_activatedSignals_8; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_835 = _T_10 ? memReadDecoder_io_activatedSignals_8 : _GEN_679; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_837 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_677[9]}},_GEN_677}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_838 = _T_10 ? oneHotDecoder_io_writeSignal_8 : _GEN_678; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_840 = _T_10 & memReadDecoder_io_activatedSignals_9; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_841 = _T_10 ? memReadDecoder_io_activatedSignals_9 : _GEN_683; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_843 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_681[9]}},_GEN_681}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_844 = _T_10 ? oneHotDecoder_io_writeSignal_9 : _GEN_682; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_846 = _T_10 & memReadDecoder_io_activatedSignals_10; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_847 = _T_10 ? memReadDecoder_io_activatedSignals_10 : _GEN_687; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_849 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_685[9]}},_GEN_685}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_850 = _T_10 ? oneHotDecoder_io_writeSignal_10 : _GEN_686; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_852 = _T_10 & memReadDecoder_io_activatedSignals_11; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_853 = _T_10 ? memReadDecoder_io_activatedSignals_11 : _GEN_691; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_855 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_689[9]}},_GEN_689}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_856 = _T_10 ? oneHotDecoder_io_writeSignal_11 : _GEN_690; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_858 = _T_10 & memReadDecoder_io_activatedSignals_12; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_859 = _T_10 ? memReadDecoder_io_activatedSignals_12 : _GEN_695; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_861 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_693[9]}},_GEN_693}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_862 = _T_10 ? oneHotDecoder_io_writeSignal_12 : _GEN_694; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_864 = _T_10 & memReadDecoder_io_activatedSignals_13; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_865 = _T_10 ? memReadDecoder_io_activatedSignals_13 : _GEN_699; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_867 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_697[9]}},_GEN_697}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_868 = _T_10 ? oneHotDecoder_io_writeSignal_13 : _GEN_698; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_870 = _T_10 & memReadDecoder_io_activatedSignals_14; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_871 = _T_10 ? memReadDecoder_io_activatedSignals_14 : _GEN_703; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_873 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_701[9]}},_GEN_701}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_874 = _T_10 ? oneHotDecoder_io_writeSignal_14 : _GEN_702; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_876 = _T_10 & memReadDecoder_io_activatedSignals_15; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_877 = _T_10 ? memReadDecoder_io_activatedSignals_15 : _GEN_707; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_879 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_705[9]}},_GEN_705}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_880 = _T_10 ? oneHotDecoder_io_writeSignal_15 : _GEN_706; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_882 = _T_10 & memReadDecoder_io_activatedSignals_16; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_883 = _T_10 ? memReadDecoder_io_activatedSignals_16 : _GEN_711; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_885 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_709[9]}},_GEN_709}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_886 = _T_10 ? oneHotDecoder_io_writeSignal_16 : _GEN_710; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_888 = _T_10 & memReadDecoder_io_activatedSignals_17; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_889 = _T_10 ? memReadDecoder_io_activatedSignals_17 : _GEN_715; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_891 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_713[9]}},_GEN_713}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_892 = _T_10 ? oneHotDecoder_io_writeSignal_17 : _GEN_714; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_894 = _T_10 & memReadDecoder_io_activatedSignals_18; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_895 = _T_10 ? memReadDecoder_io_activatedSignals_18 : _GEN_719; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_897 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_717[9]}},_GEN_717}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_898 = _T_10 ? oneHotDecoder_io_writeSignal_18 : _GEN_718; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_900 = _T_10 & memReadDecoder_io_activatedSignals_19; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_901 = _T_10 ? memReadDecoder_io_activatedSignals_19 : _GEN_723; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_903 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_721[9]}},_GEN_721}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_904 = _T_10 ? oneHotDecoder_io_writeSignal_19 : _GEN_722; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_906 = _T_10 & memReadDecoder_io_activatedSignals_20; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_907 = _T_10 ? memReadDecoder_io_activatedSignals_20 : _GEN_727; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_909 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_725[9]}},_GEN_725}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_910 = _T_10 ? oneHotDecoder_io_writeSignal_20 : _GEN_726; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_912 = _T_10 & memReadDecoder_io_activatedSignals_21; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_913 = _T_10 ? memReadDecoder_io_activatedSignals_21 : _GEN_731; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_915 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_729[9]}},_GEN_729}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_916 = _T_10 ? oneHotDecoder_io_writeSignal_21 : _GEN_730; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_918 = _T_10 & memReadDecoder_io_activatedSignals_22; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_919 = _T_10 ? memReadDecoder_io_activatedSignals_22 : _GEN_735; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_921 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_733[9]}},_GEN_733}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_922 = _T_10 ? oneHotDecoder_io_writeSignal_22 : _GEN_734; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_924 = _T_10 & memReadDecoder_io_activatedSignals_23; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_925 = _T_10 ? memReadDecoder_io_activatedSignals_23 : _GEN_739; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_927 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_737[9]}},_GEN_737}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_928 = _T_10 ? oneHotDecoder_io_writeSignal_23 : _GEN_738; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_930 = _T_10 & memReadDecoder_io_activatedSignals_24; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_931 = _T_10 ? memReadDecoder_io_activatedSignals_24 : _GEN_743; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_933 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_741[9]}},_GEN_741}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_934 = _T_10 ? oneHotDecoder_io_writeSignal_24 : _GEN_742; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_936 = _T_10 & memReadDecoder_io_activatedSignals_25; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_937 = _T_10 ? memReadDecoder_io_activatedSignals_25 : _GEN_747; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_939 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_745[9]}},_GEN_745}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_940 = _T_10 ? oneHotDecoder_io_writeSignal_25 : _GEN_746; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_942 = _T_10 & memReadDecoder_io_activatedSignals_26; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_943 = _T_10 ? memReadDecoder_io_activatedSignals_26 : _GEN_751; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_945 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_749[9]}},_GEN_749}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_946 = _T_10 ? oneHotDecoder_io_writeSignal_26 : _GEN_750; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_948 = _T_10 & memReadDecoder_io_activatedSignals_27; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_949 = _T_10 ? memReadDecoder_io_activatedSignals_27 : _GEN_755; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_951 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_753[9]}},_GEN_753}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_952 = _T_10 ? oneHotDecoder_io_writeSignal_27 : _GEN_754; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_954 = _T_10 & memReadDecoder_io_activatedSignals_28; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_955 = _T_10 ? memReadDecoder_io_activatedSignals_28 : _GEN_759; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_957 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_757[9]}},_GEN_757}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_958 = _T_10 ? oneHotDecoder_io_writeSignal_28 : _GEN_758; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_960 = _T_10 & memReadDecoder_io_activatedSignals_29; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_961 = _T_10 ? memReadDecoder_io_activatedSignals_29 : _GEN_763; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_963 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_761[9]}},_GEN_761}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_964 = _T_10 ? oneHotDecoder_io_writeSignal_29 : _GEN_762; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_966 = _T_10 & memReadDecoder_io_activatedSignals_30; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_967 = _T_10 ? memReadDecoder_io_activatedSignals_30 : _GEN_767; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_969 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_765[9]}},_GEN_765}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_970 = _T_10 ? oneHotDecoder_io_writeSignal_30 : _GEN_766; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_972 = _T_10 & memReadDecoder_io_activatedSignals_31; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 304:49 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_973 = _T_10 ? memReadDecoder_io_activatedSignals_31 : _GEN_771; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 305:49]
  wire [10:0] _GEN_975 = _T_10 ? $signed(quantizedSum) : $signed({{1{_GEN_769[9]}},_GEN_769}); // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 307:49]
  wire  _GEN_976 = _T_10 ? oneHotDecoder_io_writeSignal_31 : _GEN_770; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 309:49]
  wire  _GEN_977 = _T_10 ? rdWrEnaFlip : _GEN_639; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 65:34]
  wire  _GEN_978 = _T_10 ? 1'h0 : _GEN_640; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 85:37]
  wire  _GEN_979 = _T_10 ? 1'h0 : _GEN_773; // @[Conditional.scala 40:58 DQNAcceleratorBlackBox.scala 79:37]
  wire  _GEN_980 = _T_10 ? 1'h0 : _GEN_774; // @[Conditional.scala 40:58]
  wire [9:0] _GEN_981 = _T_10 ? 10'h0 : _GEN_775; // @[Conditional.scala 40:58]
  wire [13:0] _GEN_982 = op == 2'h0 ? _GEN_776 : 14'h0; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 84:37]
  wire [12:0] _GEN_983 = op == 2'h0 ? _GEN_777 : 13'h0; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 83:37]
  wire  _GEN_985 = op == 2'h0 & _GEN_779; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 81:37]
  wire  _GEN_987 = op == 2'h0 & _GEN_781; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 80:37]
  wire  _GEN_988 = op == 2'h0 & _GEN_782; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 82:37]
  wire [12:0] _GEN_990 = op == 2'h0 ? _GEN_784 : 13'h0; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 98:34]
  wire  _GEN_991 = op == 2'h0 & _GEN_785; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_992 = op == 2'h0 & _GEN_786; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [9:0] _GEN_993 = op == 2'h0 ? _GEN_787 : 10'h0; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 104:40]
  wire [10:0] _GEN_994 = op == 2'h0 ? $signed(_GEN_788) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire [9:0] _GEN_995 = op == 2'h0 ? _GEN_789 : 10'h0; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 103:40]
  wire  _GEN_996 = op == 2'h0 & _GEN_790; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_998 = op == 2'h0 & _GEN_792; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_999 = op == 2'h0 & _GEN_793; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1001 = op == 2'h0 ? $signed(_GEN_795) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1002 = op == 2'h0 & _GEN_796; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1004 = op == 2'h0 & _GEN_798; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1005 = op == 2'h0 & _GEN_799; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1007 = op == 2'h0 ? $signed(_GEN_801) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1008 = op == 2'h0 & _GEN_802; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1010 = op == 2'h0 & _GEN_804; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1011 = op == 2'h0 & _GEN_805; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1013 = op == 2'h0 ? $signed(_GEN_807) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1014 = op == 2'h0 & _GEN_808; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1016 = op == 2'h0 & _GEN_810; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1017 = op == 2'h0 & _GEN_811; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1019 = op == 2'h0 ? $signed(_GEN_813) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1020 = op == 2'h0 & _GEN_814; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1022 = op == 2'h0 & _GEN_816; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1023 = op == 2'h0 & _GEN_817; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1025 = op == 2'h0 ? $signed(_GEN_819) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1026 = op == 2'h0 & _GEN_820; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1028 = op == 2'h0 & _GEN_822; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1029 = op == 2'h0 & _GEN_823; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1031 = op == 2'h0 ? $signed(_GEN_825) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1032 = op == 2'h0 & _GEN_826; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1034 = op == 2'h0 & _GEN_828; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1035 = op == 2'h0 & _GEN_829; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1037 = op == 2'h0 ? $signed(_GEN_831) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1038 = op == 2'h0 & _GEN_832; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1040 = op == 2'h0 & _GEN_834; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1041 = op == 2'h0 & _GEN_835; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1043 = op == 2'h0 ? $signed(_GEN_837) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1044 = op == 2'h0 & _GEN_838; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1046 = op == 2'h0 & _GEN_840; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1047 = op == 2'h0 & _GEN_841; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1049 = op == 2'h0 ? $signed(_GEN_843) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1050 = op == 2'h0 & _GEN_844; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1052 = op == 2'h0 & _GEN_846; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1053 = op == 2'h0 & _GEN_847; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1055 = op == 2'h0 ? $signed(_GEN_849) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1056 = op == 2'h0 & _GEN_850; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1058 = op == 2'h0 & _GEN_852; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1059 = op == 2'h0 & _GEN_853; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1061 = op == 2'h0 ? $signed(_GEN_855) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1062 = op == 2'h0 & _GEN_856; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1064 = op == 2'h0 & _GEN_858; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1065 = op == 2'h0 & _GEN_859; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1067 = op == 2'h0 ? $signed(_GEN_861) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1068 = op == 2'h0 & _GEN_862; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1070 = op == 2'h0 & _GEN_864; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1071 = op == 2'h0 & _GEN_865; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1073 = op == 2'h0 ? $signed(_GEN_867) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1074 = op == 2'h0 & _GEN_868; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1076 = op == 2'h0 & _GEN_870; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1077 = op == 2'h0 & _GEN_871; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1079 = op == 2'h0 ? $signed(_GEN_873) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1080 = op == 2'h0 & _GEN_874; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1082 = op == 2'h0 & _GEN_876; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1083 = op == 2'h0 & _GEN_877; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1085 = op == 2'h0 ? $signed(_GEN_879) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1086 = op == 2'h0 & _GEN_880; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1088 = op == 2'h0 & _GEN_882; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1089 = op == 2'h0 & _GEN_883; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1091 = op == 2'h0 ? $signed(_GEN_885) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1092 = op == 2'h0 & _GEN_886; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1094 = op == 2'h0 & _GEN_888; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1095 = op == 2'h0 & _GEN_889; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1097 = op == 2'h0 ? $signed(_GEN_891) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1098 = op == 2'h0 & _GEN_892; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1100 = op == 2'h0 & _GEN_894; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1101 = op == 2'h0 & _GEN_895; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1103 = op == 2'h0 ? $signed(_GEN_897) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1104 = op == 2'h0 & _GEN_898; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1106 = op == 2'h0 & _GEN_900; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1107 = op == 2'h0 & _GEN_901; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1109 = op == 2'h0 ? $signed(_GEN_903) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1110 = op == 2'h0 & _GEN_904; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1112 = op == 2'h0 & _GEN_906; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1113 = op == 2'h0 & _GEN_907; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1115 = op == 2'h0 ? $signed(_GEN_909) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1116 = op == 2'h0 & _GEN_910; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1118 = op == 2'h0 & _GEN_912; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1119 = op == 2'h0 & _GEN_913; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1121 = op == 2'h0 ? $signed(_GEN_915) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1122 = op == 2'h0 & _GEN_916; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1124 = op == 2'h0 & _GEN_918; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1125 = op == 2'h0 & _GEN_919; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1127 = op == 2'h0 ? $signed(_GEN_921) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1128 = op == 2'h0 & _GEN_922; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1130 = op == 2'h0 & _GEN_924; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1131 = op == 2'h0 & _GEN_925; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1133 = op == 2'h0 ? $signed(_GEN_927) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1134 = op == 2'h0 & _GEN_928; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1136 = op == 2'h0 & _GEN_930; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1137 = op == 2'h0 & _GEN_931; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1139 = op == 2'h0 ? $signed(_GEN_933) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1140 = op == 2'h0 & _GEN_934; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1142 = op == 2'h0 & _GEN_936; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1143 = op == 2'h0 & _GEN_937; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1145 = op == 2'h0 ? $signed(_GEN_939) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1146 = op == 2'h0 & _GEN_940; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1148 = op == 2'h0 & _GEN_942; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1149 = op == 2'h0 & _GEN_943; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1151 = op == 2'h0 ? $signed(_GEN_945) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1152 = op == 2'h0 & _GEN_946; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1154 = op == 2'h0 & _GEN_948; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1155 = op == 2'h0 & _GEN_949; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1157 = op == 2'h0 ? $signed(_GEN_951) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1158 = op == 2'h0 & _GEN_952; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1160 = op == 2'h0 & _GEN_954; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1161 = op == 2'h0 & _GEN_955; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1163 = op == 2'h0 ? $signed(_GEN_957) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1164 = op == 2'h0 & _GEN_958; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1166 = op == 2'h0 & _GEN_960; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1167 = op == 2'h0 & _GEN_961; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1169 = op == 2'h0 ? $signed(_GEN_963) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1170 = op == 2'h0 & _GEN_964; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1172 = op == 2'h0 & _GEN_966; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1173 = op == 2'h0 & _GEN_967; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1175 = op == 2'h0 ? $signed(_GEN_969) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1176 = op == 2'h0 & _GEN_970; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1178 = op == 2'h0 & _GEN_972; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1179 = op == 2'h0 & _GEN_973; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 105:40]
  wire [10:0] _GEN_1181 = op == 2'h0 ? $signed(_GEN_975) : $signed(11'sh0); // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 107:40]
  wire  _GEN_1182 = op == 2'h0 & _GEN_976; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 106:40]
  wire  _GEN_1184 = op == 2'h0 & _GEN_978; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 85:37]
  wire  _GEN_1185 = op == 2'h0 & _GEN_979; // @[DQNAcceleratorBlackBox.scala 279:40 DQNAcceleratorBlackBox.scala 79:37]
  wire  _GEN_1186 = op == 2'h0 & _GEN_980; // @[DQNAcceleratorBlackBox.scala 279:40]
  wire [9:0] _GEN_1187 = op == 2'h0 ? _GEN_981 : 10'h0; // @[DQNAcceleratorBlackBox.scala 279:40]
  wire  _GEN_1191 = op == 2'h1 ? _GEN_295 : _GEN_985; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [12:0] _GEN_1192 = op == 2'h1 ? {{7'd0}, _GEN_296} : _GEN_983; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [9:0] _GEN_1193 = op == 2'h1 ? _GEN_297 : 10'h0; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1194 = op == 2'h1 ? $signed(_GEN_298) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1195 = op == 2'h1 & _GEN_299; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1196 = op == 2'h1 & _GEN_300; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1197 = op == 2'h1 & _GEN_301; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1198 = op == 2'h1 & _GEN_302; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1199 = op == 2'h1 & _GEN_303; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1200 = op == 2'h1 & _GEN_304; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1201 = op == 2'h1 & _GEN_305; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1202 = op == 2'h1 & _GEN_306; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1203 = op == 2'h1 & _GEN_307; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1204 = op == 2'h1 & _GEN_308; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1205 = op == 2'h1 & _GEN_309; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1206 = op == 2'h1 & _GEN_310; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1207 = op == 2'h1 & _GEN_311; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1208 = op == 2'h1 & _GEN_312; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1209 = op == 2'h1 & _GEN_313; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1210 = op == 2'h1 & _GEN_314; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1211 = op == 2'h1 & _GEN_315; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1212 = op == 2'h1 & _GEN_316; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1213 = op == 2'h1 & _GEN_317; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1214 = op == 2'h1 & _GEN_318; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1215 = op == 2'h1 & _GEN_319; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1216 = op == 2'h1 & _GEN_320; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1217 = op == 2'h1 & _GEN_321; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1218 = op == 2'h1 & _GEN_322; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1219 = op == 2'h1 & _GEN_323; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1220 = op == 2'h1 & _GEN_324; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1221 = op == 2'h1 & _GEN_325; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1222 = op == 2'h1 & _GEN_326; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1223 = op == 2'h1 & _GEN_327; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1224 = op == 2'h1 & _GEN_328; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1225 = op == 2'h1 & _GEN_329; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1226 = op == 2'h1 & _GEN_330; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1227 = op == 2'h1 ? _GEN_331 : _GEN_988; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [13:0] _GEN_1228 = op == 2'h1 ? {{8'd0}, _GEN_332} : _GEN_982; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1229 = op == 2'h1 ? _GEN_333 : _GEN_996; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [9:0] _GEN_1230 = op == 2'h1 ? _GEN_334 : _GEN_995; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1231 = op == 2'h1 ? $signed(_GEN_335) : $signed({{1{_GEN_994[10]}},_GEN_994}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1232 = op == 2'h1 ? _GEN_336 : _GEN_1002; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1234 = op == 2'h1 ? $signed(_GEN_338) : $signed({{1{_GEN_1001[10]}},_GEN_1001}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1235 = op == 2'h1 ? _GEN_339 : _GEN_1008; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1237 = op == 2'h1 ? $signed(_GEN_341) : $signed({{1{_GEN_1007[10]}},_GEN_1007}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1238 = op == 2'h1 ? _GEN_342 : _GEN_1014; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1240 = op == 2'h1 ? $signed(_GEN_344) : $signed({{1{_GEN_1013[10]}},_GEN_1013}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1241 = op == 2'h1 ? _GEN_345 : _GEN_1020; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1243 = op == 2'h1 ? $signed(_GEN_347) : $signed({{1{_GEN_1019[10]}},_GEN_1019}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1244 = op == 2'h1 ? _GEN_348 : _GEN_1026; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1246 = op == 2'h1 ? $signed(_GEN_350) : $signed({{1{_GEN_1025[10]}},_GEN_1025}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1247 = op == 2'h1 ? _GEN_351 : _GEN_1032; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1249 = op == 2'h1 ? $signed(_GEN_353) : $signed({{1{_GEN_1031[10]}},_GEN_1031}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1250 = op == 2'h1 ? _GEN_354 : _GEN_1038; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1252 = op == 2'h1 ? $signed(_GEN_356) : $signed({{1{_GEN_1037[10]}},_GEN_1037}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1253 = op == 2'h1 ? _GEN_357 : _GEN_1044; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1255 = op == 2'h1 ? $signed(_GEN_359) : $signed({{1{_GEN_1043[10]}},_GEN_1043}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1256 = op == 2'h1 ? _GEN_360 : _GEN_1050; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1258 = op == 2'h1 ? $signed(_GEN_362) : $signed({{1{_GEN_1049[10]}},_GEN_1049}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1259 = op == 2'h1 ? _GEN_363 : _GEN_1056; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1261 = op == 2'h1 ? $signed(_GEN_365) : $signed({{1{_GEN_1055[10]}},_GEN_1055}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1262 = op == 2'h1 ? _GEN_366 : _GEN_1062; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1264 = op == 2'h1 ? $signed(_GEN_368) : $signed({{1{_GEN_1061[10]}},_GEN_1061}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1265 = op == 2'h1 ? _GEN_369 : _GEN_1068; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1267 = op == 2'h1 ? $signed(_GEN_371) : $signed({{1{_GEN_1067[10]}},_GEN_1067}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1268 = op == 2'h1 ? _GEN_372 : _GEN_1074; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1270 = op == 2'h1 ? $signed(_GEN_374) : $signed({{1{_GEN_1073[10]}},_GEN_1073}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1271 = op == 2'h1 ? _GEN_375 : _GEN_1080; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1273 = op == 2'h1 ? $signed(_GEN_377) : $signed({{1{_GEN_1079[10]}},_GEN_1079}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1274 = op == 2'h1 ? _GEN_378 : _GEN_1086; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1276 = op == 2'h1 ? $signed(_GEN_380) : $signed({{1{_GEN_1085[10]}},_GEN_1085}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1277 = op == 2'h1 ? _GEN_381 : _GEN_1092; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1279 = op == 2'h1 ? $signed(_GEN_383) : $signed({{1{_GEN_1091[10]}},_GEN_1091}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1280 = op == 2'h1 ? _GEN_384 : _GEN_1098; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1282 = op == 2'h1 ? $signed(_GEN_386) : $signed({{1{_GEN_1097[10]}},_GEN_1097}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1283 = op == 2'h1 ? _GEN_387 : _GEN_1104; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1285 = op == 2'h1 ? $signed(_GEN_389) : $signed({{1{_GEN_1103[10]}},_GEN_1103}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1286 = op == 2'h1 ? _GEN_390 : _GEN_1110; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1288 = op == 2'h1 ? $signed(_GEN_392) : $signed({{1{_GEN_1109[10]}},_GEN_1109}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1289 = op == 2'h1 ? _GEN_393 : _GEN_1116; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1291 = op == 2'h1 ? $signed(_GEN_395) : $signed({{1{_GEN_1115[10]}},_GEN_1115}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1292 = op == 2'h1 ? _GEN_396 : _GEN_1122; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1294 = op == 2'h1 ? $signed(_GEN_398) : $signed({{1{_GEN_1121[10]}},_GEN_1121}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1295 = op == 2'h1 ? _GEN_399 : _GEN_1128; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1297 = op == 2'h1 ? $signed(_GEN_401) : $signed({{1{_GEN_1127[10]}},_GEN_1127}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1298 = op == 2'h1 ? _GEN_402 : _GEN_1134; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1300 = op == 2'h1 ? $signed(_GEN_404) : $signed({{1{_GEN_1133[10]}},_GEN_1133}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1301 = op == 2'h1 ? _GEN_405 : _GEN_1140; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1303 = op == 2'h1 ? $signed(_GEN_407) : $signed({{1{_GEN_1139[10]}},_GEN_1139}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1304 = op == 2'h1 ? _GEN_408 : _GEN_1146; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1306 = op == 2'h1 ? $signed(_GEN_410) : $signed({{1{_GEN_1145[10]}},_GEN_1145}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1307 = op == 2'h1 ? _GEN_411 : _GEN_1152; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1309 = op == 2'h1 ? $signed(_GEN_413) : $signed({{1{_GEN_1151[10]}},_GEN_1151}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1310 = op == 2'h1 ? _GEN_414 : _GEN_1158; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1312 = op == 2'h1 ? $signed(_GEN_416) : $signed({{1{_GEN_1157[10]}},_GEN_1157}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1313 = op == 2'h1 ? _GEN_417 : _GEN_1164; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1315 = op == 2'h1 ? $signed(_GEN_419) : $signed({{1{_GEN_1163[10]}},_GEN_1163}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1316 = op == 2'h1 ? _GEN_420 : _GEN_1170; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1318 = op == 2'h1 ? $signed(_GEN_422) : $signed({{1{_GEN_1169[10]}},_GEN_1169}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1319 = op == 2'h1 ? _GEN_423 : _GEN_1176; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1321 = op == 2'h1 ? $signed(_GEN_425) : $signed({{1{_GEN_1175[10]}},_GEN_1175}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1322 = op == 2'h1 ? _GEN_426 : _GEN_1182; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [11:0] _GEN_1324 = op == 2'h1 ? $signed(_GEN_428) : $signed({{1{_GEN_1181[10]}},_GEN_1181}); // @[DQNAcceleratorBlackBox.scala 210:44]
  wire  _GEN_1326 = op == 2'h1 ? 1'h0 : _GEN_987; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 80:37]
  wire [12:0] _GEN_1328 = op == 2'h1 ? 13'h0 : _GEN_990; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 98:34]
  wire  _GEN_1329 = op == 2'h1 ? 1'h0 : _GEN_991; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1330 = op == 2'h1 ? 1'h0 : _GEN_992; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire [9:0] _GEN_1331 = op == 2'h1 ? 10'h0 : _GEN_993; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 104:40]
  wire  _GEN_1333 = op == 2'h1 ? 1'h0 : _GEN_998; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1334 = op == 2'h1 ? 1'h0 : _GEN_999; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1337 = op == 2'h1 ? 1'h0 : _GEN_1004; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1338 = op == 2'h1 ? 1'h0 : _GEN_1005; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1341 = op == 2'h1 ? 1'h0 : _GEN_1010; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1342 = op == 2'h1 ? 1'h0 : _GEN_1011; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1345 = op == 2'h1 ? 1'h0 : _GEN_1016; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1346 = op == 2'h1 ? 1'h0 : _GEN_1017; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1349 = op == 2'h1 ? 1'h0 : _GEN_1022; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1350 = op == 2'h1 ? 1'h0 : _GEN_1023; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1353 = op == 2'h1 ? 1'h0 : _GEN_1028; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1354 = op == 2'h1 ? 1'h0 : _GEN_1029; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1357 = op == 2'h1 ? 1'h0 : _GEN_1034; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1358 = op == 2'h1 ? 1'h0 : _GEN_1035; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1361 = op == 2'h1 ? 1'h0 : _GEN_1040; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1362 = op == 2'h1 ? 1'h0 : _GEN_1041; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1365 = op == 2'h1 ? 1'h0 : _GEN_1046; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1366 = op == 2'h1 ? 1'h0 : _GEN_1047; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1369 = op == 2'h1 ? 1'h0 : _GEN_1052; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1370 = op == 2'h1 ? 1'h0 : _GEN_1053; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1373 = op == 2'h1 ? 1'h0 : _GEN_1058; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1374 = op == 2'h1 ? 1'h0 : _GEN_1059; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1377 = op == 2'h1 ? 1'h0 : _GEN_1064; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1378 = op == 2'h1 ? 1'h0 : _GEN_1065; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1381 = op == 2'h1 ? 1'h0 : _GEN_1070; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1382 = op == 2'h1 ? 1'h0 : _GEN_1071; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1385 = op == 2'h1 ? 1'h0 : _GEN_1076; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1386 = op == 2'h1 ? 1'h0 : _GEN_1077; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1389 = op == 2'h1 ? 1'h0 : _GEN_1082; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1390 = op == 2'h1 ? 1'h0 : _GEN_1083; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1393 = op == 2'h1 ? 1'h0 : _GEN_1088; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1394 = op == 2'h1 ? 1'h0 : _GEN_1089; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1397 = op == 2'h1 ? 1'h0 : _GEN_1094; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1398 = op == 2'h1 ? 1'h0 : _GEN_1095; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1401 = op == 2'h1 ? 1'h0 : _GEN_1100; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1402 = op == 2'h1 ? 1'h0 : _GEN_1101; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1405 = op == 2'h1 ? 1'h0 : _GEN_1106; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1406 = op == 2'h1 ? 1'h0 : _GEN_1107; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1409 = op == 2'h1 ? 1'h0 : _GEN_1112; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1410 = op == 2'h1 ? 1'h0 : _GEN_1113; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1413 = op == 2'h1 ? 1'h0 : _GEN_1118; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1414 = op == 2'h1 ? 1'h0 : _GEN_1119; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1417 = op == 2'h1 ? 1'h0 : _GEN_1124; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1418 = op == 2'h1 ? 1'h0 : _GEN_1125; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1421 = op == 2'h1 ? 1'h0 : _GEN_1130; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1422 = op == 2'h1 ? 1'h0 : _GEN_1131; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1425 = op == 2'h1 ? 1'h0 : _GEN_1136; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1426 = op == 2'h1 ? 1'h0 : _GEN_1137; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1429 = op == 2'h1 ? 1'h0 : _GEN_1142; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1430 = op == 2'h1 ? 1'h0 : _GEN_1143; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1433 = op == 2'h1 ? 1'h0 : _GEN_1148; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1434 = op == 2'h1 ? 1'h0 : _GEN_1149; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1437 = op == 2'h1 ? 1'h0 : _GEN_1154; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1438 = op == 2'h1 ? 1'h0 : _GEN_1155; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1441 = op == 2'h1 ? 1'h0 : _GEN_1160; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1442 = op == 2'h1 ? 1'h0 : _GEN_1161; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1445 = op == 2'h1 ? 1'h0 : _GEN_1166; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1446 = op == 2'h1 ? 1'h0 : _GEN_1167; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1449 = op == 2'h1 ? 1'h0 : _GEN_1172; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1450 = op == 2'h1 ? 1'h0 : _GEN_1173; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1453 = op == 2'h1 ? 1'h0 : _GEN_1178; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 99:34]
  wire  _GEN_1454 = op == 2'h1 ? 1'h0 : _GEN_1179; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 105:40]
  wire  _GEN_1457 = op == 2'h1 ? 1'h0 : _GEN_1184; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 85:37]
  wire  _GEN_1458 = op == 2'h1 ? 1'h0 : _GEN_1185; // @[DQNAcceleratorBlackBox.scala 210:44 DQNAcceleratorBlackBox.scala 79:37]
  wire  _GEN_1459 = op == 2'h1 ? 1'h0 : _GEN_1186; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [9:0] _GEN_1460 = op == 2'h1 ? 10'h0 : _GEN_1187; // @[DQNAcceleratorBlackBox.scala 210:44]
  wire [12:0] _GEN_1465 = Controller == 2'h3 ? _GEN_1192 : 13'h0; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 83:37]
  wire [9:0] _GEN_1466 = Controller == 2'h3 ? _GEN_1193 : 10'h0; // @[DQNAcceleratorBlackBox.scala 208:33]
  wire [11:0] _GEN_1467 = Controller == 2'h3 ? $signed(_GEN_1194) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33]
  wire [13:0] _GEN_1501 = Controller == 2'h3 ? _GEN_1228 : 14'h0; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 84:37]
  wire [9:0] _GEN_1503 = Controller == 2'h3 ? _GEN_1230 : 10'h0; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 103:40]
  wire [11:0] _GEN_1504 = Controller == 2'h3 ? $signed(_GEN_1231) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1507 = Controller == 2'h3 ? $signed(_GEN_1234) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1510 = Controller == 2'h3 ? $signed(_GEN_1237) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1513 = Controller == 2'h3 ? $signed(_GEN_1240) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1516 = Controller == 2'h3 ? $signed(_GEN_1243) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1519 = Controller == 2'h3 ? $signed(_GEN_1246) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1522 = Controller == 2'h3 ? $signed(_GEN_1249) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1525 = Controller == 2'h3 ? $signed(_GEN_1252) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1528 = Controller == 2'h3 ? $signed(_GEN_1255) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1531 = Controller == 2'h3 ? $signed(_GEN_1258) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1534 = Controller == 2'h3 ? $signed(_GEN_1261) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1537 = Controller == 2'h3 ? $signed(_GEN_1264) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1540 = Controller == 2'h3 ? $signed(_GEN_1267) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1543 = Controller == 2'h3 ? $signed(_GEN_1270) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1546 = Controller == 2'h3 ? $signed(_GEN_1273) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1549 = Controller == 2'h3 ? $signed(_GEN_1276) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1552 = Controller == 2'h3 ? $signed(_GEN_1279) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1555 = Controller == 2'h3 ? $signed(_GEN_1282) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1558 = Controller == 2'h3 ? $signed(_GEN_1285) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1561 = Controller == 2'h3 ? $signed(_GEN_1288) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1564 = Controller == 2'h3 ? $signed(_GEN_1291) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1567 = Controller == 2'h3 ? $signed(_GEN_1294) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1570 = Controller == 2'h3 ? $signed(_GEN_1297) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1573 = Controller == 2'h3 ? $signed(_GEN_1300) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1576 = Controller == 2'h3 ? $signed(_GEN_1303) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1579 = Controller == 2'h3 ? $signed(_GEN_1306) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1582 = Controller == 2'h3 ? $signed(_GEN_1309) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1585 = Controller == 2'h3 ? $signed(_GEN_1312) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1588 = Controller == 2'h3 ? $signed(_GEN_1315) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1591 = Controller == 2'h3 ? $signed(_GEN_1318) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1594 = Controller == 2'h3 ? $signed(_GEN_1321) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [11:0] _GEN_1597 = Controller == 2'h3 ? $signed(_GEN_1324) : $signed(12'sh0); // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 107:40]
  wire [12:0] _GEN_1601 = Controller == 2'h3 ? _GEN_1328 : 13'h0; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 98:34]
  wire [9:0] _GEN_1604 = Controller == 2'h3 ? _GEN_1331 : 10'h0; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 104:40]
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_clock),
    .wrData(DualPortedMemBlackBox_wrData),
    .rdData(DualPortedMemBlackBox_rdData),
    .readAddr(DualPortedMemBlackBox_readAddr),
    .writeAddr(DualPortedMemBlackBox_writeAddr),
    .wrEna(DualPortedMemBlackBox_wrEna),
    .rdEna(DualPortedMemBlackBox_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_1 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_1_clock),
    .wrData(DualPortedMemBlackBox_1_wrData),
    .rdData(DualPortedMemBlackBox_1_rdData),
    .readAddr(DualPortedMemBlackBox_1_readAddr),
    .writeAddr(DualPortedMemBlackBox_1_writeAddr),
    .wrEna(DualPortedMemBlackBox_1_wrEna),
    .rdEna(DualPortedMemBlackBox_1_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_2 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_2_clock),
    .wrData(DualPortedMemBlackBox_2_wrData),
    .rdData(DualPortedMemBlackBox_2_rdData),
    .readAddr(DualPortedMemBlackBox_2_readAddr),
    .writeAddr(DualPortedMemBlackBox_2_writeAddr),
    .wrEna(DualPortedMemBlackBox_2_wrEna),
    .rdEna(DualPortedMemBlackBox_2_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_3 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_3_clock),
    .wrData(DualPortedMemBlackBox_3_wrData),
    .rdData(DualPortedMemBlackBox_3_rdData),
    .readAddr(DualPortedMemBlackBox_3_readAddr),
    .writeAddr(DualPortedMemBlackBox_3_writeAddr),
    .wrEna(DualPortedMemBlackBox_3_wrEna),
    .rdEna(DualPortedMemBlackBox_3_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_4 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_4_clock),
    .wrData(DualPortedMemBlackBox_4_wrData),
    .rdData(DualPortedMemBlackBox_4_rdData),
    .readAddr(DualPortedMemBlackBox_4_readAddr),
    .writeAddr(DualPortedMemBlackBox_4_writeAddr),
    .wrEna(DualPortedMemBlackBox_4_wrEna),
    .rdEna(DualPortedMemBlackBox_4_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_5 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_5_clock),
    .wrData(DualPortedMemBlackBox_5_wrData),
    .rdData(DualPortedMemBlackBox_5_rdData),
    .readAddr(DualPortedMemBlackBox_5_readAddr),
    .writeAddr(DualPortedMemBlackBox_5_writeAddr),
    .wrEna(DualPortedMemBlackBox_5_wrEna),
    .rdEna(DualPortedMemBlackBox_5_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_6 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_6_clock),
    .wrData(DualPortedMemBlackBox_6_wrData),
    .rdData(DualPortedMemBlackBox_6_rdData),
    .readAddr(DualPortedMemBlackBox_6_readAddr),
    .writeAddr(DualPortedMemBlackBox_6_writeAddr),
    .wrEna(DualPortedMemBlackBox_6_wrEna),
    .rdEna(DualPortedMemBlackBox_6_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_7 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_7_clock),
    .wrData(DualPortedMemBlackBox_7_wrData),
    .rdData(DualPortedMemBlackBox_7_rdData),
    .readAddr(DualPortedMemBlackBox_7_readAddr),
    .writeAddr(DualPortedMemBlackBox_7_writeAddr),
    .wrEna(DualPortedMemBlackBox_7_wrEna),
    .rdEna(DualPortedMemBlackBox_7_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_8 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_8_clock),
    .wrData(DualPortedMemBlackBox_8_wrData),
    .rdData(DualPortedMemBlackBox_8_rdData),
    .readAddr(DualPortedMemBlackBox_8_readAddr),
    .writeAddr(DualPortedMemBlackBox_8_writeAddr),
    .wrEna(DualPortedMemBlackBox_8_wrEna),
    .rdEna(DualPortedMemBlackBox_8_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_9 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_9_clock),
    .wrData(DualPortedMemBlackBox_9_wrData),
    .rdData(DualPortedMemBlackBox_9_rdData),
    .readAddr(DualPortedMemBlackBox_9_readAddr),
    .writeAddr(DualPortedMemBlackBox_9_writeAddr),
    .wrEna(DualPortedMemBlackBox_9_wrEna),
    .rdEna(DualPortedMemBlackBox_9_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_10 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_10_clock),
    .wrData(DualPortedMemBlackBox_10_wrData),
    .rdData(DualPortedMemBlackBox_10_rdData),
    .readAddr(DualPortedMemBlackBox_10_readAddr),
    .writeAddr(DualPortedMemBlackBox_10_writeAddr),
    .wrEna(DualPortedMemBlackBox_10_wrEna),
    .rdEna(DualPortedMemBlackBox_10_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_11 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_11_clock),
    .wrData(DualPortedMemBlackBox_11_wrData),
    .rdData(DualPortedMemBlackBox_11_rdData),
    .readAddr(DualPortedMemBlackBox_11_readAddr),
    .writeAddr(DualPortedMemBlackBox_11_writeAddr),
    .wrEna(DualPortedMemBlackBox_11_wrEna),
    .rdEna(DualPortedMemBlackBox_11_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_12 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_12_clock),
    .wrData(DualPortedMemBlackBox_12_wrData),
    .rdData(DualPortedMemBlackBox_12_rdData),
    .readAddr(DualPortedMemBlackBox_12_readAddr),
    .writeAddr(DualPortedMemBlackBox_12_writeAddr),
    .wrEna(DualPortedMemBlackBox_12_wrEna),
    .rdEna(DualPortedMemBlackBox_12_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_13 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_13_clock),
    .wrData(DualPortedMemBlackBox_13_wrData),
    .rdData(DualPortedMemBlackBox_13_rdData),
    .readAddr(DualPortedMemBlackBox_13_readAddr),
    .writeAddr(DualPortedMemBlackBox_13_writeAddr),
    .wrEna(DualPortedMemBlackBox_13_wrEna),
    .rdEna(DualPortedMemBlackBox_13_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_14 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_14_clock),
    .wrData(DualPortedMemBlackBox_14_wrData),
    .rdData(DualPortedMemBlackBox_14_rdData),
    .readAddr(DualPortedMemBlackBox_14_readAddr),
    .writeAddr(DualPortedMemBlackBox_14_writeAddr),
    .wrEna(DualPortedMemBlackBox_14_wrEna),
    .rdEna(DualPortedMemBlackBox_14_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_15 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_15_clock),
    .wrData(DualPortedMemBlackBox_15_wrData),
    .rdData(DualPortedMemBlackBox_15_rdData),
    .readAddr(DualPortedMemBlackBox_15_readAddr),
    .writeAddr(DualPortedMemBlackBox_15_writeAddr),
    .wrEna(DualPortedMemBlackBox_15_wrEna),
    .rdEna(DualPortedMemBlackBox_15_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_16 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_16_clock),
    .wrData(DualPortedMemBlackBox_16_wrData),
    .rdData(DualPortedMemBlackBox_16_rdData),
    .readAddr(DualPortedMemBlackBox_16_readAddr),
    .writeAddr(DualPortedMemBlackBox_16_writeAddr),
    .wrEna(DualPortedMemBlackBox_16_wrEna),
    .rdEna(DualPortedMemBlackBox_16_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_17 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_17_clock),
    .wrData(DualPortedMemBlackBox_17_wrData),
    .rdData(DualPortedMemBlackBox_17_rdData),
    .readAddr(DualPortedMemBlackBox_17_readAddr),
    .writeAddr(DualPortedMemBlackBox_17_writeAddr),
    .wrEna(DualPortedMemBlackBox_17_wrEna),
    .rdEna(DualPortedMemBlackBox_17_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_18 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_18_clock),
    .wrData(DualPortedMemBlackBox_18_wrData),
    .rdData(DualPortedMemBlackBox_18_rdData),
    .readAddr(DualPortedMemBlackBox_18_readAddr),
    .writeAddr(DualPortedMemBlackBox_18_writeAddr),
    .wrEna(DualPortedMemBlackBox_18_wrEna),
    .rdEna(DualPortedMemBlackBox_18_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_19 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_19_clock),
    .wrData(DualPortedMemBlackBox_19_wrData),
    .rdData(DualPortedMemBlackBox_19_rdData),
    .readAddr(DualPortedMemBlackBox_19_readAddr),
    .writeAddr(DualPortedMemBlackBox_19_writeAddr),
    .wrEna(DualPortedMemBlackBox_19_wrEna),
    .rdEna(DualPortedMemBlackBox_19_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_20 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_20_clock),
    .wrData(DualPortedMemBlackBox_20_wrData),
    .rdData(DualPortedMemBlackBox_20_rdData),
    .readAddr(DualPortedMemBlackBox_20_readAddr),
    .writeAddr(DualPortedMemBlackBox_20_writeAddr),
    .wrEna(DualPortedMemBlackBox_20_wrEna),
    .rdEna(DualPortedMemBlackBox_20_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_21 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_21_clock),
    .wrData(DualPortedMemBlackBox_21_wrData),
    .rdData(DualPortedMemBlackBox_21_rdData),
    .readAddr(DualPortedMemBlackBox_21_readAddr),
    .writeAddr(DualPortedMemBlackBox_21_writeAddr),
    .wrEna(DualPortedMemBlackBox_21_wrEna),
    .rdEna(DualPortedMemBlackBox_21_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_22 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_22_clock),
    .wrData(DualPortedMemBlackBox_22_wrData),
    .rdData(DualPortedMemBlackBox_22_rdData),
    .readAddr(DualPortedMemBlackBox_22_readAddr),
    .writeAddr(DualPortedMemBlackBox_22_writeAddr),
    .wrEna(DualPortedMemBlackBox_22_wrEna),
    .rdEna(DualPortedMemBlackBox_22_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_23 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_23_clock),
    .wrData(DualPortedMemBlackBox_23_wrData),
    .rdData(DualPortedMemBlackBox_23_rdData),
    .readAddr(DualPortedMemBlackBox_23_readAddr),
    .writeAddr(DualPortedMemBlackBox_23_writeAddr),
    .wrEna(DualPortedMemBlackBox_23_wrEna),
    .rdEna(DualPortedMemBlackBox_23_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_24 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_24_clock),
    .wrData(DualPortedMemBlackBox_24_wrData),
    .rdData(DualPortedMemBlackBox_24_rdData),
    .readAddr(DualPortedMemBlackBox_24_readAddr),
    .writeAddr(DualPortedMemBlackBox_24_writeAddr),
    .wrEna(DualPortedMemBlackBox_24_wrEna),
    .rdEna(DualPortedMemBlackBox_24_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_25 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_25_clock),
    .wrData(DualPortedMemBlackBox_25_wrData),
    .rdData(DualPortedMemBlackBox_25_rdData),
    .readAddr(DualPortedMemBlackBox_25_readAddr),
    .writeAddr(DualPortedMemBlackBox_25_writeAddr),
    .wrEna(DualPortedMemBlackBox_25_wrEna),
    .rdEna(DualPortedMemBlackBox_25_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_26 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_26_clock),
    .wrData(DualPortedMemBlackBox_26_wrData),
    .rdData(DualPortedMemBlackBox_26_rdData),
    .readAddr(DualPortedMemBlackBox_26_readAddr),
    .writeAddr(DualPortedMemBlackBox_26_writeAddr),
    .wrEna(DualPortedMemBlackBox_26_wrEna),
    .rdEna(DualPortedMemBlackBox_26_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_27 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_27_clock),
    .wrData(DualPortedMemBlackBox_27_wrData),
    .rdData(DualPortedMemBlackBox_27_rdData),
    .readAddr(DualPortedMemBlackBox_27_readAddr),
    .writeAddr(DualPortedMemBlackBox_27_writeAddr),
    .wrEna(DualPortedMemBlackBox_27_wrEna),
    .rdEna(DualPortedMemBlackBox_27_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_28 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_28_clock),
    .wrData(DualPortedMemBlackBox_28_wrData),
    .rdData(DualPortedMemBlackBox_28_rdData),
    .readAddr(DualPortedMemBlackBox_28_readAddr),
    .writeAddr(DualPortedMemBlackBox_28_writeAddr),
    .wrEna(DualPortedMemBlackBox_28_wrEna),
    .rdEna(DualPortedMemBlackBox_28_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_29 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_29_clock),
    .wrData(DualPortedMemBlackBox_29_wrData),
    .rdData(DualPortedMemBlackBox_29_rdData),
    .readAddr(DualPortedMemBlackBox_29_readAddr),
    .writeAddr(DualPortedMemBlackBox_29_writeAddr),
    .wrEna(DualPortedMemBlackBox_29_wrEna),
    .rdEna(DualPortedMemBlackBox_29_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_30 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_30_clock),
    .wrData(DualPortedMemBlackBox_30_wrData),
    .rdData(DualPortedMemBlackBox_30_rdData),
    .readAddr(DualPortedMemBlackBox_30_readAddr),
    .writeAddr(DualPortedMemBlackBox_30_writeAddr),
    .wrEna(DualPortedMemBlackBox_30_wrEna),
    .rdEna(DualPortedMemBlackBox_30_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(128), .ADDR_WIDTH(7)) DualPortedMemBlackBox_31 ( // @[DQNAcceleratorBlackBox.scala 44:61]
    .clock(DualPortedMemBlackBox_31_clock),
    .wrData(DualPortedMemBlackBox_31_wrData),
    .rdData(DualPortedMemBlackBox_31_rdData),
    .readAddr(DualPortedMemBlackBox_31_readAddr),
    .writeAddr(DualPortedMemBlackBox_31_writeAddr),
    .wrEna(DualPortedMemBlackBox_31_wrEna),
    .rdEna(DualPortedMemBlackBox_31_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_32 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_32_clock),
    .wrData(DualPortedMemBlackBox_32_wrData),
    .rdData(DualPortedMemBlackBox_32_rdData),
    .readAddr(DualPortedMemBlackBox_32_readAddr),
    .writeAddr(DualPortedMemBlackBox_32_writeAddr),
    .wrEna(DualPortedMemBlackBox_32_wrEna),
    .rdEna(DualPortedMemBlackBox_32_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_33 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_33_clock),
    .wrData(DualPortedMemBlackBox_33_wrData),
    .rdData(DualPortedMemBlackBox_33_rdData),
    .readAddr(DualPortedMemBlackBox_33_readAddr),
    .writeAddr(DualPortedMemBlackBox_33_writeAddr),
    .wrEna(DualPortedMemBlackBox_33_wrEna),
    .rdEna(DualPortedMemBlackBox_33_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_34 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_34_clock),
    .wrData(DualPortedMemBlackBox_34_wrData),
    .rdData(DualPortedMemBlackBox_34_rdData),
    .readAddr(DualPortedMemBlackBox_34_readAddr),
    .writeAddr(DualPortedMemBlackBox_34_writeAddr),
    .wrEna(DualPortedMemBlackBox_34_wrEna),
    .rdEna(DualPortedMemBlackBox_34_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_35 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_35_clock),
    .wrData(DualPortedMemBlackBox_35_wrData),
    .rdData(DualPortedMemBlackBox_35_rdData),
    .readAddr(DualPortedMemBlackBox_35_readAddr),
    .writeAddr(DualPortedMemBlackBox_35_writeAddr),
    .wrEna(DualPortedMemBlackBox_35_wrEna),
    .rdEna(DualPortedMemBlackBox_35_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_36 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_36_clock),
    .wrData(DualPortedMemBlackBox_36_wrData),
    .rdData(DualPortedMemBlackBox_36_rdData),
    .readAddr(DualPortedMemBlackBox_36_readAddr),
    .writeAddr(DualPortedMemBlackBox_36_writeAddr),
    .wrEna(DualPortedMemBlackBox_36_wrEna),
    .rdEna(DualPortedMemBlackBox_36_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_37 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_37_clock),
    .wrData(DualPortedMemBlackBox_37_wrData),
    .rdData(DualPortedMemBlackBox_37_rdData),
    .readAddr(DualPortedMemBlackBox_37_readAddr),
    .writeAddr(DualPortedMemBlackBox_37_writeAddr),
    .wrEna(DualPortedMemBlackBox_37_wrEna),
    .rdEna(DualPortedMemBlackBox_37_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_38 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_38_clock),
    .wrData(DualPortedMemBlackBox_38_wrData),
    .rdData(DualPortedMemBlackBox_38_rdData),
    .readAddr(DualPortedMemBlackBox_38_readAddr),
    .writeAddr(DualPortedMemBlackBox_38_writeAddr),
    .wrEna(DualPortedMemBlackBox_38_wrEna),
    .rdEna(DualPortedMemBlackBox_38_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_39 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_39_clock),
    .wrData(DualPortedMemBlackBox_39_wrData),
    .rdData(DualPortedMemBlackBox_39_rdData),
    .readAddr(DualPortedMemBlackBox_39_readAddr),
    .writeAddr(DualPortedMemBlackBox_39_writeAddr),
    .wrEna(DualPortedMemBlackBox_39_wrEna),
    .rdEna(DualPortedMemBlackBox_39_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_40 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_40_clock),
    .wrData(DualPortedMemBlackBox_40_wrData),
    .rdData(DualPortedMemBlackBox_40_rdData),
    .readAddr(DualPortedMemBlackBox_40_readAddr),
    .writeAddr(DualPortedMemBlackBox_40_writeAddr),
    .wrEna(DualPortedMemBlackBox_40_wrEna),
    .rdEna(DualPortedMemBlackBox_40_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_41 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_41_clock),
    .wrData(DualPortedMemBlackBox_41_wrData),
    .rdData(DualPortedMemBlackBox_41_rdData),
    .readAddr(DualPortedMemBlackBox_41_readAddr),
    .writeAddr(DualPortedMemBlackBox_41_writeAddr),
    .wrEna(DualPortedMemBlackBox_41_wrEna),
    .rdEna(DualPortedMemBlackBox_41_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_42 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_42_clock),
    .wrData(DualPortedMemBlackBox_42_wrData),
    .rdData(DualPortedMemBlackBox_42_rdData),
    .readAddr(DualPortedMemBlackBox_42_readAddr),
    .writeAddr(DualPortedMemBlackBox_42_writeAddr),
    .wrEna(DualPortedMemBlackBox_42_wrEna),
    .rdEna(DualPortedMemBlackBox_42_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_43 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_43_clock),
    .wrData(DualPortedMemBlackBox_43_wrData),
    .rdData(DualPortedMemBlackBox_43_rdData),
    .readAddr(DualPortedMemBlackBox_43_readAddr),
    .writeAddr(DualPortedMemBlackBox_43_writeAddr),
    .wrEna(DualPortedMemBlackBox_43_wrEna),
    .rdEna(DualPortedMemBlackBox_43_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_44 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_44_clock),
    .wrData(DualPortedMemBlackBox_44_wrData),
    .rdData(DualPortedMemBlackBox_44_rdData),
    .readAddr(DualPortedMemBlackBox_44_readAddr),
    .writeAddr(DualPortedMemBlackBox_44_writeAddr),
    .wrEna(DualPortedMemBlackBox_44_wrEna),
    .rdEna(DualPortedMemBlackBox_44_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_45 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_45_clock),
    .wrData(DualPortedMemBlackBox_45_wrData),
    .rdData(DualPortedMemBlackBox_45_rdData),
    .readAddr(DualPortedMemBlackBox_45_readAddr),
    .writeAddr(DualPortedMemBlackBox_45_writeAddr),
    .wrEna(DualPortedMemBlackBox_45_wrEna),
    .rdEna(DualPortedMemBlackBox_45_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_46 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_46_clock),
    .wrData(DualPortedMemBlackBox_46_wrData),
    .rdData(DualPortedMemBlackBox_46_rdData),
    .readAddr(DualPortedMemBlackBox_46_readAddr),
    .writeAddr(DualPortedMemBlackBox_46_writeAddr),
    .wrEna(DualPortedMemBlackBox_46_wrEna),
    .rdEna(DualPortedMemBlackBox_46_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_47 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_47_clock),
    .wrData(DualPortedMemBlackBox_47_wrData),
    .rdData(DualPortedMemBlackBox_47_rdData),
    .readAddr(DualPortedMemBlackBox_47_readAddr),
    .writeAddr(DualPortedMemBlackBox_47_writeAddr),
    .wrEna(DualPortedMemBlackBox_47_wrEna),
    .rdEna(DualPortedMemBlackBox_47_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_48 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_48_clock),
    .wrData(DualPortedMemBlackBox_48_wrData),
    .rdData(DualPortedMemBlackBox_48_rdData),
    .readAddr(DualPortedMemBlackBox_48_readAddr),
    .writeAddr(DualPortedMemBlackBox_48_writeAddr),
    .wrEna(DualPortedMemBlackBox_48_wrEna),
    .rdEna(DualPortedMemBlackBox_48_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_49 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_49_clock),
    .wrData(DualPortedMemBlackBox_49_wrData),
    .rdData(DualPortedMemBlackBox_49_rdData),
    .readAddr(DualPortedMemBlackBox_49_readAddr),
    .writeAddr(DualPortedMemBlackBox_49_writeAddr),
    .wrEna(DualPortedMemBlackBox_49_wrEna),
    .rdEna(DualPortedMemBlackBox_49_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_50 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_50_clock),
    .wrData(DualPortedMemBlackBox_50_wrData),
    .rdData(DualPortedMemBlackBox_50_rdData),
    .readAddr(DualPortedMemBlackBox_50_readAddr),
    .writeAddr(DualPortedMemBlackBox_50_writeAddr),
    .wrEna(DualPortedMemBlackBox_50_wrEna),
    .rdEna(DualPortedMemBlackBox_50_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_51 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_51_clock),
    .wrData(DualPortedMemBlackBox_51_wrData),
    .rdData(DualPortedMemBlackBox_51_rdData),
    .readAddr(DualPortedMemBlackBox_51_readAddr),
    .writeAddr(DualPortedMemBlackBox_51_writeAddr),
    .wrEna(DualPortedMemBlackBox_51_wrEna),
    .rdEna(DualPortedMemBlackBox_51_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_52 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_52_clock),
    .wrData(DualPortedMemBlackBox_52_wrData),
    .rdData(DualPortedMemBlackBox_52_rdData),
    .readAddr(DualPortedMemBlackBox_52_readAddr),
    .writeAddr(DualPortedMemBlackBox_52_writeAddr),
    .wrEna(DualPortedMemBlackBox_52_wrEna),
    .rdEna(DualPortedMemBlackBox_52_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_53 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_53_clock),
    .wrData(DualPortedMemBlackBox_53_wrData),
    .rdData(DualPortedMemBlackBox_53_rdData),
    .readAddr(DualPortedMemBlackBox_53_readAddr),
    .writeAddr(DualPortedMemBlackBox_53_writeAddr),
    .wrEna(DualPortedMemBlackBox_53_wrEna),
    .rdEna(DualPortedMemBlackBox_53_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_54 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_54_clock),
    .wrData(DualPortedMemBlackBox_54_wrData),
    .rdData(DualPortedMemBlackBox_54_rdData),
    .readAddr(DualPortedMemBlackBox_54_readAddr),
    .writeAddr(DualPortedMemBlackBox_54_writeAddr),
    .wrEna(DualPortedMemBlackBox_54_wrEna),
    .rdEna(DualPortedMemBlackBox_54_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_55 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_55_clock),
    .wrData(DualPortedMemBlackBox_55_wrData),
    .rdData(DualPortedMemBlackBox_55_rdData),
    .readAddr(DualPortedMemBlackBox_55_readAddr),
    .writeAddr(DualPortedMemBlackBox_55_writeAddr),
    .wrEna(DualPortedMemBlackBox_55_wrEna),
    .rdEna(DualPortedMemBlackBox_55_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_56 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_56_clock),
    .wrData(DualPortedMemBlackBox_56_wrData),
    .rdData(DualPortedMemBlackBox_56_rdData),
    .readAddr(DualPortedMemBlackBox_56_readAddr),
    .writeAddr(DualPortedMemBlackBox_56_writeAddr),
    .wrEna(DualPortedMemBlackBox_56_wrEna),
    .rdEna(DualPortedMemBlackBox_56_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_57 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_57_clock),
    .wrData(DualPortedMemBlackBox_57_wrData),
    .rdData(DualPortedMemBlackBox_57_rdData),
    .readAddr(DualPortedMemBlackBox_57_readAddr),
    .writeAddr(DualPortedMemBlackBox_57_writeAddr),
    .wrEna(DualPortedMemBlackBox_57_wrEna),
    .rdEna(DualPortedMemBlackBox_57_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_58 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_58_clock),
    .wrData(DualPortedMemBlackBox_58_wrData),
    .rdData(DualPortedMemBlackBox_58_rdData),
    .readAddr(DualPortedMemBlackBox_58_readAddr),
    .writeAddr(DualPortedMemBlackBox_58_writeAddr),
    .wrEna(DualPortedMemBlackBox_58_wrEna),
    .rdEna(DualPortedMemBlackBox_58_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_59 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_59_clock),
    .wrData(DualPortedMemBlackBox_59_wrData),
    .rdData(DualPortedMemBlackBox_59_rdData),
    .readAddr(DualPortedMemBlackBox_59_readAddr),
    .writeAddr(DualPortedMemBlackBox_59_writeAddr),
    .wrEna(DualPortedMemBlackBox_59_wrEna),
    .rdEna(DualPortedMemBlackBox_59_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_60 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_60_clock),
    .wrData(DualPortedMemBlackBox_60_wrData),
    .rdData(DualPortedMemBlackBox_60_rdData),
    .readAddr(DualPortedMemBlackBox_60_readAddr),
    .writeAddr(DualPortedMemBlackBox_60_writeAddr),
    .wrEna(DualPortedMemBlackBox_60_wrEna),
    .rdEna(DualPortedMemBlackBox_60_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_61 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_61_clock),
    .wrData(DualPortedMemBlackBox_61_wrData),
    .rdData(DualPortedMemBlackBox_61_rdData),
    .readAddr(DualPortedMemBlackBox_61_readAddr),
    .writeAddr(DualPortedMemBlackBox_61_writeAddr),
    .wrEna(DualPortedMemBlackBox_61_wrEna),
    .rdEna(DualPortedMemBlackBox_61_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_62 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_62_clock),
    .wrData(DualPortedMemBlackBox_62_wrData),
    .rdData(DualPortedMemBlackBox_62_rdData),
    .readAddr(DualPortedMemBlackBox_62_readAddr),
    .writeAddr(DualPortedMemBlackBox_62_writeAddr),
    .wrEna(DualPortedMemBlackBox_62_wrEna),
    .rdEna(DualPortedMemBlackBox_62_rdEna)
  );
  DualPortedMemBlackBox #(.WIDTH(10), .MEM_DEPTH(16), .ADDR_WIDTH(4)) DualPortedMemBlackBox_63 ( // @[DQNAcceleratorBlackBox.scala 45:61]
    .clock(DualPortedMemBlackBox_63_clock),
    .wrData(DualPortedMemBlackBox_63_wrData),
    .rdData(DualPortedMemBlackBox_63_rdData),
    .readAddr(DualPortedMemBlackBox_63_readAddr),
    .writeAddr(DualPortedMemBlackBox_63_writeAddr),
    .wrEna(DualPortedMemBlackBox_63_wrEna),
    .rdEna(DualPortedMemBlackBox_63_rdEna)
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
  Max4 actionBlock ( // @[DQNAcceleratorBlackBox.scala 54:31]
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
  assign io_ready = Controller == 2'h3 ? _GEN_1190 : _T; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign io_jumpIP = Controller == 2'h3 & _GEN_1459; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign io_IPAddress = Controller == 2'h3 ? _GEN_1460 : 10'h0; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign io_increaseIP = _T ? 1'h0 : _GEN_10; // @[Conditional.scala 40:58]
  assign io_action = actionBlock_io_index; // @[DQNAcceleratorBlackBox.scala 359:18]
  assign io_actionValid = rdDataVecValid_io_delayedSignal; // @[DQNAcceleratorBlackBox.scala 360:18]
  assign DualPortedMemBlackBox_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_wrEna = Controller == 2'h3 & _GEN_1195; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_rdEna = Controller == 2'h3 & _GEN_1329; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_1_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_1_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_1_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_1_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_1_wrEna = Controller == 2'h3 & _GEN_1196; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_1_rdEna = Controller == 2'h3 & _GEN_1333; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_2_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_2_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_2_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_2_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_2_wrEna = Controller == 2'h3 & _GEN_1197; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_2_rdEna = Controller == 2'h3 & _GEN_1337; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_3_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_3_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_3_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_3_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_3_wrEna = Controller == 2'h3 & _GEN_1198; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_3_rdEna = Controller == 2'h3 & _GEN_1341; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_4_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_4_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_4_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_4_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_4_wrEna = Controller == 2'h3 & _GEN_1199; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_4_rdEna = Controller == 2'h3 & _GEN_1345; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_5_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_5_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_5_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_5_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_5_wrEna = Controller == 2'h3 & _GEN_1200; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_5_rdEna = Controller == 2'h3 & _GEN_1349; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_6_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_6_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_6_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_6_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_6_wrEna = Controller == 2'h3 & _GEN_1201; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_6_rdEna = Controller == 2'h3 & _GEN_1353; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_7_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_7_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_7_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_7_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_7_wrEna = Controller == 2'h3 & _GEN_1202; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_7_rdEna = Controller == 2'h3 & _GEN_1357; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_8_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_8_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_8_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_8_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_8_wrEna = Controller == 2'h3 & _GEN_1203; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_8_rdEna = Controller == 2'h3 & _GEN_1361; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_9_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_9_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_9_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_9_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_9_wrEna = Controller == 2'h3 & _GEN_1204; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_9_rdEna = Controller == 2'h3 & _GEN_1365; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_10_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_10_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_10_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_10_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_10_wrEna = Controller == 2'h3 & _GEN_1205; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_10_rdEna = Controller == 2'h3 & _GEN_1369; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_11_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_11_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_11_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_11_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_11_wrEna = Controller == 2'h3 & _GEN_1206; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_11_rdEna = Controller == 2'h3 & _GEN_1373; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_12_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_12_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_12_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_12_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_12_wrEna = Controller == 2'h3 & _GEN_1207; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_12_rdEna = Controller == 2'h3 & _GEN_1377; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_13_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_13_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_13_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_13_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_13_wrEna = Controller == 2'h3 & _GEN_1208; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_13_rdEna = Controller == 2'h3 & _GEN_1381; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_14_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_14_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_14_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_14_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_14_wrEna = Controller == 2'h3 & _GEN_1209; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_14_rdEna = Controller == 2'h3 & _GEN_1385; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_15_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_15_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_15_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_15_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_15_wrEna = Controller == 2'h3 & _GEN_1210; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_15_rdEna = Controller == 2'h3 & _GEN_1389; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_16_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_16_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_16_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_16_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_16_wrEna = Controller == 2'h3 & _GEN_1211; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_16_rdEna = Controller == 2'h3 & _GEN_1393; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_17_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_17_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_17_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_17_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_17_wrEna = Controller == 2'h3 & _GEN_1212; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_17_rdEna = Controller == 2'h3 & _GEN_1397; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_18_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_18_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_18_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_18_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_18_wrEna = Controller == 2'h3 & _GEN_1213; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_18_rdEna = Controller == 2'h3 & _GEN_1401; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_19_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_19_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_19_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_19_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_19_wrEna = Controller == 2'h3 & _GEN_1214; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_19_rdEna = Controller == 2'h3 & _GEN_1405; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_20_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_20_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_20_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_20_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_20_wrEna = Controller == 2'h3 & _GEN_1215; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_20_rdEna = Controller == 2'h3 & _GEN_1409; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_21_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_21_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_21_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_21_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_21_wrEna = Controller == 2'h3 & _GEN_1216; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_21_rdEna = Controller == 2'h3 & _GEN_1413; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_22_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_22_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_22_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_22_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_22_wrEna = Controller == 2'h3 & _GEN_1217; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_22_rdEna = Controller == 2'h3 & _GEN_1417; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_23_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_23_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_23_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_23_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_23_wrEna = Controller == 2'h3 & _GEN_1218; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_23_rdEna = Controller == 2'h3 & _GEN_1421; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_24_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_24_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_24_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_24_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_24_wrEna = Controller == 2'h3 & _GEN_1219; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_24_rdEna = Controller == 2'h3 & _GEN_1425; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_25_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_25_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_25_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_25_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_25_wrEna = Controller == 2'h3 & _GEN_1220; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_25_rdEna = Controller == 2'h3 & _GEN_1429; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_26_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_26_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_26_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_26_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_26_wrEna = Controller == 2'h3 & _GEN_1221; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_26_rdEna = Controller == 2'h3 & _GEN_1433; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_27_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_27_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_27_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_27_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_27_wrEna = Controller == 2'h3 & _GEN_1222; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_27_rdEna = Controller == 2'h3 & _GEN_1437; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_28_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_28_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_28_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_28_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_28_wrEna = Controller == 2'h3 & _GEN_1223; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_28_rdEna = Controller == 2'h3 & _GEN_1441; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_29_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_29_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_29_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_29_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_29_wrEna = Controller == 2'h3 & _GEN_1224; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_29_rdEna = Controller == 2'h3 & _GEN_1445; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_30_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_30_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_30_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_30_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_30_wrEna = Controller == 2'h3 & _GEN_1225; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_30_rdEna = Controller == 2'h3 & _GEN_1449; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_31_clock = clock; // @[DQNAcceleratorBlackBox.scala 95:30]
  assign DualPortedMemBlackBox_31_wrData = _GEN_1467[9:0]; // @[DQNAcceleratorBlackBox.scala 96:34]
  assign DualPortedMemBlackBox_31_readAddr = _GEN_1601[6:0];
  assign DualPortedMemBlackBox_31_writeAddr = _GEN_1466[6:0]; // @[DQNAcceleratorBlackBox.scala 97:34]
  assign DualPortedMemBlackBox_31_wrEna = Controller == 2'h3 & _GEN_1226; // @[DQNAcceleratorBlackBox.scala 208:33]
  assign DualPortedMemBlackBox_31_rdEna = Controller == 2'h3 & _GEN_1453; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 99:34]
  assign DualPortedMemBlackBox_32_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_32_wrData = _GEN_1504[9:0];
  assign DualPortedMemBlackBox_32_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_32_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_32_wrEna = Controller == 2'h3 & _GEN_1229; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_32_rdEna = Controller == 2'h3 & _GEN_1330; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_33_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_33_wrData = _GEN_1507[9:0];
  assign DualPortedMemBlackBox_33_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_33_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_33_wrEna = Controller == 2'h3 & _GEN_1232; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_33_rdEna = Controller == 2'h3 & _GEN_1334; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_34_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_34_wrData = _GEN_1510[9:0];
  assign DualPortedMemBlackBox_34_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_34_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_34_wrEna = Controller == 2'h3 & _GEN_1235; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_34_rdEna = Controller == 2'h3 & _GEN_1338; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_35_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_35_wrData = _GEN_1513[9:0];
  assign DualPortedMemBlackBox_35_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_35_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_35_wrEna = Controller == 2'h3 & _GEN_1238; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_35_rdEna = Controller == 2'h3 & _GEN_1342; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_36_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_36_wrData = _GEN_1516[9:0];
  assign DualPortedMemBlackBox_36_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_36_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_36_wrEna = Controller == 2'h3 & _GEN_1241; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_36_rdEna = Controller == 2'h3 & _GEN_1346; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_37_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_37_wrData = _GEN_1519[9:0];
  assign DualPortedMemBlackBox_37_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_37_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_37_wrEna = Controller == 2'h3 & _GEN_1244; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_37_rdEna = Controller == 2'h3 & _GEN_1350; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_38_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_38_wrData = _GEN_1522[9:0];
  assign DualPortedMemBlackBox_38_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_38_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_38_wrEna = Controller == 2'h3 & _GEN_1247; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_38_rdEna = Controller == 2'h3 & _GEN_1354; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_39_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_39_wrData = _GEN_1525[9:0];
  assign DualPortedMemBlackBox_39_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_39_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_39_wrEna = Controller == 2'h3 & _GEN_1250; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_39_rdEna = Controller == 2'h3 & _GEN_1358; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_40_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_40_wrData = _GEN_1528[9:0];
  assign DualPortedMemBlackBox_40_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_40_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_40_wrEna = Controller == 2'h3 & _GEN_1253; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_40_rdEna = Controller == 2'h3 & _GEN_1362; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_41_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_41_wrData = _GEN_1531[9:0];
  assign DualPortedMemBlackBox_41_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_41_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_41_wrEna = Controller == 2'h3 & _GEN_1256; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_41_rdEna = Controller == 2'h3 & _GEN_1366; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_42_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_42_wrData = _GEN_1534[9:0];
  assign DualPortedMemBlackBox_42_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_42_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_42_wrEna = Controller == 2'h3 & _GEN_1259; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_42_rdEna = Controller == 2'h3 & _GEN_1370; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_43_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_43_wrData = _GEN_1537[9:0];
  assign DualPortedMemBlackBox_43_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_43_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_43_wrEna = Controller == 2'h3 & _GEN_1262; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_43_rdEna = Controller == 2'h3 & _GEN_1374; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_44_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_44_wrData = _GEN_1540[9:0];
  assign DualPortedMemBlackBox_44_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_44_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_44_wrEna = Controller == 2'h3 & _GEN_1265; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_44_rdEna = Controller == 2'h3 & _GEN_1378; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_45_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_45_wrData = _GEN_1543[9:0];
  assign DualPortedMemBlackBox_45_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_45_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_45_wrEna = Controller == 2'h3 & _GEN_1268; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_45_rdEna = Controller == 2'h3 & _GEN_1382; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_46_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_46_wrData = _GEN_1546[9:0];
  assign DualPortedMemBlackBox_46_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_46_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_46_wrEna = Controller == 2'h3 & _GEN_1271; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_46_rdEna = Controller == 2'h3 & _GEN_1386; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_47_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_47_wrData = _GEN_1549[9:0];
  assign DualPortedMemBlackBox_47_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_47_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_47_wrEna = Controller == 2'h3 & _GEN_1274; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_47_rdEna = Controller == 2'h3 & _GEN_1390; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_48_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_48_wrData = _GEN_1552[9:0];
  assign DualPortedMemBlackBox_48_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_48_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_48_wrEna = Controller == 2'h3 & _GEN_1277; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_48_rdEna = Controller == 2'h3 & _GEN_1394; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_49_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_49_wrData = _GEN_1555[9:0];
  assign DualPortedMemBlackBox_49_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_49_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_49_wrEna = Controller == 2'h3 & _GEN_1280; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_49_rdEna = Controller == 2'h3 & _GEN_1398; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_50_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_50_wrData = _GEN_1558[9:0];
  assign DualPortedMemBlackBox_50_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_50_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_50_wrEna = Controller == 2'h3 & _GEN_1283; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_50_rdEna = Controller == 2'h3 & _GEN_1402; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_51_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_51_wrData = _GEN_1561[9:0];
  assign DualPortedMemBlackBox_51_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_51_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_51_wrEna = Controller == 2'h3 & _GEN_1286; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_51_rdEna = Controller == 2'h3 & _GEN_1406; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_52_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_52_wrData = _GEN_1564[9:0];
  assign DualPortedMemBlackBox_52_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_52_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_52_wrEna = Controller == 2'h3 & _GEN_1289; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_52_rdEna = Controller == 2'h3 & _GEN_1410; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_53_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_53_wrData = _GEN_1567[9:0];
  assign DualPortedMemBlackBox_53_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_53_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_53_wrEna = Controller == 2'h3 & _GEN_1292; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_53_rdEna = Controller == 2'h3 & _GEN_1414; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_54_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_54_wrData = _GEN_1570[9:0];
  assign DualPortedMemBlackBox_54_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_54_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_54_wrEna = Controller == 2'h3 & _GEN_1295; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_54_rdEna = Controller == 2'h3 & _GEN_1418; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_55_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_55_wrData = _GEN_1573[9:0];
  assign DualPortedMemBlackBox_55_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_55_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_55_wrEna = Controller == 2'h3 & _GEN_1298; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_55_rdEna = Controller == 2'h3 & _GEN_1422; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_56_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_56_wrData = _GEN_1576[9:0];
  assign DualPortedMemBlackBox_56_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_56_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_56_wrEna = Controller == 2'h3 & _GEN_1301; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_56_rdEna = Controller == 2'h3 & _GEN_1426; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_57_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_57_wrData = _GEN_1579[9:0];
  assign DualPortedMemBlackBox_57_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_57_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_57_wrEna = Controller == 2'h3 & _GEN_1304; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_57_rdEna = Controller == 2'h3 & _GEN_1430; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_58_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_58_wrData = _GEN_1582[9:0];
  assign DualPortedMemBlackBox_58_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_58_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_58_wrEna = Controller == 2'h3 & _GEN_1307; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_58_rdEna = Controller == 2'h3 & _GEN_1434; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_59_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_59_wrData = _GEN_1585[9:0];
  assign DualPortedMemBlackBox_59_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_59_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_59_wrEna = Controller == 2'h3 & _GEN_1310; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_59_rdEna = Controller == 2'h3 & _GEN_1438; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_60_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_60_wrData = _GEN_1588[9:0];
  assign DualPortedMemBlackBox_60_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_60_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_60_wrEna = Controller == 2'h3 & _GEN_1313; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_60_rdEna = Controller == 2'h3 & _GEN_1442; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_61_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_61_wrData = _GEN_1591[9:0];
  assign DualPortedMemBlackBox_61_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_61_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_61_wrEna = Controller == 2'h3 & _GEN_1316; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_61_rdEna = Controller == 2'h3 & _GEN_1446; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_62_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_62_wrData = _GEN_1594[9:0];
  assign DualPortedMemBlackBox_62_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_62_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_62_wrEna = Controller == 2'h3 & _GEN_1319; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_62_rdEna = Controller == 2'h3 & _GEN_1450; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign DualPortedMemBlackBox_63_clock = clock; // @[DQNAcceleratorBlackBox.scala 108:36]
  assign DualPortedMemBlackBox_63_wrData = _GEN_1597[9:0];
  assign DualPortedMemBlackBox_63_readAddr = _GEN_1604[3:0];
  assign DualPortedMemBlackBox_63_writeAddr = _GEN_1503[3:0];
  assign DualPortedMemBlackBox_63_wrEna = Controller == 2'h3 & _GEN_1322; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 106:40]
  assign DualPortedMemBlackBox_63_rdEna = Controller == 2'h3 & _GEN_1454; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 105:40]
  assign activationBlock_io_activationFunc = instructionRegister[26:25]; // @[DQNAcceleratorBlackBox.scala 86:59]
  assign activationBlock_io_weightedSum_0 = DualPortedMemBlackBox_32_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_1 = DualPortedMemBlackBox_33_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_2 = DualPortedMemBlackBox_34_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_3 = DualPortedMemBlackBox_35_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_4 = DualPortedMemBlackBox_36_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_5 = DualPortedMemBlackBox_37_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_6 = DualPortedMemBlackBox_38_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_7 = DualPortedMemBlackBox_39_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_8 = DualPortedMemBlackBox_40_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_9 = DualPortedMemBlackBox_41_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_10 = DualPortedMemBlackBox_42_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_11 = DualPortedMemBlackBox_43_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_12 = DualPortedMemBlackBox_44_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_13 = DualPortedMemBlackBox_45_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_14 = DualPortedMemBlackBox_46_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_15 = DualPortedMemBlackBox_47_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_16 = DualPortedMemBlackBox_48_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_17 = DualPortedMemBlackBox_49_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_18 = DualPortedMemBlackBox_50_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_19 = DualPortedMemBlackBox_51_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_20 = DualPortedMemBlackBox_52_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_21 = DualPortedMemBlackBox_53_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_22 = DualPortedMemBlackBox_54_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_23 = DualPortedMemBlackBox_55_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_24 = DualPortedMemBlackBox_56_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_25 = DualPortedMemBlackBox_57_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_26 = DualPortedMemBlackBox_58_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_27 = DualPortedMemBlackBox_59_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_28 = DualPortedMemBlackBox_60_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_29 = DualPortedMemBlackBox_61_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_30 = DualPortedMemBlackBox_62_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_weightedSum_31 = DualPortedMemBlackBox_63_rdData; // @[DQNAcceleratorBlackBox.scala 109:40]
  assign activationBlock_io_ena = Controller == 2'h3 & _GEN_1457; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 85:37]
  assign oneHotDecoder_io_memRow = _GEN_1465[4:0];
  assign oneHotDecoder_io_enable = Controller == 2'h3 & _GEN_1191; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 81:37]
  assign memReadDecoder_io_PEs = _GEN_1501[4:0];
  assign memReadDecoder_io_enable = Controller == 2'h3 & _GEN_1227; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 82:37]
  assign adderTree_clock = clock;
  assign adderTree_io_in_0 = mulResults_0; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_1 = mulResults_1; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_2 = mulResults_2; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_3 = mulResults_3; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_4 = mulResults_4; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_5 = mulResults_5; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_6 = mulResults_6; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_7 = mulResults_7; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_8 = mulResults_8; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_9 = mulResults_9; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_10 = mulResults_10; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_11 = mulResults_11; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_12 = mulResults_12; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_13 = mulResults_13; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_14 = mulResults_14; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_15 = mulResults_15; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_16 = mulResults_16; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_17 = mulResults_17; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_18 = mulResults_18; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_19 = mulResults_19; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_20 = mulResults_20; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_21 = mulResults_21; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_22 = mulResults_22; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_23 = mulResults_23; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_24 = mulResults_24; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_25 = mulResults_25; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_26 = mulResults_26; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_27 = mulResults_27; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_28 = mulResults_28; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_29 = mulResults_29; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_30 = mulResults_30; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_in_31 = mulResults_31; // @[DQNAcceleratorBlackBox.scala 113:25]
  assign adderTree_io_cal = adderTree_io_cal_REG; // @[DQNAcceleratorBlackBox.scala 89:20]
  assign actionBlock_io_in_0 = DualPortedMemBlackBox_32_rdData; // @[DQNAcceleratorBlackBox.scala 91:74]
  assign actionBlock_io_in_1 = DualPortedMemBlackBox_33_rdData; // @[DQNAcceleratorBlackBox.scala 91:74]
  assign actionBlock_io_in_2 = DualPortedMemBlackBox_34_rdData; // @[DQNAcceleratorBlackBox.scala 91:74]
  assign actionBlock_io_in_3 = DualPortedMemBlackBox_35_rdData; // @[DQNAcceleratorBlackBox.scala 91:74]
  assign rdDataMatrixValid_clock = clock;
  assign rdDataMatrixValid_io_signal2delay = Controller == 2'h3 & _GEN_1326; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 80:37]
  assign rdDataVecValid_clock = clock;
  assign rdDataVecValid_io_signal2delay = Controller == 2'h3 & _GEN_1458; // @[DQNAcceleratorBlackBox.scala 208:33 DQNAcceleratorBlackBox.scala 79:37]
  always @(posedge clock) begin
    if (reset) begin // @[DQNAcceleratorBlackBox.scala 43:36]
      instructionRegister <= 32'h0; // @[DQNAcceleratorBlackBox.scala 43:36]
    end else if (Controller == 2'h1) begin // @[DQNAcceleratorBlackBox.scala 197:29]
      instructionRegister <= io_instruction; // @[DQNAcceleratorBlackBox.scala 198:25]
    end
    mulResults_0 <= $signed(DualPortedMemBlackBox_rdData) * $signed(DualPortedMemBlackBox_32_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_1 <= $signed(DualPortedMemBlackBox_1_rdData) * $signed(DualPortedMemBlackBox_33_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_2 <= $signed(DualPortedMemBlackBox_2_rdData) * $signed(DualPortedMemBlackBox_34_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_3 <= $signed(DualPortedMemBlackBox_3_rdData) * $signed(DualPortedMemBlackBox_35_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_4 <= $signed(DualPortedMemBlackBox_4_rdData) * $signed(DualPortedMemBlackBox_36_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_5 <= $signed(DualPortedMemBlackBox_5_rdData) * $signed(DualPortedMemBlackBox_37_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_6 <= $signed(DualPortedMemBlackBox_6_rdData) * $signed(DualPortedMemBlackBox_38_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_7 <= $signed(DualPortedMemBlackBox_7_rdData) * $signed(DualPortedMemBlackBox_39_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_8 <= $signed(DualPortedMemBlackBox_8_rdData) * $signed(DualPortedMemBlackBox_40_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_9 <= $signed(DualPortedMemBlackBox_9_rdData) * $signed(DualPortedMemBlackBox_41_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_10 <= $signed(DualPortedMemBlackBox_10_rdData) * $signed(DualPortedMemBlackBox_42_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_11 <= $signed(DualPortedMemBlackBox_11_rdData) * $signed(DualPortedMemBlackBox_43_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_12 <= $signed(DualPortedMemBlackBox_12_rdData) * $signed(DualPortedMemBlackBox_44_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_13 <= $signed(DualPortedMemBlackBox_13_rdData) * $signed(DualPortedMemBlackBox_45_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_14 <= $signed(DualPortedMemBlackBox_14_rdData) * $signed(DualPortedMemBlackBox_46_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_15 <= $signed(DualPortedMemBlackBox_15_rdData) * $signed(DualPortedMemBlackBox_47_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_16 <= $signed(DualPortedMemBlackBox_16_rdData) * $signed(DualPortedMemBlackBox_48_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_17 <= $signed(DualPortedMemBlackBox_17_rdData) * $signed(DualPortedMemBlackBox_49_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_18 <= $signed(DualPortedMemBlackBox_18_rdData) * $signed(DualPortedMemBlackBox_50_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_19 <= $signed(DualPortedMemBlackBox_19_rdData) * $signed(DualPortedMemBlackBox_51_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_20 <= $signed(DualPortedMemBlackBox_20_rdData) * $signed(DualPortedMemBlackBox_52_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_21 <= $signed(DualPortedMemBlackBox_21_rdData) * $signed(DualPortedMemBlackBox_53_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_22 <= $signed(DualPortedMemBlackBox_22_rdData) * $signed(DualPortedMemBlackBox_54_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_23 <= $signed(DualPortedMemBlackBox_23_rdData) * $signed(DualPortedMemBlackBox_55_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_24 <= $signed(DualPortedMemBlackBox_24_rdData) * $signed(DualPortedMemBlackBox_56_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_25 <= $signed(DualPortedMemBlackBox_25_rdData) * $signed(DualPortedMemBlackBox_57_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_26 <= $signed(DualPortedMemBlackBox_26_rdData) * $signed(DualPortedMemBlackBox_58_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_27 <= $signed(DualPortedMemBlackBox_27_rdData) * $signed(DualPortedMemBlackBox_59_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_28 <= $signed(DualPortedMemBlackBox_28_rdData) * $signed(DualPortedMemBlackBox_60_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_29 <= $signed(DualPortedMemBlackBox_29_rdData) * $signed(DualPortedMemBlackBox_61_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_30 <= $signed(DualPortedMemBlackBox_30_rdData) * $signed(DualPortedMemBlackBox_62_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    mulResults_31 <= $signed(DualPortedMemBlackBox_31_rdData) * $signed(DualPortedMemBlackBox_63_rdData); // @[DQNAcceleratorBlackBox.scala 112:54]
    if (reset) begin // @[DQNAcceleratorBlackBox.scala 65:34]
      rdWrEnaFlip <= 1'h0; // @[DQNAcceleratorBlackBox.scala 65:34]
    end else if (Controller == 2'h3) begin // @[DQNAcceleratorBlackBox.scala 208:33]
      if (!(op == 2'h1)) begin // @[DQNAcceleratorBlackBox.scala 210:44]
        if (op == 2'h0) begin // @[DQNAcceleratorBlackBox.scala 279:40]
          rdWrEnaFlip <= _GEN_977;
        end
      end
    end
    if (reset) begin // @[DQNAcceleratorBlackBox.scala 73:33]
      colBanksCounter <= 13'h0; // @[DQNAcceleratorBlackBox.scala 73:33]
    end else if (Controller == 2'h3) begin // @[DQNAcceleratorBlackBox.scala 208:33]
      if (op == 2'h1) begin // @[DQNAcceleratorBlackBox.scala 210:44]
        colBanksCounter <= _GEN_17;
      end else if (op == 2'h0) begin // @[DQNAcceleratorBlackBox.scala 279:40]
        colBanksCounter <= _GEN_783;
      end else begin
        colBanksCounter <= _GEN_17;
      end
    end else begin
      colBanksCounter <= _GEN_17;
    end
    if (reset) begin // @[DQNAcceleratorBlackBox.scala 74:33]
      matrixRowCounter <= 13'h0; // @[DQNAcceleratorBlackBox.scala 74:33]
    end else if (Controller == 2'h3) begin // @[DQNAcceleratorBlackBox.scala 208:33]
      if (op == 2'h1) begin // @[DQNAcceleratorBlackBox.scala 210:44]
        matrixRowCounter <= _GEN_18;
      end else if (op == 2'h0) begin // @[DQNAcceleratorBlackBox.scala 279:40]
        matrixRowCounter <= _GEN_778;
      end else begin
        matrixRowCounter <= _GEN_18;
      end
    end else begin
      matrixRowCounter <= _GEN_18;
    end
    if (reset) begin // @[DQNAcceleratorBlackBox.scala 75:33]
      VinSizeReg <= 14'h0; // @[DQNAcceleratorBlackBox.scala 75:33]
    end else if (Controller == 2'h3) begin // @[DQNAcceleratorBlackBox.scala 208:33]
      if (op == 2'h1) begin // @[DQNAcceleratorBlackBox.scala 210:44]
        if (_T_10) begin // @[Conditional.scala 40:58]
          VinSizeReg <= VinSize; // @[DQNAcceleratorBlackBox.scala 214:27]
        end
      end
    end
    if (reset) begin // @[DQNAcceleratorBlackBox.scala 76:33]
      VoutSizeReg <= 13'h0; // @[DQNAcceleratorBlackBox.scala 76:33]
    end else if (Controller == 2'h3) begin // @[DQNAcceleratorBlackBox.scala 208:33]
      if (op == 2'h1) begin // @[DQNAcceleratorBlackBox.scala 210:44]
        if (_T_10) begin // @[Conditional.scala 40:58]
          VoutSizeReg <= VoutSize; // @[DQNAcceleratorBlackBox.scala 215:27]
        end
      end
    end
    adderTree_io_cal_REG <= rdDataMatrixValid_io_delayedSignal; // @[DQNAcceleratorBlackBox.scala 89:30]
    if (reset) begin // @[DQNAcceleratorBlackBox.scala 162:32]
      Controller <= 2'h0; // @[DQNAcceleratorBlackBox.scala 162:32]
    end else if (_T) begin // @[Conditional.scala 40:58]
      if (io_instructionValid) begin // @[DQNAcceleratorBlackBox.scala 169:32]
        Controller <= 2'h1; // @[DQNAcceleratorBlackBox.scala 170:25]
      end
    end else if (_T_1) begin // @[Conditional.scala 39:67]
      Controller <= 2'h2; // @[DQNAcceleratorBlackBox.scala 174:25]
    end else if (_T_2) begin // @[Conditional.scala 39:67]
      Controller <= 2'h3; // @[DQNAcceleratorBlackBox.scala 178:25]
    end else begin
      Controller <= _GEN_4;
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
  mulResults_0 = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  mulResults_1 = _RAND_2[19:0];
  _RAND_3 = {1{`RANDOM}};
  mulResults_2 = _RAND_3[19:0];
  _RAND_4 = {1{`RANDOM}};
  mulResults_3 = _RAND_4[19:0];
  _RAND_5 = {1{`RANDOM}};
  mulResults_4 = _RAND_5[19:0];
  _RAND_6 = {1{`RANDOM}};
  mulResults_5 = _RAND_6[19:0];
  _RAND_7 = {1{`RANDOM}};
  mulResults_6 = _RAND_7[19:0];
  _RAND_8 = {1{`RANDOM}};
  mulResults_7 = _RAND_8[19:0];
  _RAND_9 = {1{`RANDOM}};
  mulResults_8 = _RAND_9[19:0];
  _RAND_10 = {1{`RANDOM}};
  mulResults_9 = _RAND_10[19:0];
  _RAND_11 = {1{`RANDOM}};
  mulResults_10 = _RAND_11[19:0];
  _RAND_12 = {1{`RANDOM}};
  mulResults_11 = _RAND_12[19:0];
  _RAND_13 = {1{`RANDOM}};
  mulResults_12 = _RAND_13[19:0];
  _RAND_14 = {1{`RANDOM}};
  mulResults_13 = _RAND_14[19:0];
  _RAND_15 = {1{`RANDOM}};
  mulResults_14 = _RAND_15[19:0];
  _RAND_16 = {1{`RANDOM}};
  mulResults_15 = _RAND_16[19:0];
  _RAND_17 = {1{`RANDOM}};
  mulResults_16 = _RAND_17[19:0];
  _RAND_18 = {1{`RANDOM}};
  mulResults_17 = _RAND_18[19:0];
  _RAND_19 = {1{`RANDOM}};
  mulResults_18 = _RAND_19[19:0];
  _RAND_20 = {1{`RANDOM}};
  mulResults_19 = _RAND_20[19:0];
  _RAND_21 = {1{`RANDOM}};
  mulResults_20 = _RAND_21[19:0];
  _RAND_22 = {1{`RANDOM}};
  mulResults_21 = _RAND_22[19:0];
  _RAND_23 = {1{`RANDOM}};
  mulResults_22 = _RAND_23[19:0];
  _RAND_24 = {1{`RANDOM}};
  mulResults_23 = _RAND_24[19:0];
  _RAND_25 = {1{`RANDOM}};
  mulResults_24 = _RAND_25[19:0];
  _RAND_26 = {1{`RANDOM}};
  mulResults_25 = _RAND_26[19:0];
  _RAND_27 = {1{`RANDOM}};
  mulResults_26 = _RAND_27[19:0];
  _RAND_28 = {1{`RANDOM}};
  mulResults_27 = _RAND_28[19:0];
  _RAND_29 = {1{`RANDOM}};
  mulResults_28 = _RAND_29[19:0];
  _RAND_30 = {1{`RANDOM}};
  mulResults_29 = _RAND_30[19:0];
  _RAND_31 = {1{`RANDOM}};
  mulResults_30 = _RAND_31[19:0];
  _RAND_32 = {1{`RANDOM}};
  mulResults_31 = _RAND_32[19:0];
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
