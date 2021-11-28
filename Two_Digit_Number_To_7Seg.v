`timescale 1ns / 1ps

module Two_Digit_Number_To_7Seg(in, A, B);

	input wire [6:0] in;
	output wire [6:0] A, B;
	wire [3:0] x, y;

	assign x = in % 10;
	assign y = in / 10;
	
	BCDTO7SEG uut0 (A, x);
	BCDTO7SEG uut1 (B, y);
	
endmodule
