# Low Power VLSI Design Using Clock Gating

## Project Overview

This project explores switching activity reduction using clock-enable logic in Verilog. It compares a conventional register with a register that updates its output only when an enable signal is active.

## Objectives

* Design a baseline register using Verilog HDL.
* Design a register with clock-enable functionality.
* Simulate both designs using Icarus Verilog.
* Observe signal waveforms using GTKWave.
* Compare output transitions under the same input sequence.
* Explore synthesis and power estimation using Vivado.

## Tools Used

* Verilog HDL
* Visual Studio Code
* Icarus Verilog
* GTKWave


## Project Files

* `baseline.v` — Conventional register design.
* `baseline_tb.v` — Testbench for the baseline design.
* `clock_gating.v` — Register with clock-enable functionality.
* `clock_gating_tb.v` — Testbench for the clock-enable design.
* `activity_tb.v` — Testbench comparing output transitions.

## Simulation

Compile and run the baseline design:

```bash
iverilog -o baseline_sim baseline.v baseline_tb.v
vvp baseline_sim
gtkwave baseline.vcd
```

Compile and run the clock-enable design:

```bash
iverilog -o clock_gating_sim clock_gating.v clock_gating_tb.v
vvp clock_gating_sim
gtkwave clock_gating.vcd
```

Compare output transitions:

```bash
iverilog -g2012 -o activity_sim baseline.v clock_gating.v activity_tb.v
vvp activity_sim
```

## Preliminary Observation

In the current simulation sequence, the baseline design reported 5 output-word transitions, while the clock-enable design reported 3.

This is a preliminary simulation result, not a measured power reduction. Actual power savings require appropriate synthesis and power analysis.

## Future Scope

* Perform synthesis using Vivado.
* Compare resource utilization and power estimates.
* Improve switching-activity measurement.
* Investigate implementation using a dedicated clock-gating cell for ASIC design.

## Author

Electronics and Communication Engineering Student
