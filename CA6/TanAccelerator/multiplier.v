module multiplier(input [15:0] a, input [15:0] b, output [15:0] w);
	wire [31:0] t;
	assign t = (a * b);
	assign w = t[31:16];
endmodule
