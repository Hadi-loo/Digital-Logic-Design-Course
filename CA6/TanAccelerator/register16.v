module register16(input clk,rst,load,init, input[15:0] in, input[15:0] initload, output reg [15:0] out);
	always @(posedge clk, posedge rst) begin
		if (rst) out <= 16'h0000;
		else begin
			if (init) out <= initload;
			else begin
				if (load) out <= in;
			end
		end
	end
endmodule
