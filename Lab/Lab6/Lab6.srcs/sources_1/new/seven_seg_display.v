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
    input resetCLK, resetSW, enable,
    output [6:0] Cout, 
    output DP, 
    output [7:0] AN);
    
    wire [15:0] y;
    wire clkout_0, clkout_1;
    wire [3:0] num;
//    wire [3:0] AN_ctr;
    
    
    
    slowerClkGen clk(clkin, resetclk, clkout_0, clkout_1);
    upcounter ctr0(resetSW, clkout_0, enable, num);
//    upcounter ctr1(resetSW, clkout_0, enable, AN_ctr);
    four_to_sixteen_decoder d1(num, y);
    seven_seg_decoder d2(y+1, Cout, DP);
    
    assign AN[7:4] = 4'b1111;
    assign AN[3:0] = ~y[3:0];
    
endmodule
