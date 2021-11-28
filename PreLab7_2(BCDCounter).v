`timescale 1ns / 1ps

module BCDCounter(D, Load, ud, En, Q, clk);

	input wire Load, En, clk, ud;
	input wire [3:0] D;
	output wire [6:0] Q;
	reg [3:0] out;
	
	initial begin
		out = 4'b0000;
	end
	
	always @(posedge clk) begin
		if(En) begin
			if(~Load) begin
				if(~ud) begin
					if(out < 4'b1001)
						out <= out + 4'b0001;
					else 
						out <= 4'b0;
				end
				else if(ud) begin
					if(out > 4'b0)
						out <= out - 4'b0001;
					else
						out <= 4'b1001;
				end
			end
			else 
				out <= D;
		end
	end
	
	BCDTO7SEG uut (Q, out);

endmodule
