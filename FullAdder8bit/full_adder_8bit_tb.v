`timescale 1ns / 1ps

module full_adder_8bit_tb;

    reg A0;
    reg A1;
    reg A2;
    reg A3;
    reg A4;
    reg A5;
    reg A6;
    reg A7;

    reg B0;
    reg B1;
    reg B2;
    reg B3;
    reg B4;
    reg B5;
    reg B6;
    reg B7;

    reg Cin;

    wire Sum0;
    wire Sum1;
    wire Sum2;
    wire Sum3;
    wire Sum4;
    wire Sum5;
    wire Sum6;
    wire Sum7;

    wire Cout;

    full_adder_8bit uut (
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),
        .A4(A4),
        .A5(A5),
        .A6(A6),
        .A7(A7),

        .B0(B0),
        .B1(B1),
        .B2(B2),
        .B3(B3),
        .B4(B4),
        .B5(B5),
        .B6(B6),
        .B7(B7),

        .Cin(Cin),

        .Sum0(Sum0),
        .Sum1(Sum1),
        .Sum2(Sum2),
        .Sum3(Sum3),
        .Sum4(Sum4),
        .Sum5(Sum5),
        .Sum6(Sum6),
        .Sum7(Sum7),

        .Cout(Cout)
    );

    initial begin

        // 00000000 + 00000000 + 0 = 00000000
        A7 = 0; A6 = 0; A5 = 0; A4 = 0;
        A3 = 0; A2 = 0; A1 = 0; A0 = 0;

        B7 = 0; B6 = 0; B5 = 0; B4 = 0;
        B3 = 0; B2 = 0; B1 = 0; B0 = 0;

        Cin = 0;

        #10;

        // 00000101 + 00000011 + 0 = 00001000
        A7 = 0; A6 = 0; A5 = 0; A4 = 0;
        A3 = 0; A2 = 1; A1 = 0; A0 = 1;

        B7 = 0; B6 = 0; B5 = 0; B4 = 0;
        B3 = 0; B2 = 0; B1 = 1; B0 = 1;

        Cin = 0;

        #10;

        // 00001111 + 00000001 + 0 = 00010000
        A7 = 0; A6 = 0; A5 = 0; A4 = 0;
        A3 = 1; A2 = 1; A1 = 1; A0 = 1;

        B7 = 0; B6 = 0; B5 = 0; B4 = 0;
        B3 = 0; B2 = 0; B1 = 0; B0 = 1;

        Cin = 0;

        #10;

        // 11111111 + 00000001 + 0 = 00000000, Cout = 1
        A7 = 1; A6 = 1; A5 = 1; A4 = 1;
        A3 = 1; A2 = 1; A1 = 1; A0 = 1;

        B7 = 0; B6 = 0; B5 = 0; B4 = 0;
        B3 = 0; B2 = 0; B1 = 0; B0 = 1;

        Cin = 0;

        #10;

        // 10101010 + 01010101 + 1 = 1 00000000
        A7 = 1; A6 = 0; A5 = 1; A4 = 0;
        A3 = 1; A2 = 0; A1 = 1; A0 = 0;

        B7 = 0; B6 = 1; B5 = 0; B4 = 1;
        B3 = 0; B2 = 1; B1 = 0; B0 = 1;

        Cin = 1;

        #10;

        $finish;

    end

endmodule