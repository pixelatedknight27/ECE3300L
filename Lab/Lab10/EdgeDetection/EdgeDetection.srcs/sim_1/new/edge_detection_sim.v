`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 03:24:54 PM
// Design Name: 
// Module Name: edge_detection_sim
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


module edge_detection_sim;

    reg clk, reset, level;
    wire tick0, tick1;
    
    edge_detection uut(clk, reset, level, tick0, tick1);
    
    initial begin
    clk = 0; level = 0; reset = 0;
    #1 reset = 1;
    #1 reset = 0;
    
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    end
    
endmodule
