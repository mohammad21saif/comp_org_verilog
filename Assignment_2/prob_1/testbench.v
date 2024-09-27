`timescale 1ns/1ps

module test_multi;
    reg [3:0] a;
    wire [3:0] y;


    multi_4bit_by2 uut (
        .a(a),
        .y(y)
    );

    initial begin
        a = 4'b1001;

        #10;

        a = 4'b0101;

    end

    initial begin
        $monitor("At time %0t: a=%b * 2 = %b", $time, a, y);
    end

endmodule