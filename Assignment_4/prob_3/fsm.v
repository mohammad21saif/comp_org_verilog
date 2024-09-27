module sequence_detector (
    input wire clk,      // Clock signal
    input wire reset,    // Reset signal (active high)
    input wire x,        // Input variable
    output reg Z         // Output variable
);

    // State encoding using local parameters
    localparam [2:0]
        S0 = 3'b000,     // Initial state
        S1 = 3'b001,     // Detected '1'
        S2 = 3'b010,     // Detected '11'
        S3 = 3'b011,     // Detected '110'
        S4 = 3'b100;     // Detected '1101' (sequence complete)

    reg [2:0] current_state, next_state;

    // Sequential logic for state transitions
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;   // Reset to initial state
        else
            current_state <= next_state;
    end

    // Combinational logic for next state and output
    always @(*) begin
        // Default assignments
        next_state = current_state;
        Z = 1'b0;  // Default output

        case (current_state)
            S0: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (x)
                    next_state = S2;
                else
                    next_state = S0;
            end

            S2: begin
                if (x)
                    next_state = S2;  // Stay in S2 if input is '1'
                else
                    next_state = S3;
            end

            S3: begin
                if (x)
                    next_state = S4;
                else
                    next_state = S0;
            end

            S4: begin
                Z = 1'b1;  // Output '1' when sequence '1101' is detected
                if (x)
                    next_state = S2;  // Overlapping sequence
                else
                    next_state = S0;
            end

            default: begin
                next_state = S0;
            end
        endcase
    end

endmodule

module tb_sequence_detector;
    reg clk;
    reg reset;
    reg x;
    wire Z;

    // Instantiate the sequence detector
    sequence_detector uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .Z(Z)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Apply test sequences
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        x = 0;

        // Apply reset
        #10 reset = 0;

        // First test sequence: 1 1 0 1 (should detect and set Z high)
        #10 x = 1;  // Time 10ns
        #10 x = 1;  // Time 20ns
        #10 x = 0;  // Time 30ns
        #10 x = 1;  // Time 40ns, Z should be set to 1 here

        // Test overlapping sequences: immediately start new detection
        #10 x = 1;  // Time 50ns
        #10 x = 1;  // Time 60ns
        #10 x = 0;  // Time 70ns
        #10 x = 1;  // Time 80ns, Z should be set to 1 again

        // Test with non-matching bits
        #10 x = 0;  // Time 90ns
        #10 x = 1;  // Time 100ns
        #10 x = 0;  // Time 110ns
        #10 x = 0;  // Time 120ns
        #10 x = 1;  // Time 130ns, Z should remain 0

        // Finish simulation
        #50 $stop;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | x=%b | Z=%b | State=%b", $time, x, Z, uut.current_state);
    end

    // Generate waveform file (optional)
    initial begin
        $dumpfile("sequence_detector.vcd");
        $dumpvars(0, tb_sequence_detector);
    end

endmodule
