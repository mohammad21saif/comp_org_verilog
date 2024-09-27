module SR_latch (
    input wire S,          // Set input
    input wire R,          // Reset input
    input wire EN,         // Enable input (asynchronous)
    input wire RESET,      // Asynchronous reset
    output reg Q,          // Q output
    output reg Q_          // Q' (complement of Q) output
);

    always @(posedge EN or posedge RESET) begin
        if (RESET) begin
            Q <= 1'b0;
            Q_ <= 1'b1; 
        end else begin
            if (S == 1'b1 && R == 1'b0) begin
                Q <= 1'b1;
                Q_ <= 1'b0;
            end else if (S == 1'b0 && R == 1'b1) begin
                Q <= 1'b0;
                Q_ <= 1'b1;
            end else if (S == 1'b0 && R == 1'b0) begin
                // Maintain the current state
                Q <= Q;
                Q_ <= Q_;
            end else begin
                // Invalid condition (both S and R are 1)
                Q <= 1'bx;
                Q_ <= 1'bx;
            end
        end
    end

endmodule
