`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 02:03:44 PM
// Design Name: 
// Module Name: TopModule
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


module TopModule(
    input x1, x2, x3, Clock, 
    output f0, g0, f1, g1
    );
    
    BlockingExp3 blk0(x1, x2, x3, Clock, f0, g0);
    BlockingExp3 blk1(x1, x2, x3, Clock, f1, g1);
    
endmodule
