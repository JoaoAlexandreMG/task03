`include "modules/dff.v"
module tb_dff;

    reg clk;
    reg reset;
    reg load;
    reg [15:0] data_in;
    wire [15:0] q;

    dff uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .data_in(data_in),
        .q(q)
    );

    always begin
        #10 clk = ~clk;
    end

    initial begin
        $dumpfile("tb_dff.vcd");
        $dumpvars(0, tb_dff);
        clk = 0;
        reset = 0;
        load = 0;
        data_in = 16'b0;

        $display("Tempo = %0t, Reset = %b, Load = %b, Data_in = %b, Q = %b", $time, reset, load, data_in, q);
        reset = 1;
        #20;
        reset = 0;
        $display("Tempo = %0t, Reset = %b, Load = %b, Data_in = %b, Q = %b", $time, reset, load, data_in, q);
        
        load = 1;
        data_in = 16'hAAAA;
        #20;
        load = 0;
        $display("Tempo = %0t, Reset = %b, Load = %b, Data_in = %b, Q = %b", $time, reset, load, data_in, q);

        data_in = 16'h1234;
        load = 1;
        #20;
        load = 0;
        $display("Tempo = %0t, Reset = %b, Load = %b, Data_in = %b, Q = %b", $time, reset, load, data_in, q);

        reset = 1;
        #20;
        reset = 0;
        $display("Tempo = %0t, Reset = %b, Load = %b, Data_in = %b, Q = %b", $time, reset, load, data_in, q);

        $finish;
    end

endmodule
