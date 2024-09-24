module testbench;

    reg I0, I1, I2, I3;
    reg S0, S1;
    wire Y;

    mux_4to1 uut (
        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),
        .S0(S0),
        .S1(S1),
        .Y(Y)
    );

    initial begin
        I0 = 1; I1 = 0; I2 = 0; I3 = 0; S0 = 0; S1 = 0;
        #10;
        I0 = 0; I1 = 1; I2 = 0; I3 = 0; S0 = 1; S1 = 0;
        #10;
        I0 = 0; I1 = 0; I2 = 1; I3 = 0; S0 = 0; S1 = 1;
        #10;
        I0 = 0; I1 = 0; I2 = 0; I3 = 1; S0 = 1; S1 = 1;
        #10;
        
        $finish;
    end

    initial begin
        $monitor("At time %0t: S1=%b, S0=%b, I0=%b, I1=%b, I2=%b, I3=%b => Y=%b", 
                  $time, S1, S0, I0, I1, I2, I3, Y);
    end

endmodule
