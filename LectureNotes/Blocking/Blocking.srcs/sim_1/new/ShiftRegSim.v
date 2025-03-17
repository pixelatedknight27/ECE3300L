`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 01:53:36 PM
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


module ShiftRegSim();

    reg load, w, Clock;
    wire [3:0] Q;
    
    ShiftReg uut(Clock, load, w, Q);
    
    initial begin
    
    #1 Clock = 0; load = 0; w = 0;
    #1 Clock = 1; load = 0; w = 1;
    #1 Clock = 0; load = 1; w = 0;
    #1 Clock = 1; load = 0; w = 0;
    #1 Clock = 0; load = 1; w = 0;
    #1 Clock = 1; load = 0; w = 0;
    #1 Clock = 0; load = 1; w = 1;
    #1 Clock = 1; load = 0; w = 1;
    #1 Clock = 0; load = 1; w = 0;
    #1 Clock = 1; load = 1; w = 1;
    #1 Clock = 0; load = 1; w = 1;
    #1 Clock = 1; load = 0; w = 0;
    #1 Clock = 0; load = 1; w = 0;
    #1 Clock = 1; load = 0; w = 0;
    
    end

endmodule
