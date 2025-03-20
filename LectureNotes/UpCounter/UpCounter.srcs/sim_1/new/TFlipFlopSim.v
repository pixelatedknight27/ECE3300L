`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 11:10:55 PM
// Design Name: 
// Module Name: TFlipFlopSim
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


module TFlipFlopSim;

    reg rst, clk, T;
    wire Q, Qn;
    
    TFlipFlop uut(rst, clk, T, Q, Qn);

    initial begin
        rst = 0;
        #1 rst = 1;
        #1 clk = 0; T = 0;
        #1 clk = 1; T = 1;
        #1 clk = 0; T = 1;
        #1 clk = 1; T = 1;
        #1 clk = 0; T = 0;
        #1 clk = 1; T = 0;
        #1 clk = 0; T = 1;
        #1 clk = 1; T = 1;
    end

endmodule
