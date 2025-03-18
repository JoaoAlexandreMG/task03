`timescale 1ns/1ps
`include "modules/bit.v"  

module tb_bit;
    reg d, clk, reset;
    wire q;

    bit uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_bit.vcd");  
        $dumpvars(0, tb_bit);
        $monitor("Tempo = %0t | d = %b | clk = %b | reset = %b | q = %b", $time, d, clk, reset, q);

        clk = 0; d = 0; reset = 1;
        #10 reset = 0;  
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #20;
        $finish;
    end

endmodule
