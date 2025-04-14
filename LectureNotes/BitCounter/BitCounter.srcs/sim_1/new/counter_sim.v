`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025 05:24:37 PM
// Design Name: 
// Module Name: counter_sim
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


module counter_sim;
    parameter n = 8;
    
    reg rst = 0, L = 0, E = 0, Clock = 0;
    
    wire [$clog2(n)-1:0] Q;
    
    bit_counter uut(rst, L, E, Clock, Q);
    
    initial begin
        #1 Clock = 0; 
        #1 Clock = 1; rst = 1;
        #1 Clock = 0;
        #1 Clock = 1; rst = 0; E = 1;
        #1 Clock = 0;
        #1 Clock = 1; L = 1;
        #1 Clock = 0;
        #1 Clock = 1;
        #1 Clock = 0;
        #1 Clock = 1;
        #1 Clock = 0;
        #1 Clock = 1; L = 0;
        #1 Clock = 0;
        #1 Clock = 1; L = 1;
        #1 Clock = 0;
        #1 Clock = 1;
        #1 Clock = 0;
        #1 Clock = 1;
    end
endmodule
