module test_decoder;

    reg [1:0] a;      // 2-bit input
    wire [3:0] y;     // 4-bit output

    // Instantiate the decoder module
    decoder_2to4 decoder (
        .a(a),  // Connect input a
        .y(y)   // Connect output y
    );

    initial begin
        // Apply test inputs
        a = 2'b00;
        #10;
        a = 2'b01;
        #10;
        a = 2'b10;
        #10;
        a = 2'b11;
        #10;
    end

    // Monitor changes in inputs and outputs
    initial begin
        $monitor("Time = %0t: a = %b, y = %b", $time, a, y);
    end

endmodule