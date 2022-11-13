`timescale 1ns/1ns
module FreqDiv177_TB();
	reg clk=0,rst=1;
	wire [7:0] w;
	wire co;
	FreqDiv177 UUT(co,clk,rst,w);
	initial begin
		#550 rst = 0;
		#100000 $stop;
	end
	always #100 clk = ~clk;
endmodule
