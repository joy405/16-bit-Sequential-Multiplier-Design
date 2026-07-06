`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.07.2026 15:31:09
// Design Name: 
// Module Name: controller
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


module controller(
LdA,LdB,Ldp,clrp,decB,eqz,clk,start,done
    );
    input clk,eqz,start;
    
    output reg done,LdA,LdB,Ldp,clrp,decB;
    
    reg [2:0] state;
    parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;
    //first the state transition logic
    always @(posedge clk)
    begin
    case(state)
     s0:if(start) state<=s1;
     s1:state<=s2;
     s2:state<=s3;
     s3:
     begin #2 if(eqz) state<=s4;//here we give a little delay because to go in the final state we need some time
     end
     s4:state<=s4;
     default:state<=s0;
     endcase
     end
     
     //second is the this output signal
     always @(state)
     begin
     case(state)
     //in the initial state all the signal having zero value
     s0: begin #1 LdA=0;LdB=0;Ldp=0;clrp=0;decB=0;done=0;end
     //in the s1 state only LdA=1
     s1:begin #1 LdA=1 ;end
     // in the  s2 state LdB=1 ,LdA=0,clrP=1;
     s2:begin #1 LdA=0; LdB=1;clrp=1;end
     // in the s3 state LdP=1,decB=1,and LdB=0 bec we have stop loading new date rather we have to decrement the B
     s3:begin #1 LdB=0;Ldp=1;decB=1;clrp=0;end
     //in the last state done=1 and all are  deactivated;
     s4:begin #1 done=1; Ldp=0;decB=0;LdB=0;end
     default:begin #1 LdA=0;LdB=0;Ldp=0;clrp=0;decB=0;end
     endcase
     end
     endmodule
