//lpm_counter CBX_SINGLE_OUTPUT_FILE="ON" LPM_AVALUE=1001111 LPM_DIRECTION="UP" LPM_PORT_UPDOWN="PORT_UNUSED" LPM_TYPE="LPM_COUNTER" LPM_WIDTH=8 aset clock cout data q sload
//VERSION_BEGIN 20.1 cbx_mgl 2020:11:11:17:08:38:SJ cbx_stratixii 2020:11:11:17:06:46:SJ cbx_util_mgl 2020:11:11:17:06:46:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2020  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and any partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details, at
//  https://fpgasoftware.intel.com/eula.



//synthesis_resources = lpm_counter 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mgupf
	( 
	aset,
	clock,
	cout,
	data,
	q,
	sload) /* synthesis synthesis_clearbox=1 */;
	input   aset;
	input   clock;
	output   cout;
	input   [7:0]  data;
	output   [7:0]  q;
	input   sload;

	wire  wire_mgl_prim1_cout;
	wire  [7:0]   wire_mgl_prim1_q;

	lpm_counter   mgl_prim1
	( 
	.aset(aset),
	.clock(clock),
	.cout(wire_mgl_prim1_cout),
	.data(data),
	.q(wire_mgl_prim1_q),
	.sload(sload));
	defparam
		mgl_prim1.lpm_avalue = 1001111,
		mgl_prim1.lpm_direction = "UP",
		mgl_prim1.lpm_port_updown = "PORT_UNUSED",
		mgl_prim1.lpm_type = "LPM_COUNTER",
		mgl_prim1.lpm_width = 8;
	assign
		cout = wire_mgl_prim1_cout,
		q = wire_mgl_prim1_q;
endmodule //mgupf
//VALID FILE
