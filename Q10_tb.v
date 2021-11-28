`timescale 1ns/1ns
`include "Q10.v"

module Q10_tb;

reg [15:0] A;
reg [15:0] B;
wire Greater;
wire Equal;

Q10 uut(A, B, Greater, Equal);

initial begin
   
    $dumpfile("Q10.vcd");
    $dumpvars(0, Q10_tb);

    A = 16'b1000000001000000;
    B = 16'b1000000001000000;
    #20

    A = 16'b0001001100010000;
    B = 16'b0000010000000001;
    #20;

    A = 16'b1000100000101000;
    B = 16'b1000000010000001;
    #20;

    A = 16'b1000000010000000;
    B = 16'b1000000010000000;
    #20;

    $display("Test Complete");

end

endmodule