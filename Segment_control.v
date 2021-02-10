`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 08:55:55
// Design Name: 
// Module Name: Segment_control
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

//4 mode
//data display
//output 
module Segment_control(
    input wire[2:0] mode,
    input wire[31:0] period_num,
    input wire[31:0] a0,
    input wire[31:0] mem,
    input wire[31:0] jmp,
    input wire[31:0] c_jmp,
    output reg[31:0] seg_num
    );

always @(*)begin
	case(mode)
	3'b000:seg_num<=a0;
	3'b001:seg_num<=period_num;
	3'b010:seg_num<=jmp;
	3'b011:seg_num<=c_jmp;
	3'b100:seg_num<=mem;
	default:seg_num<=0;
	endcase
end
endmodule
