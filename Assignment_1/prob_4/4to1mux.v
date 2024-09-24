module mux_4to1 (
    input I0, I1, I2, I3,
    input S0, S1,
    output Y
);

    wire Y0, Y1, Y2, Y3;

    three_input_and and0 (
        .A(I0),
        .B(~S0),
        .C(~S1),
        .Y(Y0)
    );

    three_input_and and1 (
        .A(I1),
        .B(S0),
        .C(~S1),
        .Y(Y1)
    );

    three_input_and and2 (
        .A(I2),
        .B(~S0),
        .C(S1),
        .Y(Y2)
    );

    three_input_and and3 (
        .A(I3),
        .B(S0),
        .C(S1),
        .Y(Y3)
    );

    assign Y = Y0 | Y1 | Y2 | Y3;

endmodule


module three_input_and (
    input A, B, C,
    output Y
);

    assign Y = A & B & C;

endmodule