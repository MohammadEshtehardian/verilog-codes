module Q8(A, B, C);

    input [3:0] A;
    input [3:0] B;
    output [4:0] C;
    wire [3:0] A;
    wire [3:0] B;
    wire [4:0] C;
    Sub(A, B, C);

endmodule

module CompToSignMag(in, out);

    input [3:0] in;
    output [3:0] out;
    wire [3:0] in;
    wire [3:0] out;
    assign out = (in[3] == 0) ? in : (~in + 4'b0001);

endmodule

module Complement(in, out);
    input [3:0] in;
    output [3:0] out;
    wire [3:0] in;
    wire [3:0] out;
    assign out = ~in + 4'b0001;
endmodule

module Collator(A, B, G, E, L);

    input [3:0] A;
    input [3:0] B;
    output G, E, L;
    wire [3:0] A;
    wire [3:0] B;
    reg G, E, L;
    always @(A or B) begin
        wire As, Bs;
        CompToSignMag(A, As);
        CompToSignMag(B, Bs);
        if(As[3] == 0 && Bs[3] == 1) begin
            G = 1;
            E = 0;
            L = 0;
        end else if(As[3] == 1 && Bs[3] == 0) begin
            G = 0;
            E = 0;
            L = 1;
        end
        else if(As[3] == 0 && Bs[3] == 0) begin
            if(As[2:0] > Bs[2:0]) begin
                G = 1;
                E = 0;
                L = 0;
            end else if (As [2:0] < Bs[2:0]) begin
                G = 0;
                E = 0;
                L = 1;
            end
        end else begin
            if(As[2:0] > Bs[2:0]) begin
                G = 0;
                E = 0;
                L = 1;
            end else if(As[2:0] < Bs[2:0]) begin
                 G = 1;
                 E = 0;
                 L = 0;
            end
        end
        else begin
            G = 0;
            E = 1;
            L = 0;
        end
    end

endmodule

module Sub(A1, B1, out);

    input [3:0] A1;
    input [3:0] B1;
    output [4:0] out;
    wire [3:0] A1;
    wire [3:0] B1;
    reg [4:0] out;
    reg G1, E1, L1;
    wire AComp, BComp;
    Complement(A1, AComp);
    Complement(B1, BComp);
    Collator(A1, B1, G1, E1, L1);
    always @(A1 or B1) begin
        if(G1 == 1)
            out = A1 + BComp;
        else if(E1 == 1)
            out = 5'b00000;
        else
            out = B1 + AComp;
    end

endmodule