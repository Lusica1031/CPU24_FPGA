`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 09:32:15
// Design Name: 
// Module Name: test_memory
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


module test_memory(

    );
    reg [9:0] Addr;
    reg [31:0] Din;
    reg Store,Clear,clk;
    wire [31:0] roData;
    wire [31:0] raData;
   ram Ram(Addr,Din, Store, Clear,clk,raData);
   rom Rom(Addr,roData);
   integer i,j;
   initial
   begin 
   Store=1;
   Clear=0;
    for(j=0;j<16;j=j+1)
    begin
        #10 Addr<=j;
        Din<=j;
    end
    Store=0;
    for(j=0;j<16;j=j+1)
        begin
            #10 Addr<=j;
            Din<=j;
        end
    Clear=1;
    for(j=0;j<16;j=j+1)
            begin
                #10 Addr<=j;
                Din<=j;
            end
            
   end
   
   initial
      begin
      #5 clk=1;
       for(i=0;i<1000;i=i+1)
       begin
           #5 clk=0;
           #5 clk=1;
       end
      end
    
endmodule
