`timescale 1ns / 1ps

module test_4bit_comparator;

    reg [3:0] A;
    reg [3:0] B;
    wire eq;
    wire gt;
    wire lt;

    comparator_4bit dut (
        .A(A),
        .B(B),
        .eq(eq),
        .gt(gt),
        .lt(lt)
    );

    initial begin
        $display("4-bit Comparator Testbench");
        $display("Time | A | B | eq | gt | lt");
        $display("-----------------------------");

        A = 4'b0001; B = 4'b1000; #10;
        $display("%4d | %b | %b | %b | %b | %b", $time, A, B, eq, gt, lt);

        A = 4'b0001; B = 4'b0001; #10;
        $display("%4d | %b | %b | %b | %b | %b", $time, A, B, eq, gt, lt);
    end

endmodule


