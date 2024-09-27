module test_pencoder;

    reg [7:0] in;   
    wire [2:0] out;
    wire valid;

    pencoder uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        in = 8'b10101011;
        #10;
        in = 8'b00010001;
        #10;
        in = 8'b11111111;
        #10;
    end

    initial begin
        $monitor("in=%b, out=%b, valid=%b", in, out, valid);
        $dumpfile("test_pencoder.vcd");
        $dumpvars(0);
    end

endmodule
