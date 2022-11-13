`timescale 1ns/1ns
module absas(input [7:0] a, output [7:0] w);
	assign w = a[7] ? a : ~a + 1'b1;
endmodule