`timescale 1ns / 1ns

module full_adder_tb;

    reg key_A, key_B, key_Cin;
    wire led_S, led_Cout;

    full_adder dut (
        .key_A(key_A),
        .key_B(key_B),
        .key_Cin(key_Cin),
        .led_S(led_S),
        .led_Cout(led_Cout)
    );

    initial begin
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);

        $monitor("time=%0t keys=%b%b%b LEDs=%b%b",
                 $time, key_A, key_B, key_Cin,
                 led_S, led_Cout);

        // Logical inputs: A B Cin; expected LEDs: led_S led_Cout
        {key_A, key_B, key_Cin} = 3'b111;     // 000 -> 11
        #20 {key_A, key_B, key_Cin} = 3'b110; // 001 -> 01
        #20 {key_A, key_B, key_Cin} = 3'b101; // 010 -> 01
        #20 {key_A, key_B, key_Cin} = 3'b100; // 011 -> 10
        #20 {key_A, key_B, key_Cin} = 3'b011; // 100 -> 01
        #20 {key_A, key_B, key_Cin} = 3'b010; // 101 -> 10
        #20 {key_A, key_B, key_Cin} = 3'b001; // 110 -> 10
        #20 {key_A, key_B, key_Cin} = 3'b000; // 111 -> 00

        #20 $finish;
    end

endmodule