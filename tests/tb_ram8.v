`include "modules/ram8.v"

module tb_ram8;
    reg [2:0] addr;
    reg [15:0] data_in;
    reg we;
    reg clk;
    reg reset;
    wire [15:0] data_out;

    ram8 uut (
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
        $dumpfile("tb_ram8.vcd");
        $dumpvars(0, tb_ram8);
        clk = 0;
        reset = 0;
        we = 0;
        addr = 3'b000;
        data_in = 16'b0;

        reset = 1;
        #10 reset = 0;

        addr = 3'b000;
        data_in = 16'b1010101010101010;
        we = 1;
        #10 we = 0;

        addr = 3'b000;
        #10;
        $display("Dados no endereço %b: %b", addr, data_out);

        addr = 3'b001;
        data_in = 16'b1111000011110000;
        we = 1;
        #10 we = 0;

        addr = 3'b001;
        #10;
        $display("Dados no endereço %b: %b", addr, data_out);

        addr = 3'b111;
        data_in = 16'b0101010101010101;
        we = 1;
        #10 we = 0;

        addr = 3'b111;
        #10;
        $display("Dados no endereço %b: %b", addr, data_out);

        $finish;
    end
endmodule
