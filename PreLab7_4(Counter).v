`timescale 1ns / 1ps

module Counter(clk, LED_green, LED_red, Q0, Q1);

	input wire clk;
	output wire [6:0] Q0, Q1;
	output reg LED_green, LED_red;
	reg [3:0] x0, x1;
	
	initial begin
		x0 = 4'b0001;
		x1 = 4'b1001;
		LED_green = 1;
		LED_red = 0;
	end
	
	always @(posedge clk) begin
		if(x0 == 4'b0 && x1 == 4'b1111) begin
			if(LED_green) begin
				x0 <= 4'b0110;
				x1 <= 4'b1001;
			end
			else if(LED_red) begin
				x0 <= 4'b0001;
				x1 <= 4'b1001;
			end
			LED_green <= ~LED_green;
			LED_red <= ~LED_red;
		end
		else begin
			if(x0 > 4'b0)
				x0 <= x0 - 4'b0001;
			else if(x0 == 4'b0 && x1 > 4'b0)
				x0 <= 4'b1001;
			if(x1 > 4'b0 && x0 == 4'b0)
				x1 <= x1 - 4'b0001;
			else if(x1 == 4'b0)
				x1 <= 4'b1111;
		end
	end
	
	BCDTO7SEG uut0 (Q0, x0);
	BCDTO7SEG uut1 (Q1, x1);

endmodule
