`timescale 1ns / 1ps

module full_adder_tb;

    reg A;
    reg B;
    reg Cin;

    wire Sum;
    wire Cout;

    full_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        // 000
        A = 0;
        B = 0;
        Cin = 0;
        #10;

        // 001
        A = 0;
        B = 0;
        Cin = 1;
        #10;

        // 010
        A = 0;
        B = 1;
        Cin = 0;
        #10;

        // 011
        A = 0;
        B = 1;
        Cin = 1;
        #10;

        // 100
        A = 1;
        B = 0;
        Cin = 0;
        #10;

        // 101
        A = 1;
        B = 0;
        Cin = 1;
        #10;

        // 110
        A = 1;
        B = 1;
        Cin = 0;
        #10;

        // 111
        A = 1;
        B = 1;
        Cin = 1;
        #10;

        $finish;

    end

endmodule