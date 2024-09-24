module testbench_decoder;

    reg A, B, C;
    wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

    decoder_3to8 test (
        .A(A),
        .B(B),
        .C(C),
        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3),
        .Y4(Y4),
        .Y5(Y5),
        .Y6(Y6),
        .Y7(Y7)
    );

    initial begin
        A = 0; B = 0; C = 0;
        #10;
        A = 0; B = 0; C = 1;
        #10;
        A = 0; B = 1; C = 0;
        #10;
        A = 0; B = 1; C = 1;
        #10;
        
        $finish;
    end

    initial begin
        $monitor("At time %0t: A=%b, B=%b, C=%b => Y0=%b, Y1=%b, Y2=%b, Y3=%b, Y4=%b, Y5=%b, Y6=%b, Y7=%b", 
                  $time, A, B, C, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);
    end

endmodule