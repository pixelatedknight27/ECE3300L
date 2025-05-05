`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2025 01:58:10 PM
// Design Name: 
// Module Name: ShiftRegSim
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


module ShiftRegSim;
    parameter n = 8;
    reg reset = 0;
    reg clock = 0;
    reg load = 0;
    reg [n-1:0] Qin = 8'hFF;
    wire [n-1:0] Qout;
    wire parody;
    
    ShiftReg uut0(reset, clock, load, Qin, Qout);
    ParodyFSM uut1(reset, clock, Qout[0], parody);
    
    initial begin
        #1 clock = 0;
        #1 clock = 1; reset = 1;
        #1 clock = 0;
        #1 clock = 1; reset = 0;
        #1 clock = 0;
        #1 clock = 1; load = 1;
        #1 clock = 0;
        #1 clock = 1; load = 0;
        #1 clock = 0;
        #1 clock = 1;
        #1 clock = 0;
        #1 clock = 1;
        #1 clock = 0;
        #1 clock = 1;
        #1 clock = 0;
        #1 clock = 1;
        #1 clock = 0;
        #1 clock = 1;
        #1 clock = 0;
        #1 clock = 1;
        #1 clock = 0;
        #1 clock = 1;
        #1 clock = 0;
        #1 clock = 1;
        
        
    end
endmodule
