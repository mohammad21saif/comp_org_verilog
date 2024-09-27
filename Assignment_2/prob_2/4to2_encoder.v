module encoder_4to2 (
    input [3:0] a,      // 4-bit input
    output reg [1:0] y  // 2-bit output declared as reg
);

    always @(*) begin
        case (a)  // Use 'a' which is the input signal
            4'b0001: y = 2'b00; // When a = 0001, y = 00
            4'b0010: y = 2'b01; // When a = 0010, y = 01
            4'b0100: y = 2'b10; // When a = 0100, y = 10
            4'b1000: y = 2'b11; // When a = 1000, y = 11
            default: y = 2'bxx; // Default case for invalid input
        endcase
    end

endmodule
