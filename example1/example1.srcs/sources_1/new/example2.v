`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2025 02:15:31 PM
// Design Name: 
// Module Name: example2
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


module example2(x1, x2, x3, x4, f, g, h);
    input x1, x2, x3, x4;
    output f, g, h;
    
    and(a, x1, x3);
    and(b, x2, x4);
    or(c, x1, ~x3);
    or(d, x4, ~x2);
    
    or(g, b, a);
    or(h, d, c);
    or(f, h, g);
    
endmodule
