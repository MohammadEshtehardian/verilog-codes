`timescale 1ns/1ns
`include "Q8.v"

module Q8_tb;

reg [3:0] A;
reg [3:0] B;
wire [4:0] C;

Q8 uut(A, B, C);

initial begin
   
    $dumpfile("Q8.vcd");
    $dumpvars(0, Q8_tb);

    A = 0000;
    B = 0001;
    #20;

    A = 1001;
    B = 0011;
    #20;

    A = 0010;
    B = 0100;
    #20;

    $display("Test Complete");

end

endmodule