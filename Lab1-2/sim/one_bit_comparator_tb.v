`timescale 1ns / 1ns

module one_bit_comparator_tb;

    reg key_A, key_B;
    wire led_LT, led_EQ, led_GT;

    one_bit_comparator dut (
        .key_A(key_A),
        .key_B(key_B),
        .led_LT(led_LT),
        .led_EQ(led_EQ),
        .led_GT(led_GT)
    );

    initial begin
        $dumpfile("one_bit_comparator_tb.vcd");
        $dumpvars(0, one_bit_comparator_tb);
        $monitor("time=%0t keys=%b%b LEDs(LT EQ GT)=%b%b%b",
                 $time, key_A, key_B, led_LT, led_EQ, led_GT);

        {key_A, key_B} = 2'b11;     // A B = 00; LEDs = 101
        #20 {key_A, key_B} = 2'b10; // A B = 01; LEDs = 011
        #20 {key_A, key_B} = 2'b01; // A B = 10; LEDs = 110
        #20 {key_A, key_B} = 2'b00; // A B = 11; LEDs = 101
        #20 $finish;
    end

endmodule
