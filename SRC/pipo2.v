`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 15:25:46
// Design Name: 
// Module Name: pipo2
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


module pipo2(
output reg [15:0] dout,
input  [15:0] din,
input ld,
input clr,
input clk

);
 always @(posedge clk)
 begin
 if(clr)
 dout<=16'b0;
 else if(ld) dout<=din;

 
 end
 endmodule
