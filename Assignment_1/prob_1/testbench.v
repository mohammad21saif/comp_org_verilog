`timescale 1ns / 1ps

module test_three_input_and;
    // Declare testbench variables
    reg a, b, c;      // Inputs to the DUT (Device Under Test)
    wire y;           // Output from the DUT

    // Instantiate the DUT
    three_input_and dut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    // Generate stimulus
    initial begin
        // Display header
        $display("Time(ns) | a | b | c | y");
        $display("--------------------------");

        // Apply all possible combinations of inputs
        a = 0; b = 0; c = 0; #10;
        $display("%8d | %b | %b | %b | %b", $time, a, b, c, y);

        a = 0; b = 0; c = 1; #10;
        $display("%8d | %b | %b | %b | %b", $time, a, b, c, y);

        a = 0; b = 1; c = 0; #10;
        $display("%8d | %b | %b | %b | %b", $time, a, b, c, y);

        a = 0; b = 1; c = 1; #10;
        $display("%8d | %b | %b | %b | %b", $time, a, b, c, y);

        a = 1; b = 0; c = 0; #10;
        $display("%8d | %b | %b | %b | %b", $time, a, b, c, y);

        a = 1; b = 0; c = 1; #10;
        $display("%8d | %b | %b | %b | %b", $time, a, b, c, y);

        a = 1; b = 1; c = 0; #10;
        $display("%8d | %b | %b | %b | %b", $time, a, b, c, y);

        a = 1; b = 1; c = 1; #10;
        $display("%8d | %b | %b | %b | %b", $time, a, b, c, y);

        // End the simulation
        $finish;
    end
endmodule
