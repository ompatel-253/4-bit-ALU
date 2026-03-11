module ALU (
    input [3:0] a,
    input [3:0] b,
    input [2:0] sel,
    output reg [3:0] y,
    output reg carry
);

    wire [3:0] sum_wire;
    wire carry_wire;

    Four_bit_Adder sum_instance (
        .number_1(a),
        .number_2(b),
        .num_out(sum_wire),
        .final_carry(carry_wire)
    );
    
    wire [3:0] difference_wire;
    wire carry_d_wire;
    
    Four_bit_Adder difference_instance (
        .number_1(a),
        .number_2(~b + 4'b0001),
        .num_out(difference_wire),
        .final_carry(carry_d_wire)
    );

    always @(*) begin
        case (sel)
            3'b000 : begin
                y = sum_wire;
                carry = carry_wire;
            end    
            3'b001 : begin
                y = difference_wire;
                carry = carry_d_wire;
            end
            3'b010 : y = a|b;
            3'b011 : y = a&b;
            3'b100 : y = a^b;
        endcase
    end
endmodule

