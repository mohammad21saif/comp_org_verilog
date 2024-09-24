module comparator_4bit (
    input [3:0] A,
    input [3:0] B,
    output eq,
    output gt,
    output lt
);

    wire [3:0] eq_bits;
    wire [3:0] gt_bits;
    wire [3:0] lt_bits;

    comparator_1bit b3 (
        .A(A[3]),
        .B(B[3]),
        .eq(eq_bits[3]),
        .gt(gt_bits[3]),
        .lt(lt_bits[3])
    );

    comparator_1bit b2 (
        .A(A[2]),
        .B(B[2]),
        .eq(eq_bits[2]),
        .gt(gt_bits[2]),
        .lt(lt_bits[2])
    );

    comparator_1bit b1 (
        .A(A[1]),
        .B(B[1]),
        .eq(eq_bits[1]),
        .gt(gt_bits[1]),
        .lt(lt_bits[1])
    );

    comparator_1bit b0 (
        .A(A[0]),
        .B(B[0]),
        .eq(eq_bits[0]),
        .gt(gt_bits[0]),
        .lt(lt_bits[0])
    );

    // Final logic to determine if A == B, A > B, or A < B
    assign eq = eq_bits[3] & eq_bits[2] & eq_bits[1] & eq_bits[0];
    assign gt = gt_bits[3] | (eq_bits[3] & gt_bits[2]) | (eq_bits[3] & eq_bits[2] & gt_bits[1]) | (eq_bits[3] & eq_bits[2] & eq_bits[1] & gt_bits[0]);
    assign lt = lt_bits[3] | (eq_bits[3] & lt_bits[2]) | (eq_bits[3] & eq_bits[2] & lt_bits[1]) | (eq_bits[3] & eq_bits[2] & eq_bits[1] & lt_bits[0]);

endmodule