`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 11:20:08
// Design Name: 
// Module Name: test_syscall
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


module test_syscall(

    );
    reg [31:0]v0;
    reg [31:0]a0;
    reg clk,rst,go,syscall;
    wire control;
    wire [31:0]ledData;
    integer i,j;
    syscall sys( v0,a0,clk,rst,go,syscall,control, ledData );
    initial
    begin
        #5 clk=1;
        for(i=0;i<1000;i=i+1)
        begin
            #5 clk=0;
            #5 clk=1;
        end
    end
    initial
    begin
        a0=5;
        v0=34;
        rst=0;
        syscall=0;
        go=0;
        #1 go=1;
        #1 go=0;
        #10 syscall=1;
        #10 a0=6;
        #10 syscall=0;
        #10 a0=7;
        #10 v0=10;
        #10 syscall=1;
        #20 go=1;
    end
        
        
    
endmodule
