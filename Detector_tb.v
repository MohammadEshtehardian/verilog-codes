`timescale 1ns / 1ps

module Detector_tb;

	// Inputs
	reg in;
	reg clk = 0;
	reg reset = 1;

	// Outputs
	wire turn_on;
	wire [6:0] A;
	wire [6:0] B;

	// Instantiate the Unit Under Test (UUT)
	Detector uut (
		.in(in), 
		.clk(clk), 
		.turn_on(turn_on), 
		.reset(reset),
		.A(A), 
		.B(B)
	);

	initial begin
	
		in = 0;
		reset = 0;
		#10;
		reset = 1;
		#90;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 0;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		
		in = 0;
		#100;
		
		in = 1;
		#100;
		
		in = 1;
		#100;
		

	end
	
	always clk = #50 ~clk;
      
endmodule

