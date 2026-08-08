module d_flipflop (
input D,
input CLK,
output reg Q
);

```
// Positive-edge-triggered D Flip-Flop
always @(posedge CLK) begin
    Q <= D;
end
```

endmodule
