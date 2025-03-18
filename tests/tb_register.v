`timescale 1ns/1ps
`include "modules/register.v"

module tb_register;
    reg clk, reset;
    reg [15:0] d;
    wire [15:0] q;

    register uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("tb_register.vcd");
        $dumpvars(0, tb_register);
        $monitor("Tempo = %0t | d = %b | clk = %b | reset = %b | q = %b", 
                  $time, d, clk, reset, q);

        clk = 0; d = 16'b0000000000000000; reset = 1;
        #10 reset = 0;
        #10 d = 16'b1010101010101010;
        #10 d = 16'b1111000011110000;
        #10 d = 16'b0000111100001111;
        #20;
        $finish;
    end

endmodule
