module pc(
    input wire clk,          
    input wire reset,       
    input wire load,        
    input wire increment,    
    input wire [15:0] data_in, 
    output reg [15:0] pc     
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pc <= 16'b0; 
        end
        else if (load) begin
            pc <= data_in; 
        end
        else if (increment) begin
            pc <= pc + 1; 
        end
    end

endmodule
