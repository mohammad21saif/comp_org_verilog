module test_sr;

    // Declare inputs as reg in the testbench because they will be driven inside initial block
    reg S, R, EN, RESET;   // These are inputs that will be changed during the test
    wire Q, Q_;            // Declare Q and Q_ as wire (outputs from SR_Latch)

    // Instantiate the SR_Latch module
    SR_latch sr (
        .S(S),
        .R(R),
        .EN(EN),
        .RESET(RESET),
        .Q(Q),
        .Q_(Q_)
    );

    initial begin
        // Initialize inputs
        S = 0;
        R = 0;
        EN = 0;
        RESET = 1; // Start with reset active

        #10 RESET = 0;   // Deactivate reset after 10 time units
            EN = 1;      // Enable the latch

        // Test case 1: Set S and R to 1
        #10 S = 1; R = 1;   // Invalid state (Q and Q_ should be x)

        // Test case 2: Set S = 0, R = 0 (latch holds state)
        #10 S = 0; R = 0;

        // Test case 3: Set S = 1, R = 0 (Set the latch)
        #10 S = 1; R = 0;

        // Test case 4: Set S = 0, R = 1 (Reset the latch)
        #10 S = 0; R = 1;

        // Test case 5: Disable EN to stop updates
        #10 EN = 0; S = 1; R = 0; // No change should occur because EN = 0

        // Test case 6: Re-enable EN to allow updates
        #10 EN = 1; S = 0; R = 1; // Q should reset because EN = 1
    end

    initial begin
        // Monitor the values of S, R, EN, RESET, Q, and Q_
        $monitor("Time=%0t, S=%b, R=%b, EN=%b, RESET=%b, Q=%b, Q_=%b", 
                 $time, S, R, EN, RESET, Q, Q_);
    end

    initial begin
        // For waveform generation
        $dumpfile("test_sr.vcd");
        $dumpvars(0, test_sr);
        #100 $finish;  // End simulation after 100 time units
    end

endmodule
