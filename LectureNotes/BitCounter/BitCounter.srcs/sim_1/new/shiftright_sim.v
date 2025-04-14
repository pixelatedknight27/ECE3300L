`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025 04:52:04 PM
// Design Name: 
// Module Name: shiftright_sim
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


module shiftright_sim;
    parameter n = 8;
    
    reg [n-1:0] R = 8'd5;
    reg L = 0, E = 0, w = 0, Clock = 0;
    
    wire [n-1:0] Q;
    
    shiftright uut(R, L, E, w, Clock, Q);
    
    initial begin
        #1 Clock = 0; 
        #1 Clock = 1; L = 1;
        #1 Clock = 0;
        #1 Clock = 1; L = 0; E = 1;
        #1 Clock = 0;
        #1 Clock = 1;
        #1 Clock = 0;
        #1 Clock = 1;
    end

endmodule
