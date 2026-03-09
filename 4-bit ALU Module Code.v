module ALU (
    input [3:0] a,
    input [3:0] b,
    input [2:0] opcode,
    output reg [3:0] result
);
    always @(*) begin
        case (opcode)
            3'b000 : result = a + b;
            3'b001 : result = a - b;
            3'b010 : result = a & b;
            3'b011 : result = a | b;
            3'b100 : result = a ^ b;
            default : result = 0;
        endcase
    end
endmodule
