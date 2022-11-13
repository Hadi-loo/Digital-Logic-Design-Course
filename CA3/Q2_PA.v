module BITAND(input [15:0] a,b, output [15:0] w);
	assign w = a & b;
endmodule

module BITOR(input [15:0] a,b, output [15:0] w);
	assign w = a | b;
endmodule 

module BITNOT(input [15:0] a, output [15:0] w);
	assign w = ~a;
endmodule

module OTRSHIFTER(input signed [15:0] a, output [15:0] w);
	assign w = a >>> 1;
endmodule

module MUX4_1(input a,b,c,d, input [1:0] s, output w);
	assign w =	(s == 2'b00) ? a:
			(s == 2'b01) ? b:
			(s == 2'b10) ? c:
			(s == 2'b11) ? d:
			1'bx;
endmodule

module MUX4_16(input [15:0] a,b,c,d, input [1:0] s, output [15:0] w);
	assign w =	(s == 2'b00) ? a:
			(s == 2'b01) ? b:
			(s == 2'b10) ? c:
			(s == 2'b11) ? d:
			16'bxxxxxxxxxxxxxxxx;
endmodule

module ADDER(input [15:0] a, b, input c, output [15:0] w);
	assign w = a + b + c;
endmodule

module ALU(input signed [15:0] inN, input signed [15:0] inM, input inC, input [2:0] opc,
		output [15:0] outF, output zer, output neg);
	wire [15:0] shM,shN,Fmux,ADDres,invM,orMN,andMN;
	wire Smux,S0,S1;
	reg [15:0] Szero = 16'b0000000000000000;
	reg Ozero = 1'b0;
	reg Oone = 1'b1;
	
	OTRSHIFTER SHIFTER1(inM,shM);
	OTRSHIFTER SHIFTER2(inN,shN);
	MUX4_16 MUX1(inN,shN,Szero,shM, {opc[1],opc[0]}, Fmux);
	MUX4_1 MUX2(inC,Ozero,Oone,Ozero, {opc[1],opc[0]}, Smux);
	ADDER ADD1(inM,Fmux,Smux,ADDres);
	BITNOT NOT1(inM,invM);
	BITOR OR1(inM,inN, orMN);
	BITAND AND1(inM,inN, andMN);
	nand Nand1(S0, opc[2], ~opc[0]);
	nand Nand2(S1, opc[2], ~opc[1]);
	MUX4_16 MUX3(andMN,orMN,invM,ADDres, {S1,S0}, outF);
	assign neg = outF[15];
	assign zer = ~(|(outF));
endmodule

`timescale 1ns/1ns

module myALU_TB();
	reg signed [15:0] inN;
	reg signed [15:0] inM;
	reg inC;
	reg [2:0] opc;
	wire [15:0] outF;
	wire zer;
	wire neg;
	ALU ALU1(inN, inM, inC, opc, outF, zer, neg);
	initial begin
		repeat (20) #50 begin
			#5 inM = $random;
			#5 inN = $random;
			#5 inC = $random;
			#5 opc = $random;
		end
	end
endmodule