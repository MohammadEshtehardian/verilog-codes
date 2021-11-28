`timescale 1ns/1ns
`include "Q6.v"

module Q6_tb;

reg [7:0] in;
wire [7:0] out;

Q6 uut(in, out);

initial begin
   
    $dumpfile("Q6.vcd");
    $dumpvars(0, Q6_tb);

    in = 8'b00001111;
    #20;

    in = 8'b10000111;
    #20;

    in = 8'b11001100;
    #20;

    $display("Test Complete");

end

endmodule