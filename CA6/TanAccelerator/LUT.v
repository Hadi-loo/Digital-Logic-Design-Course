module LUT(input [3:0] adr, output [15:0] data);
	reg [15:0] temp_data;
	always @(adr) begin
		case(adr)
			0: temp_data = 16'h0000; // 0
			1: temp_data = 16'h5555; // 1/3
			2: temp_data = 16'h2222; // 2/15
			3: temp_data = 16'h0DD0; // 17/315
			4: temp_data = 16'h0599; // 62/2835
			5: temp_data = 16'h0244; // 1382/155925
			6: temp_data = 16'h00EB; // 21844/6081075
			7: temp_data = 16'h005F; // 929569/638512875
		endcase
	end
	assign data = temp_data;
endmodule
