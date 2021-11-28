`timescale 1ns / 1ps

module RPN_tb;

	// Inputs
	reg [7:0] in;
	reg [1:0] operator;
	reg get_input;
	reg get_operator;
	reg pop;
	reg delete;

	// Outputs
	wire [6:0] out2, out1, out0;

	// Instantiate the Unit Under Test (UUT)
	RPN uut (
		.in(in), 
		.operator(operator), 
		.get_input(get_input), 
		.get_operator(get_operator), 
		.pop(pop), 
		.delete(delete), 
		.out2(out2),
		.out1(out1),
		.out0(out0)
	);

	initial begin
		
		get_operator = 0;
		pop = 0;
		delete = 0;
		get_input = 0;
		operator = 0;
		
		in = 8'b00001110;
		#10;
		get_input = 1;
		#10;
		get_input = 0;
		#100;
		
		get_input = 1;
		in = 8'b00001111;
		#10;
		get_input = 0;
		#100;
		
		get_operator = 1;
		#10;
		get_operator = 0;
		#100;
		
		in = 8'b00001100;
		get_input = 1;
		#10;
		get_input = 0;
		#100;
		
		in = 8'b00100100;
		get_input = 1;
		#10;
		get_input = 0;
		#100;
		
		operator = 2'b01;
		get_operator = 1;
		#10;
		get_operator = 0;
		#100;
		
		pop = 1;
		#10;
		pop = 0;
		#100;
		
		in = 8'b00001110;
		get_input = 1;
		#10;
		get_input = 0;
		#100;
		
		in = 8'b00011010;
		get_input = 1;
		#10;
		get_input = 0;
		#100;
		
		operator = 2'b10;
		get_operator = 1;
		#10;
		get_operator = 0;
		#100;
		
		delete = 1;
		#10;
		delete = 0;
		#100;
		
	end
      
endmodule

