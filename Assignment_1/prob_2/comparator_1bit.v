module comparator_1bit (
    input A,
    input B,
    output eq,
    output gt,
    output lt
);
    
    assign eq = (A==B);
    assign gt = (A>B);
    assign lt = (A<B);

endmodule