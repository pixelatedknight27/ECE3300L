`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2025 09:10:29 PM
// Design Name: 
// Module Name: TransmitterSim
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


module TransmitterSim;
    parameter n = 8;
    reg reset = 1; 
    reg clk = 0;
    reg load = 0;
    reg [n-1:0] Qin;
    wire out;
    
    integer i;
    
    Transmitter uut(reset, clk, Qin, load, out);
    initial begin
    
        #1 clk = 0; 
        #1 clk = 1; Qin = 8'h45; reset = 0; load = 1;
        #1 clk = 0;
        #1 clk = 1; load = 0;
        
        for(i = 0; i < 8; i = i+1)
        begin
            #1 clk = 0;
            #1 clk = 1;
        end
        
        #1 clk = 0; 
        #1 clk = 1; Qin = 8'h44; reset = 0; load = 1;
        #1 clk = 0;
        #1 clk = 1; load = 0;
        
        for(i = 0; i < 8; i = i+1)
        begin
            #1 clk = 0;
            #1 clk = 1;
        end
    end

endmodule
