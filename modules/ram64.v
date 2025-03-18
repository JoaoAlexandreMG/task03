`include "modules/ram8.v"
module ram64 (
    input [5:0] addr,          
    input [15:0] data_in,      
    input we,                 
    input clk,               
    input reset,              
    output reg [15:0] data_out 
);

    wire [2:0] ram8_addr;     
    wire [2:0] ram8_index = addr[5:3]; // Seleciona qual ram8 usar
    
    reg [15:0] data_out_ram8[0:7]; 
    wire [15:0] data_out_ram8_wire[0:7];

    ram8 ram8_0 (
        .addr(addr[2:0]),
        .data_in(data_in),
        .we(we),
        .clk(clk),
        .reset(reset),
        .data_out(data_out_ram8_wire[0])
    );

    ram8 ram8_1 (
        .addr(addr[2:0]),
        .data_in(data_in),
        .we(we),
        .clk(clk),
        .reset(reset),
        .data_out(data_out_ram8_wire[1])
    );

    ram8 ram8_2 (
        .addr(addr[2:0]),
        .data_in(data_in),
        .we(we),
        .clk(clk),
        .reset(reset),
        .data_out(data_out_ram8_wire[2])
    );

    ram8 ram8_3 (
        .addr(addr[2:0]),
        .data_in(data_in),
        .we(we),
        .clk(clk),
        .reset(reset),
        .data_out(data_out_ram8_wire[3])
    );

    ram8 ram8_4 (
        .addr(addr[2:0]),
        .data_in(data_in),
        .we(we),
        .clk(clk),
        .reset(reset),
        .data_out(data_out_ram8_wire[4])
    );

    ram8 ram8_5 (
        .addr(addr[2:0]),
        .data_in(data_in),
        .we(we),
        .clk(clk),
        .reset(reset),
        .data_out(data_out_ram8_wire[5])
    );

    ram8 ram8_6 (
        .addr(addr[2:0]),
        .data_in(data_in),
        .we(we),
        .clk(clk),
        .reset(reset),
        .data_out(data_out_ram8_wire[6])
    );

    ram8 ram8_7 (
        .addr(addr[2:0]),
        .data_in(data_in),
        .we(we),
        .clk(clk),
        .reset(reset),
        .data_out(data_out_ram8_wire[7])
    );

    always @(*) begin
        case (ram8_index)
            3'b000: data_out = data_out_ram8_wire[0];
            3'b001: data_out = data_out_ram8_wire[1];
            3'b010: data_out = data_out_ram8_wire[2];
            3'b011: data_out = data_out_ram8_wire[3];
            3'b100: data_out = data_out_ram8_wire[4];
            3'b101: data_out = data_out_ram8_wire[5];
            3'b110: data_out = data_out_ram8_wire[6];
            3'b111: data_out = data_out_ram8_wire[7];
            default: data_out = 16'b0;
        endcase
    end
endmodule
