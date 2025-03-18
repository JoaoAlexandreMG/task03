module ram512 (
    input [8:0] addr,          
    input [15:0] data_in,      
    input we,                 
    input clk,               
    input reset,              
    output reg [15:0] data_out 
);

    reg [15:0] memory [0:511]; 

    integer i; 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 512; i = i + 1) begin
                memory[i] <= 16'b0;
            end
            data_out <= 16'b0; 
        end else begin
            if (we) begin
                memory[addr] <= data_in;
            end
            data_out <= memory[addr];
        end
    end

endmodule
