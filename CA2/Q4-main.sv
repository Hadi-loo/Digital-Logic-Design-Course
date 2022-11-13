`timescale 1ns/1ns
module complementor(input [7:0] a, output [7:0] w);
	supply0 f0;
	wire f1,f2,f3,f4,f5,f6,f7;
	slice S1(a[0],f0, w[0],f1);
	slice S2(a[1],f1, w[1],f2);
	slice S3(a[2],f2, w[2],f3);
	slice S4(a[3],f3, w[3],f4);
	slice S5(a[4],f4, w[4],f5);
	slice S6(a[5],f5, w[5],f6);
	slice S7(a[6],f6, w[6],f7);
	slice S8(a[7],f7, w[7],f0);

endmodule

module slice(input a,flag, output w,nflag);
	xor #(10,14) X1 (w, a,flag);
	or #(17,25) O1 (nflag, a,flag); 	

endmodule

module complementoras(input [7:0] a, output [7:0] w);
	assign #(200) w = ~a + 1'b1;

endmodule

module TestBench();
	reg [7:0] aa = {1,1,1,1,1,1,1,1};
	wire [7:0] ww1;
	wire [7:0] ww2;
	complementor C1(aa,ww1);
	complementoras C2(aa,ww2);
	initial begin
	#300 aa[7] = 0;
	aa[6] = 0;
	aa[5] = 0;
	aa[4] = 0;
	aa[3] = 0;
	aa[2] = 0;
	aa[1] = 0;
	aa[0] = 0;
	end

endmodule