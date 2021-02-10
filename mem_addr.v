`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 09:59:34
// Design Name: 
// Module Name: mem_addr
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


module mem_addr(
	input wire[2:0] mode,
	input wire[3:0] line_num,
	input wire[31:0] in_alu,
	output reg[9:0] addr
    );
    wire[9:0] alu_addr;
    wire[9:0] line_addr;
    assign alu_addr=in_alu[11:2];
    assign line_addr={{6'b0},line_num};
    always@(*)begin
    	case(mode)
    	3'b100: addr<=line_addr;
    	default: addr<=alu_addr;
    	endcase
    end
endmodule
