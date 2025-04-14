`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 01:52:38 PM
// Design Name: 
// Module Name: Multiplier_sim
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


module Multiplier_sim;
reg clock, reset, command;
reg [3:0] dataA, dataB;
wire done;
wire [7:0] product;
Multiplier uut(clock, reset, command, dataA, dataB, product, done);
initial begin
#1 reset=0;clock=0;
#1 clock=~clock;
#1 reset=1; dataA=4'b1101; dataB=4'b1011; clock=~clock;
#1 clock=~clock;
#1 clock=~clock;
#1 reset=0; clock=~clock;
#1 command=1; clock=~clock;
repeat(10)
#1 clock=~clock;
end
endmodule

