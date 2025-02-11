`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2025 02:38:30 PM
// Design Name: 
// Module Name: mux8to1
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


module mux8to1(data, sel, out);
    input [7:0] data;
    input [2:0] sel;
    output reg out;
    
    always @ (data, sel)
    begin
        out = data[sel];
    end
endmodule
