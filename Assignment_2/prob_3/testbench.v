module tb_mux_8to1;

    // Testbench variables
    reg [7:0] in;       // 8-bit input for the 8-to-1 multiplexer
    reg [2:0] sel;      // 3-bit selection line
    wire out;           // Output of the multiplexer

    // Instantiate the 8-to-1 multiplexer
    mux_8to1 uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    // Testbench initial block
    initial begin
        // Monitor changes
        $monitor("Time = %0t | in = %b | sel = %b | out = %b", $time, in, sel, out);
        
        // Test case 1: sel = 3'b000, in[0] should be selected
        in = 8'b11110000;
        sel = 3'b000;
        #10;
        
        // Test case 2: sel = 3'b001, in[1] should be selected
        sel = 3'b001;
        #10;
        
        // Test case 3: sel = 3'b010, in[2] should be selected
        sel = 3'b010;
        #10;
        
        // Test case 4: sel = 3'b011, in[3] should be selected
        sel = 3'b011;
        #10;
        
        // Test case 5: sel = 3'b100, in[4] should be selected
        sel = 3'b100;
        #10;
        
        // Test case 6: sel = 3'b101, in[5] should be selected
        sel = 3'b101;
        #10;
        
        // Test case 7: sel = 3'b110, in[6] should be selected
        sel = 3'b110;
        #10;
        
        // Test case 8: sel = 3'b111, in[7] should be selected
        sel = 3'b111;
        #10;
        
        // End the simulation
        $finish;
    end

    initial begin
        // Dump the waveforms
        $dumpfile("tb_mux_8to1.vcd");
        $dumpvars(0);
    end

endmodule
