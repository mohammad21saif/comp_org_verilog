module mux_8to1(
    input [7:0] in,     // 8-bit input for 8 data lines
    input [2:0] sel,    // 3-bit select input
    output reg out      // single output
);

always @(*) begin
    case (sel)
        3'b000: out = in[0];
        3'b001: out = in[1];
        3'b010: out = in[2];
        3'b011: out = in[3];
        3'b100: out = in[4];
        3'b101: out = in[5];
        3'b110: out = in[6];
        3'b111: out = in[7];
        default: out = 1'b0; // default case
    endcase
end

endmodule
