`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 02:09:11 PM
// Design Name: 
// Module Name: BlockingSim
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


module BlockingSim();

    reg x1, x2, x3, Clock;
    wire f0, g0, f1, g1;
    
    TopModule uut0(x1, x2, x3, Clock, f0, g0);
    TopModule uut1(x1, x2, x3, Clock, f1, g1);
    
    initial begin
    
    #1 Clock = 0; x1 = 0; x2 = 0; x3 = 0;
    #1 Clock = 1; x1 = 0; x2 = 0; x3 = 1;
    #1 Clock = 0; x1 = 0; x2 = 1; x3 = 0;
    #1 Clock = 1; x1 = 0; x2 = 1; x3 = 1;
    #1 Clock = 0; x1 = 1; x2 = 0; x3 = 0;
    #1 Clock = 1; x1 = 1; x2 = 0; x3 = 1;
    #1 Clock = 0; x1 = 1; x2 = 1; x3 = 0;
    #1 Clock = 1; x1 = 1; x2 = 1; x3 = 1;
    
    end

endmodule
