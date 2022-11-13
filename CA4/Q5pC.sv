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

module LFSR(input init,rst,clk, output [7:0] PO);
	wire [7:0] i;
	wire j,k,l,m;

	or O1(internalReset,rst,init);
	or O2(m,i[7],init);
	xor X5(j,i[5],i[7]);
	xor X4(k,i[4],i[7]);
	xor X1(l,i[1],i[7]);

	DFF D7(m,rst,clk, i[6]);
	DFF D6(i[6],internalReset,clk, i[5]);
	DFF D5(j,internalReset,clk, i[4]);
	DFF D4(k,internalReset,clk, i[3]);
	DFF D3(i[3],internalReset,clk, i[2]);
	DFF D2(i[2],internalReset,clk, i[1]);
	DFF D1(l,internalReset,clk, i[0]);
	DFF D0(i[0],internalReset,clk, i[7]);

	assign PO[7] = i[6];
	assign PO[6] = i[5];
	assign PO[5] = i[4];
	assign PO[4] = i[3];
	assign PO[3] = i[2];
	assign PO[2] = i[1];
	assign PO[1] = i[0];
	assign PO[0] = i[7];
endmodule

module LFSR_TB();
	reg init = 0;
	reg clk = 0;
	reg rst = 1;
	wire [7:0] w;
	LFSR L1(init,rst,clk, w);
	initial begin
		#750 rst = ~rst;
		#150 init = ~init;
		#800 init = ~init;
	end
	always #500 clk = ~clk;
endmodule



