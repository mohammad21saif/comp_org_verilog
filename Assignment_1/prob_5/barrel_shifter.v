module barrel_shifter_4bit (
    input [3:0] in,   
    input [1:0] shift, 
    output [3:0] out  
);

    wire [3:0] stage1, stage2;

    // Stage 1: 1-bit shift
    // If shift[0] = 0, no shift; if shift[0] = 1, perform a 1-bit shift
    mux_2to1 mux1_0 (.in0(in[0]), .in1(in[1]), .sel(shift[0]), .out(stage1[0])); // Right shift by 1-bit
    mux_2to1 mux1_1 (.in0(in[1]), .in1(in[2]), .sel(shift[0]), .out(stage1[1]));
    mux_2to1 mux1_2 (.in0(in[2]), .in1(in[3]), .sel(shift[0]), .out(stage1[2]));
    mux_2to1 mux1_3 (.in0(in[3]), .in1(1'b0), .sel(shift[0]), .out(stage1[3]));  // Left shift by 1-bit (fill with 0)

    // Stage 2: 2-bit shift
    // If shift[1] = 0, no shift; if shift[1] = 1, perform a 2-bit shift
    mux_2to1 mux2_0 (.in0(stage1[0]), .in1(stage1[2]), .sel(shift[1]), .out(stage2[0])); // Right shift by 2-bits
    mux_2to1 mux2_1 (.in0(stage1[1]), .in1(stage1[3]), .sel(shift[1]), .out(stage2[1]));
    mux_2to1 mux2_2 (.in0(stage1[2]), .in1(1'b0), .sel(shift[1]), .out(stage2[2]));     // Left shift by 2-bits
    mux_2to1 mux2_3 (.in0(stage1[3]), .in1(1'b0), .sel(shift[1]), .out(stage2[3]));

    assign out = stage2;

endmodule


module mux_2to1 (
    input in0,   
    input in1,   
    input sel,   
    output out   
);

    assign out = sel ? in1 : in0;

endmodule
