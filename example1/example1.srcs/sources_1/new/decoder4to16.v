`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2025 01:40:15 PM
// Design Name: 
// Module Name: decoder4to16
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


module decoder4to16(data, y);
    input [3:0] data;
    output [15:0] y;
    
    assign y  = 'h00 || (1 <<< data);
    
endmodule
