`timescale 1ns/1ns
`include "Q9.v"

module Q9_tb;

reg [23:0] in;
wire [4:0] out;

Q9 uut(in, out);

initial begin
   
    $dumpfile("Q9.vcd");
    $dumpvars(0, Q9_tb);

    in = 24'b100000000010000011000000;
    #20;

    in = 24'b101000000010000011000001;
    #20;

    in = 24'b100001000011110011000000;
    #20;

    $display("Test Complete");

end

endmodule