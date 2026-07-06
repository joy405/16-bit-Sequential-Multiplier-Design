module MUL_datapath(
    eqz,
    LdA,
    LdB,
    clrp,
    Ldp,
    decB,
    data_in,
    clk
  
);
input LdA;
input LdB;
input Ldp;
input decB;
input clrp;
input clk;
input [15:0] data_in;
output eqz;



wire [15:0] X,Y,Z,Bout,Bus;
assign Bus = data_in;
//intialize all the modules....with input ,outputs and control signals
pipo1 A(X,Bus,LdA,clk);
pipo2 p(Y,Z,Ldp,clrp,clk);
Add AD(Z,X,Y);
CNTR B(Bout,Bus,LdB,decB,clk);
EQZ COMP(eqz,Bout);






endmodule
