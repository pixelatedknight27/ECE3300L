`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025 05:56:02 PM
// Design Name: 
// Module Name: bit_counter_sim
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


module bit_counter_sim;
    parameter n = 8;
    reg rst = 0, Clock = 0, Load = 0, Enable = 0;
    reg [n-1:0] Qin = 4'd5;
    wire [$clog2(n) - 1:0] Qout;
    wire Done;
    
    bit_counter uut(rst, Clock, Qin, Load, Enable, Qout, Done);
    
    initial begin
        #1 Clock = 0; 
        #1 Clock = 1; rst = 1;
        #1 Clock = 0;
        #1 Clock = 1; rst = 0; Enable = 1;
        #1 Clock = 0;
        #1 Clock = 1; Load = 1;
        #1 Clock = 0;
        #1 Clock = 1; Load = 0;
        #1 Clock = 0;
        #1 Clock = 1;
        #1 Clock = 0;
        #1 Clock = 1;
        #1 Clock = 0;
        #1 Clock = 1;
        #1 Clock = 0;
        #1 Clock = 1;
        #1 Clock = 0;
        #1 Clock = 1;
    end
endmodule
