`include "modules/ram4k.v"  
module tb_ram4k;

    reg [11:0] addr;          
    reg [15:0] data_in;     
    reg we;                
    reg clk;                  
    reg reset;                
    wire [15:0] data_out;    

    ram4k uut (
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
        $dumpfile("tb_ram4k.vcd");  
        $dumpvars(0, tb_ram4k);
        clk = 0;
        reset = 0;
        we = 0;
        addr = 12'b0;
        data_in = 16'b0;

        $display("No tempo %t: Aplicando reset", $time);
        reset = 1;
        #20 reset = 0;

        $display("No tempo %t: Escrevendo dados no endereco 000", $time);
        addr = 12'b000000000000; 
        data_in = 16'b1010101010101010;
        we = 1;  
        #20 we = 0;  
        #20; 
        $display("No tempo %t: Dados escritos no endereco 000, data_out = %b", $time, data_out);

        $display("No tempo %t: Escrevendo dados no endereco 001", $time);
        addr = 12'b000000000001;
        data_in = 16'b1111000011110000;
        we = 1;
        #20 we = 0;
        #20;
        $display("No tempo %t: Dados escritos no endereco 001, data_out = %b", $time, data_out);

        $display("No tempo %t: Escrevendo dados no endereco 0FFF", $time);
        addr = 12'b000011111111; 
        data_in = 16'b0101010101010101;
        we = 1;
        #20 we = 0;
        #20;
        $display("No tempo %t: Dados escritos no endereco 0FFF, data_out = %b", $time, data_out);

        addr = 12'b000000000000;
        #20;
        $display("No tempo %t: Lendo dados do endereco 000, data_out = %b", $time, data_out);

        addr = 12'b000000000001;
        #20;
        $display("No tempo %t: Lendo dados do endereco 001, data_out = %b", $time, data_out);

        addr = 12'b000011111111;
        #20;
        $display("No tempo %t: Lendo dados do endereco 0FFF, data_out = %b", $time, data_out);

        $finish;
    end

endmodule
