`include "modules/ram64.v"

module tb_ram64;
    reg [5:0] addr;
    reg [15:0] data_in;
    reg we;
    reg clk;
    reg reset;
    wire [15:0] data_out;

    ram64 uut (
        .addr(addr),
        .data_in(data_in),
        .we(we),
        .clk(clk),
        .reset(reset),
        .data_out(data_out)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin
        $dumpfile("tb_ram64.vcd");
        $dumpvars(0, tb_ram64);
        clk = 0;
        reset = 0;
        we = 0;
        addr = 6'b0;
        data_in = 16'b0;

        reset = 1;
        #10 reset = 0;

        addr = 6'b000000;
        data_in = 16'b1010101010101010;
        we = 1;
        #10 we = 0;

        addr = 6'b000000;
        #10;
        $display("Dados no endereço %b: %b", addr, data_out);

        addr = 6'b000001;
        data_in = 16'b1111000011110000;
        we = 1;
        #10 we = 0;

        addr = 6'b000001;
        #10;
        $display("Dados no endereço %b: %b", addr, data_out);

        addr = 6'b111111;
        data_in = 16'b0101010101010101;
        we = 1;
        #10 we = 0;

        addr = 6'b111111;
        #10;
        $display("Dados no endereço %b: %b", addr, data_out);

        $finish;
    end
endmodule
