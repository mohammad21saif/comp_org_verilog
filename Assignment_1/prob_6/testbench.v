module test_alu_1bit;

    reg A, B;            // Inputs to the ALU
    reg [2:0] Op;        // 3-bit Op-Code
    wire Result;         // Output from the ALU
    wire CarryOut;       // CarryOut from the ALU for addition/subtraction

    // Instantiate the 1-bit ALU
    alu_1bit uut (
        .A(A),
        .B(B),
        .Op(Op),
        .Result(Result),
        .CarryOut(CarryOut)
    );

    // Test procedure
    initial begin
        // Display header for clarity
        $display("Op  | A  B  | Result | CarryOut");
        $display("-----------------------------");

        // Test ADDITION (Op = 000)
        A = 1'b0; B = 1'b0; Op = 3'b000; #10;
        $display("ADD | %b  %b  |   %b    |    %b", A, B, Result, CarryOut);
        A = 1'b0; B = 1'b1; Op = 3'b000; #10;
        $display("ADD | %b  %b  |   %b    |    %b", A, B, Result, CarryOut);
        A = 1'b1; B = 1'b0; Op = 3'b000; #10;
        $display("ADD | %b  %b  |   %b    |    %b", A, B, Result, CarryOut);
        A = 1'b1; B = 1'b1; Op = 3'b000; #10;
        $display("ADD | %b  %b  |   %b    |    %b", A, B, Result, CarryOut);

        // Test SUBTRACTION (Op = 001)
        A = 1'b0; B = 1'b0; Op = 3'b001; #10;
        $display("SUB | %b  %b  |   %b    |    %b", A, B, Result, CarryOut);
        A = 1'b0; B = 1'b1; Op = 3'b001; #10;
        $display("SUB | %b  %b  |   %b    |    %b", A, B, Result, CarryOut);
        A = 1'b1; B = 1'b0; Op = 3'b001; #10;
        $display("SUB | %b  %b  |   %b    |    %b", A, B, Result, CarryOut);
        A = 1'b1; B = 1'b1; Op = 3'b001; #10;
        $display("SUB | %b  %b  |   %b    |    %b", A, B, Result, CarryOut);

        // Test MULTIPLICATION (Op = 010)
        A = 1'b0; B = 1'b0; Op = 3'b010; #10;
        $display("MUL | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b0; B = 1'b1; Op = 3'b010; #10;
        $display("MUL | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b1; B = 1'b0; Op = 3'b010; #10;
        $display("MUL | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b1; B = 1'b1; Op = 3'b010; #10;
        $display("MUL | %b  %b  |   %b    |    -", A, B, Result);

        // Test AND (Op = 011)
        A = 1'b0; B = 1'b0; Op = 3'b011; #10;
        $display("AND | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b0; B = 1'b1; Op = 3'b011; #10;
        $display("AND | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b1; B = 1'b0; Op = 3'b011; #10;
        $display("AND | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b1; B = 1'b1; Op = 3'b011; #10;
        $display("AND | %b  %b  |   %b    |    -", A, B, Result);

        // Test OR (Op = 100)
        A = 1'b0; B = 1'b0; Op = 3'b100; #10;
        $display("OR  | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b0; B = 1'b1; Op = 3'b100; #10;
        $display("OR  | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b1; B = 1'b0; Op = 3'b100; #10;
        $display("OR  | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b1; B = 1'b1; Op = 3'b100; #10;
        $display("OR  | %b  %b  |   %b    |    -", A, B, Result);

        // Test XOR (Op = 101)
        A = 1'b0; B = 1'b0; Op = 3'b101; #10;
        $display("XOR | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b0; B = 1'b1; Op = 3'b101; #10;
        $display("XOR | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b1; B = 1'b0; Op = 3'b101; #10;
        $display("XOR | %b  %b  |   %b    |    -", A, B, Result);
        A = 1'b1; B = 1'b1; Op = 3'b101; #10;
        $display("XOR | %b  %b  |   %b    |    -", A, B, Result);

        // End the simulation
        $finish;
    end

endmodule
