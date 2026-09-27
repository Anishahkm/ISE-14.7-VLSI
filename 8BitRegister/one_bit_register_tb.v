
`timescale 1ns / 1ps

module one_bit_register_tb;

reg clk;
reg d;
wire q;

one_bit_register uut (
    .clk(clk),
    .d(d),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Input stimulus
initial begin
    d = 0;

    #10;
    d = 1;

    #10;
    d = 0;

    #10;
    d = 1;

    #10;
    $finish;
end

endmodule