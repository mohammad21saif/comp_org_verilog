module test_half;
    
        reg A, B;
        wire sum, carry, difference, borrow;
    
        half_adder HA(A, B, sum, carry);
        half_subtractor HS(A, B, difference, borrow);
    
        initial begin
            A = 0; B = 0;
            #10 A = 0; B = 1;
            #10 A = 1; B = 0;
            #10 A = 1; B = 1;
            #10 $finish;
        end
    
        initial begin
            $monitor("A=%b, B=%b, sum=%b, carry=%b, difference=%b, borrow=%b", A, B, sum, carry, difference, borrow);
        end


endmodule