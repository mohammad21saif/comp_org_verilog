module decoder_2to4 (
    input [1:0] a,      // 2-bit input
    output reg [3:0] y  // 4-bit output declared as reg
);

    always @(*) begin
        case (a)  // Use 'a' as the input signal
            2'b00: y = 4'b0001; // When a = 00, y = 0001
            2'b01: y = 4'b0010; // When a = 01, y = 0010
            2'b10: y = 4'b0100; // When a = 10, y = 0100
            2'b11: y = 4'b1000; // When a = 11, y = 1000
            default: y = 4'bxxxx; // Default case for invalid input
        endcase
    end

endmodule
