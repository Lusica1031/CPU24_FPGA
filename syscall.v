`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 10:44:10
// Design Name: 
// Module Name: syscall
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


module syscall(
input [31:0] v0,
input [31:0] a0,
input clk,rst,go,syscall,
output control,
output [31:0] ledData
    );
    reg D;
    reg [31:0]leddata;
    assign control=~D;
    assign ledData=leddata;
    
    /*initial
    begin
        D<=1;
        leddata<=0;
    end*/
    
    always@(posedge clk or posedge rst)
    begin
        if(rst)
            leddata<=0;
        else if(v0==34&&syscall)
            leddata<=a0;
    end
    
    always@(posedge clk or posedge rst or posedge go)
        begin
            if(rst)
                D<=1;
            else if(go)
                D<=0;
            else if(control)
                D<=v0!=34&&syscall;
        end    
endmodule
