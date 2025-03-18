`include "modules/ram512.v"
module tb_ram512;

    reg [8:0] addr;
    reg [15:0] data_in;
    reg we;
    reg clk;
    reg reset;
    wire [15:0] data_out;

    ram512 uut (
        .addr(addr),
        .data_in(data_in),
        .we(we),
        .clk(clk),
        .reset(reset),
        .data_out(data_out)
    );

    always begin
        #10 clk = ~clk;
    end

    initial begin
        $dumpfile("tb_ram512.vcd");
        $dumpvars(0, tb_ram512);
        clk = 0;
        reset = 0;
        we = 0;
        addr = 9'b0;
        data_in = 16'b0;

        $monitor("Time = %t, addr = %b, data_in = %h, we = %b, data_out = %h", $time, addr, data_in, we, data_out);

        reset = 1;
        #20;
        reset = 0;

        addr = 9'b000000000;
        data_in = 16'hA5A5;
        we = 1;
        #20;
        we = 0;

        addr = 9'b000000000;
        #20;

        addr = 9'b000000001;
        data_in = 16'hF0F0;
        we = 1;
        #20;
        we = 0;

        addr = 9'b000000001;
        #20;

        addr = 9'b111111111;
        data_in = 16'h5A5A;
        we = 1;
        #20;
        we = 0;

        addr = 9'b111111111;
        #20;

        $finish;
    end

endmodule
