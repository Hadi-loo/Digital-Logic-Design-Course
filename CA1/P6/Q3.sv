`timescale 1ns/1ns
module Q3_gate(input a, b, c, d, output w);
	wire i, j, k, l, m;
	nand #(14, 10) NA1(i, a, b);
	nand #(14, 10) NA2(j, d, i);
	nand #(14, 10) NA3(k, l, m);
	nand #(14, 10) NA4(w, j, k);
	not #(7, 9) NO1(l, c);
	not #(7, 9) NO2(m, d);
endmodule