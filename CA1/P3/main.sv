`timescale 1ns/1ns
module main(input a, b, c, d, output w);
	wire i, j, k, l, m;
	nand #(14, 10) NA1(i, a, b);
	nand #(14, 10) NA2(j, d, i);
	nand #(14, 10) NA3(k, l, m);
	nand #(14, 10) NA4(w, j, k);
	not #(7, 9) NO1(l, c);
	not #(7, 9) NO2(m, d);
endmodule

module main_TB();
	reg aa = 0, bb = 1, cc = 0, dd = 1;
	wire w;
	main M1(aa, bb, cc, dd, w);
	initial begin
		#100 aa = 1;
		#100 cc = 1;
		#100 aa = 0;
	end
endmodule