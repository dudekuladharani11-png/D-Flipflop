`timescale 1ns/1ps

module d_flipflop_tb;

```
reg D;
reg CLK;

wire Q;

// Instantiate D Flip-Flop
d_flipflop uut (
    .D(D),
    .CLK(CLK),
    .Q(Q)
);

// Generate clock
always #5 CLK = ~CLK;

initial begin

    // Generate waveform
    $dumpfile("simulation/waveform.vcd");
    $dumpvars(0, d_flipflop_tb);

    // Initialize signals
    CLK = 0;
    D = 0;

    // Test different D values
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;

    #10 $finish;

end

// Display values
initial begin
    $monitor("Time=%0t | CLK=%b | D=%b | Q=%b",
             $time, CLK, D, Q);
end
```

endmodule
