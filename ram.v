`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 08:14:06
// Design Name: 
// Module Name: ram
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ram(
    input [9:0] Addr,
    input [31:0] Din,
    input Store,
    input Clear,
    input clk,
    output [31:0] Data
    );
    reg [31:0] mem [0:1023];
    integer i;

    initial
    begin
        for (i = 0; i < 1024; i = i + 1)
        begin
            mem[i] <= 0;
        end
    end

    assign Data = mem[Addr];

    always @ (posedge clk or posedge Clear)
    begin
        if (Clear)
        begin
            for (i = 0; i < 1024; i = i + 1)
            begin
                mem[i] <= 0;
            end
        end
        else if (Store)
        begin
            mem[Addr] <= Din;
        end
    end
endmodule