`timescale 1ns / 1ps

module Detector(in, clk, turn_on, reset, A, B);

	input wire in, clk, reset;
	output reg turn_on = 0;
	output wire [6:0] A, B;
	reg [6:0] x = 7'b0000000;
	reg [3:0] y = 4'b0000;
	reg finished = 0;
	
	always @(posedge clk, negedge reset) begin
		if(~reset) begin
			finished <= 0;
			turn_on <= 0;
			y <= 0;
			x <= 0;
		end
		else if(~turn_on && ~finished) begin
			y[3:1] <= y[2:0];
			y[0] <= in;
			if(y == 4'b1001)
				turn_on <= 1;
		end
		else if(~finished) begin
			y[3:1] <= y[2:0];
			y[0] <= in;
			if(y == 4'b0110)
				x <= x + 1;
			if(y == 4'b1001) begin
				finished <= 1;
				turn_on <= 0;
			end
		end
	end
	
	Two_Digit_Number_To_7Seg uut2 (x, A, B);

endmodule
