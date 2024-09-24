module alu_1bit (
    input A,        
    input B,          
    input [2:0] Op,   
    output Result,   
    output CarryOut   
);

    wire add_res, sub_res, mul_res, and_res, or_res, xor_res;
    wire add_carry, sub_borrow;

   
    full_adder FA (
        .A(A),
        .B(B),
        .Cin(1'b0),   // No carry-in for 1-bit ALU
        .Sum(add_res),
        .Cout(add_carry)
    );

    
    full_adder SUB (
        .A(A),
        .B(~B),        // Invert B for subtraction (A - B = A + (-B))
        .Cin(1'b1),    // Cin = 1 for two's complement
        .Sum(sub_res),
        .Cout(sub_borrow)
    );

    
    assign mul_res = A & B;

    
    assign and_res = A & B;

  
    assign or_res = A | B;

    
    assign xor_res = A ^ B;

    // Use a 6-to-1 multiplexer to select the operation based on Op-Code
    mux_6to1 mux (
        .in0(add_res),  // 000 -> Addition
        .in1(sub_res),  // 001 -> Subtraction
        .in2(mul_res),  // 010 -> Multiplication
        .in3(and_res),  // 011 -> AND
        .in4(or_res),   // 100 -> OR
        .in5(xor_res),  // 101 -> XOR
        .sel(Op),
        .out(Result)
    );


    assign CarryOut = (Op == 3'b000) ? add_carry : 
                      (Op == 3'b001) ? sub_borrow : 1'b0; 

endmodule


module mux_6to1 (
    input in0, in1, in2, in3, in4, in5,  
    input [2:0] sel,                    
    output out                          
);

    assign out = (sel == 3'b000) ? in0 :
                 (sel == 3'b001) ? in1 :
                 (sel == 3'b010) ? in2 :
                 (sel == 3'b011) ? in3 :
                 (sel == 3'b100) ? in4 :
                 (sel == 3'b101) ? in5 : 1'b0;

endmodule


module full_adder (
    input A, B, Cin,
    output Sum, Cout
);

    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (Cin & (A ^ B));

endmodule
