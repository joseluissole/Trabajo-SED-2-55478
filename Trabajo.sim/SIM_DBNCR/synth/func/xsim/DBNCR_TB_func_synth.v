// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Wed Nov 16 19:44:44 2022
// Host        : DESKTOP-LPLGK47 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/sedx/Trabajo/Trabajo.sim/SIM_DBNCR/synth/func/xsim/DBNCR_TB_func_synth.v
// Design      : ESTAB_BOT
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module EDGEDTCTR
   (BOT_OUT_OBUF,
    RST_N,
    E,
    CLK,
    D,
    RST_N_IBUF);
  output BOT_OUT_OBUF;
  output RST_N;
  input [0:0]E;
  input CLK;
  input [0:0]D;
  input RST_N_IBUF;

  wire BOT_OUT_OBUF;
  wire CLK;
  wire [0:0]D;
  wire [0:0]E;
  wire RST_N;
  wire RST_N_IBUF;
  wire [2:0]sreg;

  LUT3 #(
    .INIT(8'h02)) 
    EDGE
       (.I0(sreg[2]),
        .I1(sreg[0]),
        .I2(sreg[1]),
        .O(BOT_OUT_OBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \sreg[1]_i_1 
       (.I0(RST_N_IBUF),
        .O(RST_N));
  FDCE #(
    .INIT(1'b0)) 
    \sreg_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(RST_N),
        .D(D),
        .Q(sreg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \sreg_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(RST_N),
        .D(sreg[0]),
        .Q(sreg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \sreg_reg[2] 
       (.C(CLK),
        .CE(E),
        .CLR(RST_N),
        .D(sreg[1]),
        .Q(sreg[2]));
endmodule

(* NotValidForBitStream *)
module ESTAB_BOT
   (BOT_IN,
    BOT_OUT,
    CLK,
    CE,
    RST_N);
  input BOT_IN;
  output BOT_OUT;
  input CLK;
  input CE;
  input RST_N;

  wire BOT_IN;
  wire BOT_IN_IBUF;
  wire BOT_OUT;
  wire BOT_OUT_OBUF;
  wire CE;
  wire CE_IBUF;
  wire CLK;
  wire CLK_IBUF;
  wire CLK_IBUF_BUFG;
  wire FLANCO_n_1;
  wire RST_N;
  wire RST_N_IBUF;
  wire SYNC_OUT;

  IBUF BOT_IN_IBUF_inst
       (.I(BOT_IN),
        .O(BOT_IN_IBUF));
  OBUF BOT_OUT_OBUF_inst
       (.I(BOT_OUT_OBUF),
        .O(BOT_OUT));
  IBUF CE_IBUF_inst
       (.I(CE),
        .O(CE_IBUF));
  BUFG CLK_IBUF_BUFG_inst
       (.I(CLK_IBUF),
        .O(CLK_IBUF_BUFG));
  IBUF CLK_IBUF_inst
       (.I(CLK),
        .O(CLK_IBUF));
  EDGEDTCTR FLANCO
       (.BOT_OUT_OBUF(BOT_OUT_OBUF),
        .CLK(CLK_IBUF_BUFG),
        .D(SYNC_OUT),
        .E(CE_IBUF),
        .RST_N(FLANCO_n_1),
        .RST_N_IBUF(RST_N_IBUF));
  IBUF RST_N_IBUF_inst
       (.I(RST_N),
        .O(RST_N_IBUF));
  SYNCHRNZR SINCRONIZADO
       (.AR(FLANCO_n_1),
        .CLK(CLK_IBUF_BUFG),
        .D(SYNC_OUT),
        .E(CE_IBUF),
        .RST_N_IBUF(RST_N_IBUF),
        .\sreg_reg[0]_0 (BOT_IN_IBUF));
endmodule

module SYNCHRNZR
   (D,
    CLK,
    RST_N_IBUF,
    E,
    AR,
    \sreg_reg[0]_0 );
  output [0:0]D;
  input CLK;
  input RST_N_IBUF;
  input [0:0]E;
  input [0:0]AR;
  input [0:0]\sreg_reg[0]_0 ;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]D;
  wire [0:0]E;
  wire RST_N_IBUF;
  wire SYNC_OUT_i_1_n_0;
  wire p_0_in;
  wire [1:1]p_1_in;
  wire [0:0]\sreg_reg[0]_0 ;

  LUT4 #(
    .INIT(16'hBF80)) 
    SYNC_OUT_i_1
       (.I0(p_0_in),
        .I1(RST_N_IBUF),
        .I2(E),
        .I3(D),
        .O(SYNC_OUT_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    SYNC_OUT_reg
       (.C(CLK),
        .CE(1'b1),
        .D(SYNC_OUT_i_1_n_0),
        .Q(D),
        .R(1'b0));
  FDCE #(
    .INIT(1'b0)) 
    \sreg_reg[0] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(\sreg_reg[0]_0 ),
        .Q(p_1_in));
  FDCE #(
    .INIT(1'b0)) 
    \sreg_reg[1] 
       (.C(CLK),
        .CE(E),
        .CLR(AR),
        .D(p_1_in),
        .Q(p_0_in));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
