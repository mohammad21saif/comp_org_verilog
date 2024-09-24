module full_adder (
    input A,
    input B,
    input Cin,
    output sum,
    output Cout
);
    wire sum1, carry1, sum2, carry2;
    half_adder HA1(A, B, sum1, carry1);
    half_adder HA2(sum1, Cin, sum2, carry2);
    assign sum = sum2;
    assign Cout = carry1 | carry2;

endmodule