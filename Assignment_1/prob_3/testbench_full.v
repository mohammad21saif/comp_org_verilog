module test_full;

    reg A, B, Cin;
    wire sum, Cout, difference, borrow;

    full_adder FA(A, B, Cin, sum, Cout);
    half_subtractor HS(A, B, difference, borrow);

    initial begin
        A = 0; B = 0; Cin = 0;
        #10 A = 0; B = 1; Cin = 0;
        #10 A = 1; B = 0; Cin = 0;
        #10 A = 1; B = 1; Cin = 0;
        #10 A = 0; B = 0; Cin = 1;
        #10 A = 0; B = 1; Cin = 1;
        #10 A = 1; B = 0; Cin = 1;
        #10 A = 1; B = 1; Cin = 1;
        #10 $finish;
    end

    initial begin
        $monitor("A=%b, B=%b, Cin=%b, sum=%b, Cout=%b, difference=%b, borrow=%b", A, B, Cin, sum, Cout, difference, borrow);
    end


endmodule