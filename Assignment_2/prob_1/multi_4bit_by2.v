module multi_4bit_by2 (
    input [3:0] a,
    output [3:0] y
);
    assign y = a << 1;

endmodule