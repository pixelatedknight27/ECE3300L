`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 12:37:56 PM
// Design Name: 
// Module Name: Exercise1Sim
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


module Exercise1Sim;

    reg reset, clk, w, z;
    wire Q;
    
    Exercise1 uut(reset, clk, w, z, Q);
    
    initial begin
    
        reset = 0;
        #1 reset = 1;
        
        #1 clk = 0; w = 0; z = 0;
        #1 clk = 1; w = 0; z = 1;
        #1 clk = 0; w = 1; z = 0;
        #1 clk = 1; w = 1; z = 1;
        #1 clk = 0; w = 0; z = 0;
        #1 clk = 1; w = 0; z = 1;
        #1 clk = 0; w = 1; z = 0;
        #1 clk = 1; w = 1; z = 1;
        #1 clk = 0; w = 0; z = 0;
        #1 clk = 1; w = 0; z = 1;
        #1 clk = 0; w = 1; z = 0;
        #1 clk = 1; w = 1; z = 1;
    
    end
endmodule
