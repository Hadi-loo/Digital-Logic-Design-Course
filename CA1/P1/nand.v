`timescale 1ns/1ns

module MyNand(input a,b, output w);
	supply1 Vdd;
	supply0 gnd;
	wire j;
	pmos #(4,7,9) P1(w,Vdd,a);
	pmos #(4,7,9) P2(w,Vdd,b);
	nmos #(3,5,7) N1(w,j,a);
	nmos #(3,5,7) N2(j,gnd,b);

endmodule

module MyNand_TB();
	reg aa=1, bb=1;
	wire w;
	MyNand N1(aa,bb,w);
	initial repeat (3) #40 {bb} = {bb} + 1;
endmodule