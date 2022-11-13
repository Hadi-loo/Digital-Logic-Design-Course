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

module MUX21(input a,b,s,e, output w);
	wire ns,j;
	Not N1(s,ns);
	TriStateNot N2(a,ns,j);
	TriStateNot N3(b,s,j);
	TriStateNot N4(j,e,w);
endmodule

module MUX41(input a,b,c,d,s1,s0, output w);
	wire ns1;
	Not N1(s1,ns1);
	MUX21 M1(a,b,s0,ns1,w);
	MUX21 M2(c,d,s0,s1,w);
endmodule

module TestBench();
	reg aa=1,bb=1,cc=0,dd=0,s1=1,s0=0;
	wire w;
	MUX41 M1(aa,bb,cc,dd,s1,s0,w);
	initial begin
	#50 s1=0;
	#100 s1=1;
	aa=0;
	bb=0;
	cc=1;
	dd=1;
	#150 s1=0;  
	end
endmodule
