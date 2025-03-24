`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 01:25:04 PM
// Design Name: 
// Module Name: CounterSim
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


module CounterSim;
    reg rst;
    reg enable;
    reg clk;
    wire load;
    wire [3:0] Q;

    ModuloCounter uut(rst, enable, clk, Q, load);
    
    initial begin
    
    rst = 1; clk = 0; enable = 1;
    #1 rst = 0;
    #1 rst = 1;
    
    for(integer i = 0; i < 16; i = i+1)
    begin
        #1 clk = 0;
        #1 clk = 1;
    end
    
    end

endmodule
