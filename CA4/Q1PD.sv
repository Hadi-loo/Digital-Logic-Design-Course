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

module Dlatch_TB();
	reg D = 0;
	reg clk = 1;
	reg en = 1;
	wire w;
	Dlatch DL1(D,clk,en,w);
	initial begin
		#50 D = ~D;
		repeat (10) #10 D = ~D;
		repeat (4) #50 D = ~D;
		repeat (20) #10 clk = ~clk;
	end
endmodule
