`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 10:28:52
// Design Name: 
// Module Name: PC
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


module PC(
	input wire[15:0] imm,
	input wire clk,
	input wire rst,
	input wire control,
	input wire[31:0] R1,
	input wire JR,
	input wire BJ,
	input wire JMP,
	input wire[25:0] index,
	output reg[31:0] pc,
	output wire[31:0] pc_temp,
	output wire[31:0] in0,
    output wire[31:0] in1,
    output wire[31:0] in2
    );
wire[31:0] pc_4;
//wire[31:0] in0;
//wire[31:0] in1;
//wire[31:0] in2;
wire[1:0] sel;
wire[32:0] unsign_imm;
reg count=0;
assign unsign_imm={{16{imm[15]}},imm};
assign sel={JMP,BJ};
assign in0=pc+4;
assign in1= pc+4+(unsign_imm<<2);
assign in2=JR?(R1):{pc[31:28],index,{2'b0}};

Mux4_2_10 convert(sel,in0,in1,in2,0,pc_temp);


always@(posedge clk)begin
    if(count==0)begin
        pc<=0;
        count=count+1;
    end
	else if(control==0 && rst!=1)begin
		pc<=pc;
	end
	else if(rst==1)begin
		pc<=0;
	end
	else begin
		pc<=pc_temp;
	end
end
endmodule
