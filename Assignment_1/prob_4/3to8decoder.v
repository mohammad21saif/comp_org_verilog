module decoder_3to8 (
    input A, B, C,
    output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
);

    wire An, Bn, Cn;

    // Invert the inputs
    not (An, A);
    not (Bn, B);
    not (Cn, C);

    // Instantiate AND gates with the correct signals
    three_input_and and0 (
        .A(An),
        .B(Bn),
        .C(Cn),
        .Y(Y0)
    );

    three_input_and and1 (
        .A(An),
        .B(Bn),
        .C(C),
        .Y(Y1)
    );

    three_input_and and2 (
        .A(An),
        .B(B),
        .C(Cn),
        .Y(Y2)
    );

    three_input_and and3 (
        .A(An),
        .B(B),
        .C(C),
        .Y(Y3)
    );

    three_input_and and4 (
        .A(A),
        .B(Bn),
        .C(Cn),
        .Y(Y4)
    );

    three_input_and and5 (
        .A(A),
        .B(Bn),
        .C(C),
        .Y(Y5)
    );

    three_input_and and6 (
        .A(A),
        .B(B),
        .C(Cn),
        .Y(Y6)
    );

    three_input_and and7 (
        .A(A),
        .B(B),
        .C(C),
        .Y(Y7)
    );

endmodule


module three_input_and (
    input A, B, C,
    output Y
);

    assign Y = A & B & C;

endmodule