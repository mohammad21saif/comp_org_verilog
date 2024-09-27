module moore_machine (
    input wire clk,       // Clock signal
    input wire reset,     // Reset signal (active high)
    input wire in,        // Single-bit input
    output reg out        // Single-bit output
);

    // State encoding using local parameters
    localparam [2:0]
        S0 = 3'b000,  // Initial state
        S1 = 3'b001,  // Detected '1'
        S2 = 3'b010,  // Detected '10'
        S3 = 3'b011,  // Detected '101'
        S4 = 3'b100;  // Detected '1011'

    reg [2:0] current_state, next_state;

    // Sequential logic for state transitions
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;  // Reset to initial state
        else
            current_state <= next_state;
    end

    // Combinational logic for next state and output
    always @(*) begin
        // Default assignments
        next_state = current_state;
        out = 1'b0;

        case (current_state)
            S0: begin
                if (in)
                    next_state = S1;
            end

            S1: begin
                if (~in)
                    next_state = S2;
                else
                    next_state = S1;  // Stay in S1 if input remains '1'
            end

            S2: begin
                if (in)
                    next_state = S3;
                else
                    next_state = S0;  // Reset if sequence breaks
            end

            S3: begin
                if (in)
                    next_state = S4;
                else
                    next_state = S2;  // Allow overlap in sequence detection
            end

            S4: begin
                out = 1'b1;  // Sequence '1011' detected
                if (~in)
                    next_state = S0;
                else
                    next_state = S1;  // Prepare for potential overlapping sequences
            end

            default: begin
                next_state = S0;
            end
        endcase
    end

endmodule

module tb_moore_machine;
    reg clk;
    reg reset;
    reg in;
    wire out;

    // Instantiate the Moore machine
    moore_machine uut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    // Apply test sequences
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        in = 0;

        // Apply reset
        #10 reset = 0;

        // Test sequence: 1 0 1 1 (should detect and set output high)
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;

        // Hold input and observe output
        #10 in = 0;
        #10 in = 1;

        // Test overlapping sequences
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;

        // Finish simulation
        #20 $stop;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | in=%b | out=%b | state=%b",
                 $time, clk, reset, in, out, uut.current_state);
    end

    initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_moore_machine);
    // Rest of your initial block...
end

endmodule
