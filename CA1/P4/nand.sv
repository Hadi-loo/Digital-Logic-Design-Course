`timescale 1ns/1ns

module MyNand(input a,b,c, output w);
	supply1 Vdd;
	supply0 gnd;
	wire i,j,k,l;
	pmos #(4,7,9) P1(j,Vdd,a);
	pmos #(4,7,9) P2(j,Vdd,b);
	pmos #(4,7,9) P3(w,j,i);
	pmos #(4,7,9) P4(i,Vdd,c);
	nmos #(3,5,7) N1(k,gnd,b);
	nmos #(3,5,7) N2(l,k,a);
	nmos #(3,5,7) N3(w,l,c);
	nmos #(3,5,7) N4(i,gnd,c);
endmodule