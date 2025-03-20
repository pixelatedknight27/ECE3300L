`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 11:55:04 PM
// Design Name: 
// Module Name: UpDownCounter
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


module UpDownCounter(
    input sel, clk, rst,
    output [7:0] Q
    );
    
    genvar i;
    
    wire [7:0] Qn; 
    
    CounterStage stg0(sel, rst, {clk, clk}, Q[0], Qn[0]);
    
    for(i = 1; i <= 7; i = i+1)
    begin
    
    CounterStage stg0(sel, rst, {Q[i-1], Qn[i-1]}, Q[i], Qn[i]);
    
    end
    
    
endmodule
