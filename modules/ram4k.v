module ram4k(
    input [11:0] addr,       
    input [15:0] data_in,   
    input we,             
    input clk,              
    input reset,          
    output reg [15:0] data_out 
);

    reg [15:0] ram [0:4095];  


    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out <= 16'b0;
        end else if (we) begin
            ram[addr] <= data_in;
        end else begin
            data_out <= ram[addr];
        end
    end
endmodule
