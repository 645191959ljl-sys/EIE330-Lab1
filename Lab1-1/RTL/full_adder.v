`timescale 1ns / 1ns

module full_adder (
    input  wire key_A,
    input  wire key_B,
    input  wire key_Cin,
    output wire led_S,
    output wire led_Cout
);
// Active-low buttons
    wire A   = ~key_A;
    wire B   = ~key_B;
    wire Cin = ~key_Cin;

// Full adder
    wire S, Cout;
    assign {Cout, S} = A + B + Cin;

//Active-low leds
    assign led_S    = ~S;
    assign led_Cout = ~Cout;

endmodule