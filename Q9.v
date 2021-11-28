module Q9(in, out);

    input [23: 0] in;
    output [4:0] out;
    wire [23:0] in;
    reg [4:0] out;

    integer i;
    
    always @ (in) begin
       out = 5'b00000;
       for (i = 0; i < 24; i = i + 1) begin
            if(in[i] == 1)
                out = out + 5'b00001;
        end
    end

endmodule