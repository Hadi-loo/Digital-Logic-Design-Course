`timescale 1ns/1ns

module MyMain(input a,b,c,d, output w);
	supply1 Vdd;
	supply0 Gnd;
	wire nd, i, j, k, l, m, n;
	pmos #(4, 7, 9) P1(nd, Vdd, d);
	nmos #(3, 5, 7) N1(nd, Gnd, d);
	pmos #(4, 7, 9) P2(i, Vdd, a);
	pmos #(4, 7, 9) P3(i, Vdd, b);
	pmos #(4, 7, 9) P4(w, i, nd);
	pmos #(4, 7, 9) p5(j, Vdd, c);
	pmos #(4, 7, 9) P6(w, j, d);
	nmos #(3, 5, 7) N2(k, Gnd, c);
	nmos #(3, 5, 7) N3(k, Gnd, d);
	nmos #(3, 5, 7) N4(w, k, nd);
	nmos #(3, 5, 7) N5(l, k, b);
	nmos #(3, 5, 7) N6(w, l, a);
endmodule

module main_TB();
	logic aa = 0, bb = 1, cc = 0, dd = 1;
	wire w;
	MyMain M1(aa, bb, cc, dd, w);
	initial begin
		#100 aa = 1;
		#100 dd = 0;
	end

endmodule

