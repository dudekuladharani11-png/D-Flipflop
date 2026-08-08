# D Flip-Flop Using Verilog HDL

## 📌 Project Description

A **D Flip-Flop (Data Flip-Flop)** is a sequential logic circuit used to store one bit of binary data.

This project implements a **positive-edge-triggered D Flip-Flop** using Verilog HDL. The output `Q` captures the value of the input `D` at the rising edge of the clock and holds that value until the next rising edge.

## 🔌 Inputs and Outputs

### Input

* `D` – Data input
* `CLK` – Clock signal

### Output

* `Q` – Stored data output

## ⚙️ Working Principle

The D Flip-Flop operates on the rising edge of the clock.

```text
At every rising edge of CLK:

Q = D
```

If `D = 1` at the rising edge, `Q` becomes `1`.

If `D = 0` at the rising edge, `Q` becomes `0`.

Between clock edges, the output remains unchanged.

## 📊 Truth Table

|      Clock     |  D  |   Q(next)  |
| :------------: | :-: | :--------: |
|        ↑       |  0  |      0     |
|        ↑       |  1  |      1     |
| No rising edge |  X  | Previous Q |

`↑` represents the rising edge of the clock.

## 💻 Verilog Design

The D Flip-Flop is implemented using an `always` block with a positive-edge clock trigger.

```verilog
module d_flipflop (
    input  D,
    input  CLK,
    output reg Q
);

    always @(posedge CLK) begin
        Q <= D;
    end

endmodule
```

## 🧪 Testbench

The testbench generates a clock signal and applies different values to the `D` input. A VCD waveform file is generated for viewing the simulation in GTKWave.

```verilog
`timescale 1ns/1ps

module d_flipflop_tb;

    reg D;
    reg CLK;

    wire Q;

    // Instantiate D Flip-Flop
    d_flipflop uut (
        .D(D),
        .CLK(CLK),
        .Q(Q)
    );

    // Clock generation
    always #5 CLK = ~CLK;

    initial begin

        // Generate waveform
        $dumpfile("simulation/waveform.vcd");
        $dumpvars(0, d_flipflop_tb);

        // Initial values
        CLK = 0;
        D = 0;

        // Apply test values
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;
        #10 D = 1;
        #10 D = 0;
        #10 D = 1;

        #10 $finish;

    end

    // Display simulation values
    initial begin
        $monitor("Time=%0t | CLK=%b | D=%b | Q=%b",
                 $time, CLK, D, Q);
    end

endmodule
```

## ▶️ Simulation

This project can be simulated using **Icarus Verilog** and **GTKWave**.

### Compile

Run:

```bash
iverilog -o d_flipflop_sim src/d_flipflop.v testbench/d_flipflop_tb.v
```

### Run

```bash
vvp d_flipflop_sim
```

The simulation generates:

```text
simulation/waveform.vcd
```

### View Waveform

Open the waveform using:

```bash
gtkwave simulation/waveform.vcd
```

Add these signals to the waveform viewer:

```text
CLK
D
Q
```

## 📈 Expected Behavior

During simulation:

```text
D = 0 → At rising CLK → Q = 0

D = 1 → At rising CLK → Q = 1

D = 0 → At rising CLK → Q = 0
```

The output `Q` changes only at the **rising edge of CLK**.

## 🛠️ Tools Used

* Verilog HDL
* Icarus Verilog
* GTKWave
* Git
* GitHub

## 🎯 Applications

D Flip-Flops are commonly used in:

* Registers
* Counters
* Shift registers
* Data storage
* Memory circuits
* Sequential logic
* Digital systems

## ✅ Conclusion

The **positive-edge-triggered D Flip-Flop** was successfully designed using Verilog HDL. The testbench verifies its operation by applying different data values at different clock cycles. The simulation waveform demonstrates that the output `Q` captures the input `D` on every rising edge of the clock.

## 👨‍💻 Author

**Your Name**

GitHub: **Your GitHub Username**
