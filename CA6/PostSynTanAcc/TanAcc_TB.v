`timescale 1ns/1ns
module TanAcc_TB();
	reg rst = 0;
	reg clk = 0;
	reg start = 0;
	reg [15:0] x = 16'b1100100100001111;
	wire ready;
	wire busy;
	wire [15:0] yBus; 	
	TanAcc UUT(ready,clk,rst,start,x,busy,yBus);

	initial begin
		#200 start = 1;
		#5000 $stop;
	end

	always #100 clk = ~clk;

endmodule
