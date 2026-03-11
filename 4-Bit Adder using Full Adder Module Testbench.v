module Four_bit_Adder_tb ();
    reg [3:0] number_1;
    reg [3:0] number_2;
    wire [3:0] num_out;
    wire final_carry;
    
    Four_bit_Adder Instance_1 (
    .number_1(number_1),
    .number_2(number_2),
    .num_out(num_out),
    .final_carry(final_carry)
    );
    
endmodule
