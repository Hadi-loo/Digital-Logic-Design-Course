module adder16(input [15:0] a, input [15:0] b, output [15:0] w);
	wire [16:0] t;
	assign t = (a + b);
	assign w = t[15:0];
endmodule
