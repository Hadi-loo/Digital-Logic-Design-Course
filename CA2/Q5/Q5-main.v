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

module octalMUX21(input [7:0] a, [7:0] b,se,en, output [7:0] w);
	MUX21 M1(a[0],b[0],se,en,w[0]);
	MUX21 M2(a[1],b[1],se,en,w[1]);
	MUX21 M3(a[2],b[2],se,en,w[2]);
	MUX21 M4(a[3],b[3],se,en,w[3]);
	MUX21 M5(a[4],b[4],se,en,w[4]);
	MUX21 M6(a[5],b[5],se,en,w[5]);
	MUX21 M7(a[6],b[6],se,en,w[6]);
	MUX21 M8(a[7],b[7],se,en,w[7]);
endmodule

module complementor(input [7:0] a, output [7:0] w);
	supply0 f0;
	wire f1,f2,f3,f4,f5,f6,f7;
	slice S1(a[0],f0, w[0],f1);
	slice S2(a[1],f1, w[1],f2);
	slice S3(a[2],f2, w[2],f3);
	slice S4(a[3],f3, w[3],f4);
	slice S5(a[4],f4, w[4],f5);
	slice S6(a[5],f5, w[5],f6);
	slice S7(a[6],f6, w[6],f7);
	slice S8(a[7],f7, w[7],f0);

endmodule

module slice(input a,flag, output w,nflag);
	xor #(10,14) X1 (w, a,flag);
	or #(17,25) O1 (nflag, a,flag); 	

endmodule

module abs(input [7:0] a, output [7:0] w);
	wire [7:0] ac;
	reg en = 1;
	complementor Comp(a, ac);
	octalMUX21 OM (a,ac,a[7],en, w);
endmodule

module absas(input [7:0] a, output [7:0] w);
	assign #(152) w = a[7] ? ~a + 1'b1 : a;
endmodule

module TestBench();
	reg [7:0] aa = {1,1,1,1,1,1,1,1};
	wire [7:0] ww1;
	wire [7:0] ww2;
	abs A1(aa,ww1);
	absas A2(aa,ww2);
	initial begin
	#300 aa[7] = 0;
	aa[6] = 0;
	aa[5] = 0;
	aa[4] = 0;
	aa[3] = 0;
	aa[2] = 0;
	aa[1] = 0;
	aa[0] = 0;
	#300 aa[7] = 1;
	aa[6] = 1;
	aa[5] = 0;
	aa[4] = 1;
	aa[3] = 0;
	aa[2] = 1;
	aa[1] = 0;
	aa[0] = 1;
	#300 aa[7] = 0;
	aa[6] = 1;
	aa[5] = 1;
	aa[4] = 1;
	aa[3] = 0;
	aa[2] = 1;
	aa[1] = 1;
	aa[0] = 0;
	end

endmodule



