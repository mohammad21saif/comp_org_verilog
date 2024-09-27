module test_4to2;

    reg [3:0] a;      // 4-bit input
    wire [1:0] y;     // 2-bit output

    // Instantiate the encoder module
    encoder_4to2 encoder (
        .a(a),  // Connect input a
        .y(y)   // Connect output y
    );

    initial begin
        // Apply test inputs
        a = 4'b0001;
        #10;
        a = 4'b0010;
        #10;
        a = 4'b0100;
        #10;
        a = 4'b1000;
        #10;
    end

    // Monitor changes in inputs and outputs
    initial begin
        $monitor("Time = %0t: a = %b, y = %b", $time, a, y);
    end

endmodule
