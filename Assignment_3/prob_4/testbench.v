module tb_gray_up_down_counter;

    reg clk;               // Clock signal
    reg reset;             // Asynchronous reset signal
    reg up;                // UP control signal (when 1, the counter advances)
    wire [2:0] gray_code;  // 3-bit Gray code output

    // Instantiate the gray_up_down_counter module
    gray_up_down_counter uut (
        .clk(clk),
        .reset(reset),
        .up(up),
        .gray_code(gray_code)
    );

    // Clock generation: Toggle clock every 5 time units to simulate a clock signal
    always begin
        #5 clk = ~clk;   // 50% duty cycle clock
    end

    initial begin
        // Initialize the signals
        clk = 0;
        reset = 0;
        up = 0;

        // Apply a reset for 10 time units
        #10 reset = 1;   // Assert reset
        #10 reset = 0;   // Deassert reset

        // Test Case 1: UP = 1 (counting mode)
        up = 1;
        #80;  // Let the counter run for 8 clock cycles

        // Test Case 2: UP = 0 (hold the current value)
        up = 0;
        #30;  // Hold the counter value for 3 clock cycles

        // Test Case 3: UP = 1 (resume counting mode)
        up = 1;
        #50;  // Let the counter run for 5 clock cycles

        // End the simulation after all test cases
        $finish;
    end

    // Monitor the signals and output
    initial begin
        $monitor("Time = %0t | Reset = %b | UP = %b | Gray Code = %b", $time, reset, up, gray_code);
    end

    // Dump waveform for debugging (view in waveform viewer)
    initial begin
        $dumpfile("tb_gray_up_down_counter.vcd");  // Specify VCD file name
        $dumpvars(0, tb_gray_up_down_counter);     // Dump all variables for this module
    end

endmodule
