# 4-Bit Adder/Subtractor in Verilog

This project implements a 4-bit **Adder/Subtractor** in Verilog using 2's complement logic. The module supports both signed addition and subtraction, and includes a testbench that verifies multiple test cases including overflow and negative results.

# Features

- 4-bit inputs (`A` and `B`)
- Control signal `Sub`:
  - `Sub = 0`: Performs `A + B + Cin`
  - `Sub = 1`: Performs `A - B - Cin` using 2's complement
- Handles signed arithmetic
- Displays carry-out (`Cout`) which doubles as "no-borrow" indicator in subtraction
- Testbench includes cases with:
  - Positive and negative operands
  - Signed and unsigned interpretation
  - Overflow and borrow

# How to Run (Vivado or ModelSim)

1. Open the project in your simulator
2. Add both `fourbitaddsub.v` and `addsub_tb.v` to the simulation sources
3. Run behavioral simulation
4. Observe waveforms or console output

---

# How It Works

Subtraction is performed using 2's complement:

A - B = A + (~B + 1)

vbnet
Copy
Edit

This is implemented by:
- XORing B with `Sub` to invert bits when subtracting
- XORing `Cin` with `Sub` to properly form the `+1` in 2's complement subtraction
---

# Author

Abhishek Patel  
Final-year Electronics and Computer Science Undergraduate  
Skilled in FPGA prototyping, RTL design, and SystemVerilog-based verification.
