module down_counter (
    input wire clk,      
    input wire reset,    
    output reg [2:0] count 
);

    // Always block triggered by the positive edge of the clock or reset
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 3'b111; // Reset the count to 7 (binary 111)
        end
        else begin
            if (count == 3'b000) // If the count reaches 0
                count <= 3'b111; // Reset back to 7
            else
                count <= count - 1'b1; // Decrement the count
        end
    end
endmodule
