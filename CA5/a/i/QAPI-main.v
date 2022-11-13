`timescale 1ns/1ns
module moore10110_pre(input clk,rst,j, output w);
	reg [2:0] ns,ps;
	parameter [2:0] A=3'b000, B=3'b001, C=3'b010, D=3'b011, E=3'b100, F=3'b101; 
	
	always @(ps,j) begin
		ns = A;
		case(ps)
			A: ns= j ? B : A;
			B: ns= j ? B : C;
			C: ns= j ? D : A;
			D: ns= j ? E : C;
			E: ns= j ? B : F;
			F: ns= j ? D : A;
			default: ns= A;
		endcase
	end

	assign w= (ps==F) ? 1'b1 : 1'b0;

	always @(posedge clk, posedge rst) begin
		if (rst)
			ps <= A;
		else
			ps <= ns;
	end

endmodule

module moore10110_TB();
	reg j=0,clk=0,rst=0;
	wire w;
	moore10110_pre M(clk,rst,j, w);
	initial begin
		#220 rst = 1;
		#130 rst = 0;
		#200 j = 1;
		#200 j = 0;
		#200 j = 1;
		#200 j = 1;
		#200 j = 0;
		#200 j = 1;
		rst = 1;
		#200 j = 1;
		rst = 0;
		#200 j = 0;
		#200 j = 0;
		#200 j = 1;
		#200 j = 0;
		#200 j = 1;
		#200 j = 0;
		#200 j = 1;
		#200 j = 1;
		#200 j = 0;
		#200 j = 1;
		#200 j = 1;
		#200 j = 0;
		#200 j = 0;
		#200 j = 0;
		#200 j = 1;
		#200 j = 0;
		#200 j = 0;
	end
	always #100 clk = ~clk;
endmodule





