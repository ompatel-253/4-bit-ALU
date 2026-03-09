module tb_ALU; 

    
    reg [3:0] t_a;
    reg [3:0] t_b;
    reg [2:0] t_opcode;
    wire [3:0] t_result;

   
    ALU my_alu (
        .a(t_a), 
        .b(t_b), 
        .opcode(t_opcode), 
        .result(t_result)
    );

    
    initial begin
        $monitor("Time=%0t | A=%b B=%b Op=%b | Result=%b (%d)", $time, t_a, t_b, t_opcode, t_result, t_result);
        
        t_a = 0;
        t_b = 0;
        t_opcode = 0;
        
        
        #10;
        
        t_a = 0010;
        t_b = 0011;
        t_opcode = 000;
        
        
        #10;
        
        t_a = 0101;
        t_b = 0011;
        t_opcode = 010;
        
        
        #10;
        
        
        
        
        
        $finish;
    end

endmodule
