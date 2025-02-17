`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 03:23:26 PM
// Design Name: 
// Module Name: seven_seg_display
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


module seven_seg_display(
    input clkin,
    input resetCLK, resetSW, 
    output [6:0] Cout, 
    output DP, 
    output [7:0] AN);
    
    wire [15:0] y;
    wire clkout;
    wire [3:0] num;
    
    slowerClkGen clk(clkin, resetclk, clkout);
    upcounter ctr(resetSW, clkout, 1, num);
    four_to_sixteen_decoder d1(num, y);
    seven_seg_decoder d2(y, Cout, DP, AN);
    
    
endmodule
