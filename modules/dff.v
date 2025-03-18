module dff (
    input clk,
    input reset,
    input load,
    input [15:0] data_in,
    output reg [15:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 16'b0;
        end else if (load) begin
            q <= data_in;
        end
    end

endmodule
