`timescale 1ns / 1ps
module BCDTO7SEG(out, in);

	//inputs and outputs
	input wire [3:0] in;
	output reg [6:0] out;
	
	//initialize
	initial begin
		out = 7'b0000000;
	end
	
	//main code
	always @(in) begin
		if(in == 4'b0000)
			out = 7'b1111110;
		else if(in == 4'b0001)
			out = 7'b0110000;
		else if(in == 4'b0010)
			out = 7'b1101101;
		else if(in == 4'b0011)
			out = 7'b1111001;
		else if(in == 4'b0100)
			out = 7'b0110011;
		else if(in == 4'b0101)
			out = 7'b1011011;
		else if(in == 4'b0110)
			out = 7'b1011111;
		else if(in == 4'b0111)
			out = 7'b1110000;
		else if(in == 4'b1000)
			out = 7'b1111111;
		else if(in == 4'b1001)
			out = 7'b1111011;
		else
			out = 7'b0000000;
	end

endmodule


