module half_subtractor (
    input A,
    input B,
    output difference,
    output borrow
);  
    assign difference = A ^ B;
    assign borrow = ~A & B;

endmodule