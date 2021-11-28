module FourBitCo(A, B, Greater, Equal);

    input [3:0] A;
    input [3:0] B;
    output Greater;
    output Equal;
    wire [3:0] A;
    wire [3:0] B;
    reg Greater;
    reg Equal;

    always @(A or B) begin
        Greater = 0;
        Equal = 0;
        if(A > B)
            Greater = 1;
        else if(A == B)
            Equal = 1;
    end

endmodule

module Q10(A, B, Greater, Equal);

    input [15:0] A;
    input [15:0] B;
    output Greater;
    output Equal;
    wire [15:0] A;
    wire [15:0] B;
    wire Greater;
    wire Equal;
    wire G0, G1, G2, G3;
    wire E0, E1, E2, E3;
    FourBitCo f0 (A[3:0], B[3:0], G0, E0);
    FourBitCo f1 (A[7:4], B[7:4], G1, E1);
    FourBitCo f2 (A[11:8], B[11:8], G2, E2);
    FourBitCo f3 (A[15:12], B[15:12], G3, E3);
    wire z0, z1, z2, z3;
    assign z0 = G3;
    and(z1, E3, G2);
    and(z2, E3, E2, G1);
    and(z3, E3, E2, E1, G0);
    or(Greater, z0, z1, z2, z3);
    and(Equal, E3, E2, E1, E0);

endmodule