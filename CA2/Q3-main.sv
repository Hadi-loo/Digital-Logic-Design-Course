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

module octalMUX21(input a[7:0],b[7:0],se,en, output w[7:0]);
	MUX21 M1(a[0],b[0],se,en,w[0]);
	MUX21 M2(a[1],b[1],se,en,w[1]);
	MUX21 M3(a[2],b[2],se,en,w[2]);
	MUX21 M4(a[3],b[3],se,en,w[3]);
	MUX21 M5(a[4],b[4],se,en,w[4]);
	MUX21 M6(a[5],b[5],se,en,w[5]);
	MUX21 M7(a[6],b[6],se,en,w[6]);
	MUX21 M8(a[7],b[7],se,en,w[7]);
endmodule

module octalMUXas(input a[7:0],b[7:0],se, output w[7:0]);
	assign #(39,43) w = se ? b : a;
endmodule

module TestBench();
	reg aa[7:0]={0,0,1,0,1,1,1,0};
	reg bb[7:0]={1,1,0,0,1,0,0,1};
	reg se=0,en=1;
	wire w1[7:0];
	wire w2[7:0];
	octalMUX21 M1(aa,bb,se,en,w1);
	octalMUXas M2(aa,bb,se,w2);
	initial begin
	#50 se = 1;
	#50 se = 0;
	aa[0] = 1;
	bb[0] = 0;
	#100 se=1;
	#100 en=0;  
	end
endmodule
