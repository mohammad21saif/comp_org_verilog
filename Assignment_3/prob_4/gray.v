module gray_up_down_counter (
    input wire clk,          // Clock input
    input wire reset,        // Asynchronous reset
    input wire up,           // UP control signal
    output reg [2:0] gray_code // 3-bit Gray Code output
);

    // Internal variable to track binary counter value (0 to 7)
    reg [2:0] binary_counter;

    // Gray code generation function (convert binary to Gray code)
    function [2:0] binary_to_gray;
        input [2:0] binary_value;
        begin
            binary_to_gray = binary_value ^ (binary_value >> 1);
        end
    endfunction

    // Always block triggered by clock or reset
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Reset the binary counter and Gray code to 0
            binary_counter <= 3'b000;
            gray_code <= 3'b000;
        end else if (up) begin
            // Increment binary counter and convert to Gray code
            if (binary_counter == 3'b111) // If the counter reaches 7
                binary_counter <= 3'b000; // Wrap around to 0
            else
                binary_counter <= binary_counter + 1;
                
            // Convert binary counter to Gray code
            gray_code <= binary_to_gray(binary_counter);
        end
    end
endmodule
