`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 02:00:18 PM
// Design Name: 
// Module Name: DTestSim
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


module DTestSim();

    reg CLK, D;
    wire [2:0] Q, Qn;
    
    DTest UUT(CLK, D, Q, Qn);
    
    initial begin
    
    CLK = 0; D = 0;
    #1 CLK = 0; D = 0;
    #1 CLK = 0; D = 1;
    #1 CLK = 1; D = 1;  
    #1 CLK = 1; D = 0;
    #1 CLK = 1; D = 1;
    #1 CLK = 1; D = 1;
    #1 CLK = 1; D = 0;
    #1 CLK = 1; D = 0;
    #1 CLK = 0; D = 0;
    #1 CLK = 0; D = 1;
    #1 CLK = 0; D = 1;
    #1 CLK = 0; D = 0;
    #1 CLK = 0; D = 1;
    #1 CLK = 0; D = 0;
    #1 CLK = 1; D = 0;
    #1 CLK = 1; D = 1;
    #1 CLK = 1; D = 0;
    #1 CLK = 1; D = 1;
    #1 CLK = 1; D = 1;
    #1 CLK = 0; D = 1;
    #1 CLK = 0; D = 0;
    
    
    
    end

endmodule
