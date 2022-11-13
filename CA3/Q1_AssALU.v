module myALU_1(input signed [15:0] inN, input signed [15:0] inM, input inC, input [2:0] opc,
		output reg [15:0] outF, output zer, output neg);
	assign zer = (outF == 16'b0000000000000000) ? 1'b1 : 1'b0;
	assign neg = outF[15];
	always @(inN,inM,inC,opc) begin
		outF = 16'b0000000000000000;
		case(opc)
			3'b000: outF = inM + inN + inC;
			3'b001: outF = inM + (inN >>> 1);
			3'b010: outF = inM + 1;
			3'b011: outF = inM + (inM >>> 1);
			3'b100:	outF = inM & inN;
			3'b101:	outF = inM | inN;
			3'b110: outF = ~inM;
			3'b111: outF = 16'b0000000000000000;
			default: outF = 16'b0000000000000000;
		endcase
	end
endmodule