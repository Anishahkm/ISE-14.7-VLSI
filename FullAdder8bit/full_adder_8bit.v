`timescale 1ns / 1ps

module full_adder_8bit(
    input A0,
    input A1,
    input A2,
    input A3,
    input A4,
    input A5,
    input A6,
    input A7,

    input B0,
    input B1,
    input B2,
    input B3,
    input B4,
    input B5,
    input B6,
    input B7,

    input Cin,

    output Sum0,
    output Sum1,
    output Sum2,
    output Sum3,
    output Sum4,
    output Sum5,
    output Sum6,
    output Sum7,

    output Cout
);

    wire C1;
    wire C2;
    wire C3;
    wire C4;
    wire C5;
    wire C6;
    wire C7;

    // Bit 0
    full_adder FA0 (
        .A(A0),
        .B(B0),
        .Cin(Cin),
        .Sum(Sum0),
        .Cout(C1)
    );

    // Bit 1
    full_adder FA1 (
        .A(A1),
        .B(B1),
        .Cin(C1),
        .Sum(Sum1),
        .Cout(C2)
    );

    // Bit 2
    full_adder FA2 (
        .A(A2),
        .B(B2),
        .Cin(C2),
        .Sum(Sum2),
        .Cout(C3)
    );

    // Bit 3
    full_adder FA3 (
        .A(A3),
        .B(B3),
        .Cin(C3),
        .Sum(Sum3),
        .Cout(C4)
    );

    // Bit 4
    full_adder FA4 (
        .A(A4),
        .B(B4),
        .Cin(C4),
        .Sum(Sum4),
        .Cout(C5)
    );

    // Bit 5
    full_adder FA5 (
        .A(A5),
        .B(B5),
        .Cin(C5),
        .Sum(Sum5),
        .Cout(C6)
    );

    // Bit 6
    full_adder FA6 (
        .A(A6),
        .B(B6),
        .Cin(C6),
        .Sum(Sum6),
        .Cout(C7)
    );

    // Bit 7
    full_adder FA7 (
        .A(A7),
        .B(B7),
        .Cin(C7),
        .Sum(Sum7),
        .Cout(Cout)
    );

endmodule