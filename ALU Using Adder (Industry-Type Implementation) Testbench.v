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
    input cin, //added this
    output [3:0] num_out,
    output final_carry
);

    wire s_1;
    wire carry_out_1;

    Full_Adder bit_1 (
        
        .a(number_1[0]),
        .b(number_2[0]),
        .carry_in(cin), //changed the input to cin from 0 for bit_1
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

module ALU (
    input [3:0] a,
    input [3:0] b,
    input [2:0] sel,
    output reg [3:0] y,
    output reg carry
);
    wire [3:0] selective_inverter;
    wire cin_selected;
    wire [3:0] sum_wire;
    wire carry_wire;

    assign selective_inverter = (sel == 3'b001) ? ~b : b;
    assign cin_selected = (sel == 3'b001) ? 1'b1 : 1'b0;

    Four_bit_Adder instance_1 (
        .number_1(a),
        .number_2(selective_inverter),
        .cin(cin_selected),
        .num_out(sum_wire),
        .final_carry(carry_wire)
    );
    

    always @(*) begin
        case (sel)
            3'b000 : begin
                y = sum_wire;
                carry = carry_wire;
            end    
            3'b001 : begin
                y = sum_wire;
                carry = carry_wire;
            end
            3'b010 : y = a|b;
            3'b011 : y = a&b;
            3'b100 : y = a^b;
            default : begin
                y = 4'b0000;
                carry = 1'b0;
            end
        endcase
    end
endmodule

module tb_ALU();
  reg [3:0] a;
  reg [3:0] b;
  reg [2:0] sel;
  wire [3:0] y;
  wire carry;
  
  ALU tb_Instance (
    .a(a),
    .b(b),
    .sel(sel),
    .y(y),
    .carry(carry)
    );
    
    initial begin
      $monitor(" Time = %0t | a = %b | b = %b | sel = %b | output y = %b | output carry = %b",$time,a,b,sel,y,carry);
      a = 4'b0101;
      b = 4'b0011;
      sel = 3'b000;
      #10;
      a = 4'b1111;
      b = 4'b0001;
      sel = 3'b000;
      #10;
      a = 4'b0101;
      b = 4'b0011;
      sel = 3'b001;
      #10;
      a = 4'b0011;
      b = 4'b0101;
      sel = 3'b001;
    end
  
endmodule
  
