`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 15:32:30
// Design Name: 
// Module Name: MUL_test
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


module MUL_test;
reg [15:0] data_in;
reg clk,start;
wire done;



MUL_datapath DP( eqz,
    LdA,
    LdB,
    clrp,
    Ldp,
    decB,
    data_in,
    clk);
controller CON(LdA,LdB,Ldp,clrp,decB,eqz,clk,start,done);

initial 
begin
clk=1'b0;
start = 0;
data_in = 0;


#3 start=1'b1;//means at 3ns time we start the multiplication
#5000 $finish;
end

always #5 clk=~clk;
  
initial begin
//at t=17ns i give the first input to 17 
#17 data_in=16'd119; 
//at t=5ns i give the second input to 5 so i want to multiply 17and 5
#10 data_in=16'd9;
#120 $finish;
end

initial
 begin
 $monitor ($time,"%d %b",DP.Y,done);
 $dumpfile("mul.vcd");$dumpvars(0,MUL_test);
 end


endmodule
