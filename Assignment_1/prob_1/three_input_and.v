module three_input_and (
    input a,
    input b,
    input c,
    output y
);
    // Declare internal wire inside the module body
    wire n;

    two_input_and u1 (
        .a(a),
        .b(b),
        .y(n)
    );

    two_input_and u2 (
        .a(n),
        .b(c),
        .y(y)
    );

endmodule


module two_input_and (
    input a,
    input b,
    output y
);
    assign y = a & b;

endmodule