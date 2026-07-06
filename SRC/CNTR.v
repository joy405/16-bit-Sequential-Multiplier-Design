`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 15:30:02
// Design Name: 
// Module Name: CNTR
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


module CNTR(
    output reg [15:0] dout,
    input [15:0] din,
    input ld,
    input dec,
    input clk
    );
    
    always @(posedge clk)
    begin
      if(ld) dout<=din;
      else if(dec) dout<=dout-1;
   end
endmodule

