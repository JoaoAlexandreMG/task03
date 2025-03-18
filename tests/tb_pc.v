`include "modules/pc.v"  
module tb_pc();

    reg clk;                
    reg reset;             
    reg load;                
    reg increment;         
    reg [15:0] data_in;     
    wire [15:0] pc;       

    pc uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .increment(increment),
        .data_in(data_in),
        .pc(pc)
    );

    always begin
        #5 clk = ~clk; 
    end

    initial begin
        $dumpfile("tb_pc.vcd");  
        $dumpvars(0, tb_pc);
        clk = 0;
        reset = 0;
        load = 0;
        increment = 0;
        data_in = 16'b0;

        #10 reset = 1;   
        #10 reset = 0;   

        #10 load = 1;    
        data_in = 16'hAAAA;  
        #10 load = 0;    
        #10 increment = 1;  
        #10 increment = 0;  

        #10 increment = 1;  
        #10 increment = 0;  

        #10 load = 1;   
        data_in = 16'h1234;  
        #10 load = 0;    

        #20 $finish;
    end

    initial begin
        $monitor("Tempo = %0t, Reset = %b, Load = %b, Incremento = %b, PC = %h", 
                 $time, reset, load, increment, pc);
    end

endmodule
