`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2025 01:59:49 PM
// Design Name: 
// Module Name: comparitor_sim
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


module comparitor_sim();

    reg [3:0] A, B;
    wire [2:0] F;
    
    comparator uut(A, B, F[0], F[1], F[2]);
    
    initial begin
        
        #1 A = 4'b0000; B = 4'b0000; // s = 0
        
        #1 A = 4'b0011; B = 4'b0010; // 3, 2
        
        #1 A = 4'b0010; B = 4'b0011; // 2, 3
        
        #1 A = 4'b0011; B = 4'b0011; // 3 3
    
    end
endmodule
