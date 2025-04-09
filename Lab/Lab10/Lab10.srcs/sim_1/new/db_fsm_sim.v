`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2025 04:49:19 AM
// Design Name: 
// Module Name: db_fsm_sim
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


module db_fsm_sim();

    reg clk, reset, level;
    wire db;
    
    db_fsm uut(clk, reset, level, db);
    
    initial begin
    clk = 0; level = 0; reset = 0;
    #1 reset = 1;
    #1 reset = 0;
    
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 1;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 1;
    #1 clk = 1; level = 0;
    #1 clk = 0; level = 0;
    #1 clk = 1; level = 0;
    end
    
endmodule
