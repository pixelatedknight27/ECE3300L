`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 03:02:29 PM
// Design Name: 
// Module Name: edge_detection
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


module edge_detection(input wire clk, reset, level, output tick0, tick1);
    edge_detect_moore moore(clk, reset, level, tick0);
    edge_detect_mealy mealy(clk, reset, level, tick1);
endmodule
