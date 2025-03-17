`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 01:49:18 PM
// Design Name: 
// Module Name: BlockingExp3
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


module BlockingExp3(x1, x2, x3, Clock, f, g);
    input x1, x2, x3, Clock;
    output reg f, g;
    
    always @(posedge Clock)
    begin
        g = f | x3;
        f = x1 & x2;
    end
endmodule


