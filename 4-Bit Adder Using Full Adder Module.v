module Full_Adder (
    input a,
    input b,
    input carry_in,
    output s,
    output carry_out
);
    
    assign s = a^b^carry_in;
    assign carry_out = (a&b) | (carry_in&(a^b));
endmodule
    
module Four_bit_Adder (
    
    input [3:0] number_1,
    input [3:0] number_2,
    output [3:0] num_out,
    output final_carry
);

    wire s_1;
    wire carry_out_1;

    Full_Adder bit_1 (
        
        .a(number_1[0]),
        .b(number_2[0]),
        .carry_in(0),
        .s(s_1),
        .carry_out(carry_out_1)
    );
    
    wire s_2;
    wire carry_out_2;
    
    
    Full_Adder bit_2 (
        .a(number_1[1]),
        .b(number_2[1]),
        .carry_in(carry_out_1),
        .s(s_2),
        .carry_out(carry_out_2)
    );
    
    wire s_3;
    wire carry_out_3;
    
    
    Full_Adder bit_3 (
        .a(number_1[2]),
        .b(number_2[2]),
        .carry_in(carry_out_2),
        .s(s_3),
        .carry_out(carry_out_3)
    );
    
    wire s_4;
    wire carry_out_4;
    
    
    Full_Adder bit_4 (
        .a(number_1[3]),
        .b(number_2[3]),
        .carry_in(carry_out_3),
        .s(s_4),
        .carry_out(carry_out_4)
    );
    
    assign num_out[0] = s_1;
    assign num_out[1] = s_2;
    assign num_out[2] = s_3;
    assign num_out[3] = s_4;
    assign final_carry = carry_out_4;
    
endmodule
