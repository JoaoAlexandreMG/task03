module ram8 (
    input [2:0] addr,         
    input [15:0] data_in,     
    input we,                 
    input clk,              
    input reset,              
    output reg [15:0] data_out 
);

    reg [15:0] memory [0:7]; 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            memory[0] <= 16'b0;
            memory[1] <= 16'b0;
            memory[2] <= 16'b0;
            memory[3] <= 16'b0;
            memory[4] <= 16'b0;
            memory[5] <= 16'b0;
            memory[6] <= 16'b0;
            memory[7] <= 16'b0;
            data_out <= 16'b0; 
        end else begin
            if (we) begin
                memory[addr] <= data_in;
            end
            data_out <= memory[addr];
        end
    end
endmodule
