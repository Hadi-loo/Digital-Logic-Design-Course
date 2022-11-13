`timescale 1ns/1ns

module Not(input a, output w);
	supply1 Vdd;
	supply0 gnd;
	nmos #(3,5,7) N1(w,gnd,a);
	pmos #(4,7,9) P1(w,Vdd,a);
endmodule

module TriStateNot(input a,c, output w);
	supply1 Vdd;
	supply0 gnd;
	wire i,j,k;
	pmos #(4,7,9) P1(j,Vdd,a);
	pmos #(4,7,9) P2(w,j,i);
	pmos #(4,7,9) P3(i,Vdd,c);
	nmos #(3,5,7) N1(k,gnd,a);
	nmos #(3,5,7) N2(w,k,c);
	nmos #(3,5,7) N3(i,gnd,c);
endmodule

module main(input a,b,s,e, output w);
	wire ns,j;
	Not N1(s,ns);
	TriStateNot N2(a,ns,j);
	TriStateNot N3(b,s,j);
	TriStateNot N4(j,e,w);
endmodule

module TestBench();
	reg aa=0,bb=1,se=0,en=1;
	wire w;
	main M1(aa,bb,se,en,w);
	initial begin
	#50 se = 1;
	#50 se = 0;
	aa = 1;
	bb = 0;
	#100 se=1;
	#100 en=0;  
	end
endmodule