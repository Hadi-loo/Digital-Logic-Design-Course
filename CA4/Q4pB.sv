`timescale 1ns/1ns
module shiftreg8(input serIn,clk,rst, output reg [7:0] PO, output Q);
	always @(posedge clk) begin
		if (rst) PO <= 8'd0;
		else PO <= {serIn,PO[7:1]};
 	end
	assign #(1500) Q = PO[0];
endmodule

module ShiftReg_TB();
	reg D = 1;
	reg clk = 0;
	reg rst = 1;
	wire w;
	shiftreg8 SR8(D,clk,rst, w);
	initial begin
		#110 rst = 0;
		#150 D = ~D;
		#300 D = ~D;
		#300 D = ~D;
		#300 D = ~D;
		#180 D = ~D;
		#100 D = ~D;
		#110 D = ~D;
		#30 D = ~D;
		#70 D = ~D;
		#120 D = ~D;
		#30 D = ~D;
		#40 D = ~D;
		#50 D = ~D;
		#90 D = ~D;
		#70 D = ~D;
		#80 D = ~D;
		#60 D = ~D;
		#200 D = ~D;
		#400 D = ~D;
		#250 D = ~D;
		#150 D = ~D;
		#300 D = ~D;
		#200 D = ~D;
		#200 D = ~D;
	end
	always #100 clk = ~clk;
endmodule



