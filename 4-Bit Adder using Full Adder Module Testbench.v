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

    initial begin 
        $monitor("Time=%0t | number_1=%b | number_2 = %b | Output sum = %b | Output carry = %b", $time,number_1,number_2,num_out,final_carry);
        number_1 = 4'b0101;
        number_2 = 4'b0011;
        #10;
        number_1 = 4'b0100;
        number_2 = 4'b0011;
        #10;
        number_1 = 4'b0001;
        number_2 = 4'b0010;
        #10;
        number_1 = 4'b0100;
        number_2 = 4'b0100;
        #10;
        number_1 = 4'b1000;
        number_2 = 4'b1000;
        #10;
        number_1 = 4'b1001;
        number_2 = 4'b1001;
    end
    
endmodule
