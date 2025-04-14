`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 01:22:10 PM
// Design Name: 
// Module Name: Divider_Sim
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


module Divider_Sim;
    
    reg clock, reset, command;
reg [3:0] dataB;
reg [7:0] dataA;
wire done;
wire [7:0] quotient;
wire [7:0] remainder;
wire [2:0] i;
wire [15:0] registerRA;
wire [1:0] state_reg;
divider uut(clock, reset, command, dataA, dataB, quotient, i, registerRA, state_reg, remainder, done);
initial begin

#1 reset=1;clock=0;command=0;
#1 clock=~clock;
#1 reset=1; dataA=8'd255; dataB=4'd7; clock=~clock;
#1 clock=~clock;
#1 clock=~clock;
#1 reset=0; clock=~clock;
#1 clock=~clock;
#1 clock=~clock;
#1 command=1;  clock=~clock;
repeat(100)
#1 clock=~clock;

end
    
    
endmodule
