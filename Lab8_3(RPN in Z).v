`timescale 1ns / 1ps

module RPN(in, operator, get_input, get_operator, pop, delete, out2, out1, out0, sign);

	input wire [7:0] in;
	input wire [1:0] operator;
	input wire get_input, get_operator, pop, delete;
	
	parameter n = 4;
	output wire [6:0] out2, out1, out0, sign;
	wire [3:0] y2, y1, y0;
	reg [7:0] x [0:n-1];
	wire [7:0] z;
	integer i;
	
	assign z = ~x[0] + 1;
	assign sign = x[0][7] ? 7'b0000001 : 7'b0;
	assign y0 = (x[0][7]) ? z % 10 : x[0] % 10;
	assign y1 = (x[0][7]) ? (z % 100 - z % 10) / 10 :(x[0] % 100 - x[0] % 10) / 10;
	assign y2 = (x[0][7]) ? z / 100 : x[0] / 100;
	
	BCDTO7SEG uut0 (out0, y0);
	BCDTO7SEG uut1 (out1, y1);
	BCDTO7SEG uut2 (out2, y2);
	
	
	initial begin
		for(i = 0; i < n;  i = i+1) begin
			x[i] = 0;
		end
	end
	
	always @(get_input or get_operator or pop or delete) begin
		if(get_input) begin
			for(i = 1; i < n;  i = i+1) begin
				x[i] <= x[i-1];
			end
			x[0] <= in;
		end
		if(pop) begin
			for(i = 0; i < n-1;  i = i+1) begin
				x[i] <= x[i+1];
			end
			x[n-1] <= 0;
		end
		if(delete) begin
			for(i = 0; i < n;  i = i+1) begin
				x[i] = 0;
			end
		end
		if(get_operator) begin
			if(operator == 0) begin
				if(x[0][7] && x[1][7]) begin
					x[0] <= (~x[0] + 1) * (~x[1] + 1);
				end
				else if(~x[0][7] && ~x[1][7]) begin
					x[0] <= x[0] * x[1];
				end
				else if(~x[0][7] && x[1][7]) begin
					x[0] <= ~(x[0] * (~x[1] + 1)) + 1;
				end
				else if(x[0][7] && ~x[1][7]) begin
					x[0] <= ~(x[1] * (~x[0] + 1)) + 1;
				end
				for(i = 1; i < n-1;  i = i+1) begin
					x[i] <= x[i+1];
				end
				x[n-1] <= 0;
			end
			else if(operator == 1) begin 
				x[0] <= x[0] + x[1];
				for(i = 1; i < n-1;  i = i+1) begin
					x[i] <= x[i+1];
				end
				x[n-1] <= 0;
			end
			else if(operator == 2) begin
				x[0] <= x[0] + (~x[1] + 1);
				for(i = 1; i < n-1;  i = i+1) begin
					x[i] <= x[i+1];
				end
				x[n-1] <= 0;
			end
		end
	end
	
	
	

endmodule
