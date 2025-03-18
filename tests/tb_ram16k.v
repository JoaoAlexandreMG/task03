`include "modules/ram16k.v"
module tb_ram16k;

    reg [13:0] addr;
    reg [15:0] data_in;
    reg we;
    reg clk;
    reg reset;
    wire [15:0] data_out;

    ram16k ram16k_inst (
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
        $dumpfile("tb_ram16k.vcd");
        $dumpvars(0, tb_ram16k);
        clk = 0;
        reset = 1;
        addr = 14'b0;
        data_in = 16'b0;
        we = 0;
        
        #20 reset = 0;

        #20 addr = 14'b00000000000000; data_in = 16'hA5A5; we = 1;
        #20 we = 0;
        #20 addr = 14'b00000000000001; data_in = 16'hF0F0; we = 1;
        #20 we = 0;
        #20 addr = 14'b00111111111111; data_in = 16'h5A5A; we = 1;
        #20 we = 0;

        #100 $finish;
    end

    initial begin
        $monitor("No tempo %0t: addr = %b, data_in = %h, we = %b, data_out = %h", 
                 $time, addr, data_in, we, data_out);
        $dumpfile("tb_ram16k.vcd");
        $dumpvars(0, tb_ram16k);
    end

endmodule
