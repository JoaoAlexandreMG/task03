module register(
    input clk,     
    input reset,    
    input [15:0] d, 
    output reg [15:0] q  
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 16'b0;  
        else
            q <= d;  
    end

endmodule
