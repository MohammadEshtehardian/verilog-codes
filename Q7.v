module Q7(in, out);

    input [6:0] in;
    output [3:0] out;
    wire [6:0] in;
    wire [3:0] out;
    wire a,b,c;
    xor(a, in[6], in[4], in[2], in[0]);
    xor(b, in[5], in[4], in[1], in[0]);
    xor(c, in[3], in[2], in[1], in[0]);
    assign out[3] = ((a == 1) && (b == 1) && (c == 0)) ? ~in[4] : in[4];
    assign out[2] = ((a == 1) && (b == 0) && (c == 1)) ? ~in[2] : in[2];
    assign out[1] = ((a == 0) && (b == 1) && (c == 1)) ? ~in[1] : in[1];
    assign out[0] = ((a == 1) && (b == 1) && (c == 1)) ? ~in[0] : in[0];

endmodule