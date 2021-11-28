`timescale 1ns/1ns
`include "Q7.v"

module Q7_tb;

reg [6:0] in;
wire [3:0] out;

Q7 uut(in, out);

initial begin
   
    $dumpfile("Q7.vcd");
    $dumpvars(0, Q7_tb);

    in = 7'b1110000;
    #20;

    in = 7'b0100100;
    #20;

    in = 7'b0000101;
    #20;

    $display("Test Complete");

end

endmodule