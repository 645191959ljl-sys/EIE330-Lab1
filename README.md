# EIE330 Lab 1

Verilog source code and testbenches for the two Lab 1 tasks.

## Files

- `Lab1-1/RTL/full_adder.v`: one-bit full adder.
- `Lab1-1/sim/full_adder_tb.v`: testbench covering all eight input combinations.
- `Lab1-2/RTL/one_bit_comparator.v`: one-bit comparator.
- `Lab1-2/sim/one_bit_comparator_tb.v`: testbench covering all four input combinations.

The key inputs and LED outputs are active-low. A pressed button has port level 0; an illuminated LED has driving level 0.

## Run the full-adder simulation

From the repository root, in an environment with Icarus Verilog installed:

```bash
cd Lab1-1/sim
iverilog -o full_adder_tb.vvp -s full_adder_tb full_adder_tb.v ../RTL/full_adder.v
vvp full_adder_tb.vvp
```

This produces `full_adder_tb.vcd`.

## Run the comparator simulation

From the repository root:

```bash
cd Lab1-2/sim
iverilog -o one_bit_comparator_tb.vvp -s one_bit_comparator_tb one_bit_comparator_tb.v ../RTL/one_bit_comparator.v
vvp one_bit_comparator_tb.vvp
```

This produces `one_bit_comparator_tb.vcd`. Both VCD files can be opened with GTKWave.
