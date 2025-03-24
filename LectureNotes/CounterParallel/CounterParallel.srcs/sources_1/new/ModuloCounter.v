`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 01:31:22 PM
// Design Name: 
// Module Name: ModuloCounter
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


module ModuloCounter(
    input rst,
    input enable,
    input clk,
    output [3:0] Q,
    output load
    );
    
    assign load = Q[0]&Q;
    
    CounterStage ctr0(
        rst,
        enable,
        clk,
        load,
        4'b0,
        Q
    );
endmodule
