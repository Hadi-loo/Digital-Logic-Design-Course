`timescale 1ns/1ns
module Q4_gate(input a,b,c,d, output w);
	supply1 Vdd;
	wire i;
	MyInverter I1(d,Vdd,i);
	MyInverter I2(c,i,w);
	MyNand N1(a,b,d,w);
endmodule
