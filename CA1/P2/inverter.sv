`timescale 1ns/1ns

module MyInverter(input a,c, output w);
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

module MyInverter_TB();
	reg aa=1, cc=1;
	wire w;
	MyInverter I1(aa,cc,w);
	initial begin
		#40 aa = 0;
		#50 aa = 1; 
		#40 aa = 0;
		#50 cc = 0;
	end
endmodule