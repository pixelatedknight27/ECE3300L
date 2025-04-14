`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025 05:30:58 PM
// Design Name: 
// Module Name: bit_counter
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


module bit_counter(rst, Clock, Qin, Load, Enable, Qout);
    parameter n = 4;
    input rst, Clock, Load, Enable;
    input [n-1:0] Qin;
    output [$clog2(n) - 1:0] Qout;
    
    wire [n-1:0] Qshift;
    shiftright u1(rst, Qin, Load, Enable, 0, Clock, Qshift);
    counter u2(rst, Qshift[0], Enable, Clock, Qout);
endmodule
