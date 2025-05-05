`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2025 01:47:07 PM
// Design Name: 
// Module Name: ShiftReg
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

module Counter(clear, clk, Qout);
    parameter n = 3;
    input clear;
    input clk;
    output reg [n-1:0] Qout;
    
    always @(posedge clk)
    begin
        if(~clear)
            Qout = 0;
        else
            Qout <= Qout+1;
    end
endmodule