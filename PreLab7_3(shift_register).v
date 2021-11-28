`timescale 1ns / 1ps

module shift_register(serial_in, parallel_in, clk, Load, clear, shift, out);

	input wire serial_in, Load, clear, shift, clk;
	input wire [7:0] parallel_in;
	output reg [7:0] out;
	
	always @(posedge clk, negedge clear) begin
		if(~clear)
			out <= 8'b0;
		else if(shift) begin
			if(Load) begin
				out <= parallel_in;
			end
			else begin
				out[7:1] <= out[6:0];
				out[0] <= serial_in;
			end
		end
	end

endmodule
