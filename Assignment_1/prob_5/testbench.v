module test_barrel_shifter;

    reg [3:0] in;
    reg [1:0] shift;
    wire [3:0] out;

    barrel_shifter_4bit uut (
        .in(in),
        .shift(shift),
        .out(out)
    );

    initial begin
        in = 4'b0011; shift = 2'b00;
        #10;
        in = 4'b1001; shift = 2'b01;
        #10;
        in = 4'b0101; shift = 2'b10;
        #10;
        in = 4'b1101; shift = 2'b11;
        #10;
        
        $finish;
    end

    initial begin
        $monitor("At time %0t: shift=%b, in=%b => out=%b", 
                  $time, shift, in, out);
    end

endmodule