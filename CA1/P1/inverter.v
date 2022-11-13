`timescale 1ns/1ns

module MyInverter(input a, output w);
	supply1 Vdd;
	supply0 gnd;
	nmos #(3,5,7) N1(w,gnd,a);
	pmos #(4,7,9) P1(w,Vdd,a);

endmodule

module MyInverter_TB();
	reg aa=0;
	wire w;
	MyInverter I1(aa,w);
	initial repeat (4) #30 {aa} = {aa} + 1;
endmodule