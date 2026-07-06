`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 15:28:21
// Design Name: 
// Module Name: pipo1
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


module pipo1(
output reg [15:0] dout,
input [15:0] din,
input ld,
input clk
    );
    
    always @(posedge clk)
    begin
    if(ld)
    dout<=din;
    end
    
    
endmodule
