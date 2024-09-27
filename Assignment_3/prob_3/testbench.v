module tb_down_counter;

    reg clk;
    reg reset;
    wire [2:0] count;

    // Instantiate the down_counter module
    down_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation (50% duty cycle)
    always begin
        #5 clk = ~clk; // Toggle clock every 5 time units
    end

    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;

        // Apply reset for a short period
        #10 reset = 1;   // Assert reset
        #10 reset = 0;   // Deassert reset

        // Let the counter run for 100 time units
        #100;

        // End simulation
        $finish;
    end

    // Monitor the output
    initial begin
        $monitor("Time = %0t | Reset = %b | Count = %b", $time, reset, count);
    end

    // Dump the waveforms for debugging
    initial begin
        $dumpfile("tb_down_counter.vcd");
        $dumpvars(0, tb_down_counter);
    end

endmodule
