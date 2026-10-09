# EIE330 Lab 1

Task 1-1: full adder (full_adder.v, full_adder_tb.v). Task 1-2: one-bit comparator (comparator.v, comparator_tb.v).
All *_n board ports are active-low. Pressed=logical 1 and LED on=logical 1.

## Run
```sh
iverilog -Wall -s full_adder_tb -o full_adder_tb.vvp full_adder.v full_adder_tb.v
vvp full_adder_tb.vvp
iverilog -Wall -s comparator_tb -o comparator_tb.vvp comparator.v comparator_tb.v
vvp comparator_tb.vvp
```
All 8 full-adder cases and 4 comparator cases passed actual Icarus Verilog 11.0 simulation. Each testbench checks explicit expected values and fails on mismatch.

Lab1_Source.zip preserves RTL/, sim/, scripts, design metadata and local simulator source changes. Installed official simulator was modified to prevent event loss, add independent S/D/F/G key inputs, reduce busy spinning for these unclocked LED tasks, and reacquire resized window surfaces. No automatic truth-table playback; experimental RTL unchanged.

## AI assistance
AI assisted requirements analysis, RTL/testbench, scripts, verification and report preparation. The student provided course requirements and manually operated and recorded virtual-board tests. Student review and compliance with course AI policy are required. Generic synthesis and virtual-board tests do not establish physical FPGA timing.
