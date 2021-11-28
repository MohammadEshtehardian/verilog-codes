`timescale 1ns/1ns
`include "Q10.v"

module Q10_tb;

reg [3:0] A;
reg [3:0] B;
wire Greater;
wire Equal;

FourBitCo uut(A, B, Greater, Equal);

initial begin
   
    $dumpfile("Q10.vcd");
    $dumpvars(0, Q10_tb);

    A = 4'b0001;
    B = 4'b0000;
    #20;

    A = 4'b0001;
    B = 4'b0001;
    #20;

    A = 4'b0001;
    B = 4'b0010;
    #20;

    $display("Test Complete");

end

endmodule