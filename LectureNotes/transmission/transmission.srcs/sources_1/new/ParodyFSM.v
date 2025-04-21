`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2025 02:23:16 PM
// Design Name: 
// Module Name: ParodyFSM
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


module ParodyFSM(reset, clk, Qin, Qout);
    input reset;
    input clk;
    input Qin;
    output reg Qout;
    
    always @(posedge reset, posedge clk)
    begin
        if(reset)
        begin
            Qout = 0;
        end
        else
            Qout <= Qout ^ Qin;
    end
endmodule
