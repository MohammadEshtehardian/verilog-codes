module Q6(in, out);

    input [7:0] in;
    output [7:0] out;
    wire [7:0] in;
    wire [7:0] out;
    assign out[7] = in[7];
    assign out[6:0] = (in[7] == 0) ? in[6:0] : (~in[6:0] + 7'b0000001);

endmodule