module full_subtractor (
    input A,
    input B,
    input Bin,   // Borrow input
    output difference,
    output Bout  // Borrow output
);

    wire diff_half, borrow_half1, borrow_half2;
    
    half_subtractor HS1(A, B, diff_half, borrow_half1);
    half_subtractor HS2(diff_half, Bin, difference, borrow_half2);
    assign Bout = borrow_half1 | borrow_half2;

endmodule