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

module DFF_TB();
	reg D = 1;
	reg clk = 0;
	reg R = 1;
	wire w;
	DFF DFF1(D,R,clk, w);
	initial begin
		#200 R = 0;
		#50 D = ~D;
		#150 D = ~D;
		#300 D = ~D;
		#300 D = ~D;
		#300 D = ~D;
		#180 D = ~D;
		#100 D = ~D;
		#110 D = ~D;
		#30 D = ~D;
		#80 D = ~D;
		#110 R = 1;
	end
	always #150 clk = ~clk;
endmodule

