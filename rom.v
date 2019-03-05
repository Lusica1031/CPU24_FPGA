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
module rom(
    input [9:0] Addr,
    output [31:0] Data
    );
    
    reg [31:0] mem [0:1023];
    assign Data = mem[Addr];
    
    initial
    begin
        $readmemh("C:\Users\MacBook\Desktop\benchmark_ccmb.hex", mem, 0, 222);
    end
endmodule
