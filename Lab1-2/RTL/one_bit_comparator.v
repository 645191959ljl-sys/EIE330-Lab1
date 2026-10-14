`timescale 1ns / 1ns

module one_bit_comparator (
    input  wire key_A,
    input  wire key_B,
    output wire led_LT,
    output wire led_EQ,
    output wire led_GT
);

    // Active-low buttons
    wire A = ~key_A;
    wire B = ~key_B;

    // One-bit comparator
    wire LT, EQ, GT;
    assign LT = (A < B);
    assign EQ = (A == B);
    assign GT = (A > B);

    // Active-low LEDs
    assign led_LT = ~LT;
    assign led_EQ = ~EQ;
    assign led_GT = ~GT;

endmodule
