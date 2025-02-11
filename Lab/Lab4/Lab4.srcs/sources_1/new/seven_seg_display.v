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


module seven_seg_display(num, Cout, DP, AN);
    input [3:0] num;
    output [6:0] Cout;
    output DP;
    output [7:0] AN;
    
    wire [15:0] y;
    
    four_to_sixteen_decoder d1(num, y);
    seven_seg_decoder d2(y, Cout, DP, AN);
    
    
endmodule
