`timescale 1ns/1ns
module gate_TB();
	reg aa=0, bb=1, cc=0, dd=1;
	wire w1,w2,w3;
	Q3_gate Q3(aa,bb,cc,dd, w1);
	Q4_gate Q4(aa,bb,cc,dd, w2);
	Q5_gate Q5(aa,bb,cc,dd, w3);
	initial begin
		#100 aa=1;
		#50 aa=0;
		bb=0;
		cc=1;
		#100 dd=0;
		#200 dd=1;
		#50 aa=1;
		bb=1;
		#100 aa=0;
		#50 aa=1;
		cc=0;
		#100 dd=0;
	end
endmodule
