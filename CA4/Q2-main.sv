`timescale 1ns/1ns
module MUX21(input a,b,s,e, output w);
	wire ns,j;
	not #(7,9) N1(ns,s);
	notif1 #(14,18,16) N2(j,a,ns);
	notif1 #(14,18,16) N3(j,b,s);
	notif1 #(14,18,16) N4(w,j,e);
endmodule

module Dlatch(input D,clk,en, output w);
	MUX21 M1(w,D,clk,en, w);
endmodule

module shiftreg8(input serIn,clk, output PO);
	wire [8:0] QD;
	assign QD[8] = serIn;
	genvar i;
	generate 
		for (i=8; i>0; i=i-1) begin
			Dlatch X(QD[i],clk,1'b1, QD[i-1]);
		end
	endgenerate
	assign PO = QD[0];
endmodule

module ShiftReg_TB();
	reg serIn = 1;
	reg clk = 1;
	wire w;
	shiftreg8 SR8(serIn,clk,w);
	initial begin
		#500 serIn = ~serIn;
		#600 serIn = ~serIn;
	end
	always #300 clk = ~clk;
endmodule

