`timescale 1ns / 1ps

module JKFF(clk, J, K, clear, Q, nQ);

	input wire clk, J, K, clear;
	output reg Q, nQ;
	
	initial begin
		Q = 0;
		nQ = 1;
	end
	
	always @(negedge clk or negedge clear) begin
		if(!clear) begin
			Q <= 0;
			nQ <= 1;
		end
		else begin
			Q <= J * nQ + ~K * Q;
			nQ <= ~(J * nQ + ~K * Q);
		end
	end

endmodule
