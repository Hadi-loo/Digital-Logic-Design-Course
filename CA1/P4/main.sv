`timescale 1ns/1ns

module MyMain(input a,b,c,d, output w);
	supply1 Vdd;
	wire i;
	MyInverter I1(d,Vdd,i);
	MyInverter I2(c,i,w);
	MyNand N1(a,b,d,w);
endmodule

module main_TB();
	reg aa=0, bb=0, cc=1, dd=1;
	wire w;
	MyMain M1(aa,bb,cc,dd, w);
	initial begin
		#100 dd=0;
		#100 dd=1;
	end
endmodule
