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

module DFF(input D,R,clk, output Q);
	wire i,j,k,l,m;
	not #(7,9) N1(i,R);
	nand #(14,10) Na1(j,D,i);
	not #(7,9) N2(k,j);
	not #(7,9) N3(l,clk);
	Dlatch D1(k,l,1'b1, m);
	Dlatch D2(m,clk,1'b1, Q);
endmodule

module shiftreg8(input serIn,clk,rst, output PO);
	wire [8:0] QD;
	assign QD[8] = serIn;
	genvar i;
	generate 
		for (i=8; i>0; i=i-1) begin
			DFF X(QD[i],rst,clk, QD[i-1]);
		end
	endgenerate
	assign PO = QD[0];
endmodule

module ShiftReg_TB();
	reg D = 1;
	reg clk = 0;
	reg rst = 1;
	wire w;
	shiftreg8 SR8(D,clk,rst, w);
	initial begin
		#110 rst = 0;
		#150 D = ~D;
		#300 D = ~D;
		#300 D = ~D;
		#300 D = ~D;
		#180 D = ~D;
		#100 D = ~D;
		#110 D = ~D;
		#30 D = ~D;
		#70 D = ~D;
		#120 D = ~D;
		#30 D = ~D;
		#40 D = ~D;
		#50 D = ~D;
		#90 D = ~D;
		#70 D = ~D;
		#80 D = ~D;
		#60 D = ~D;
		#200 D = ~D;
		#400 D = ~D;
		#250 D = ~D;
		#150 D = ~D;
		#300 D = ~D;
		#200 D = ~D;
		#200 D = ~D;
	end
	always #100 clk = ~clk;
endmodule


