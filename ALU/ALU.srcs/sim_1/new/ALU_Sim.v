`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 01:15:52 PM
// Design Name: 
// Module Name: ALU_Sim
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


module ALU_Sim;
    reg [2:0] S;
    reg [3:0] A, B;
    wire [3:0] F;
    
    ALU uut(.S(S), .A(A), .B(B), .F(F));
    
    initial begin
        
        #1 S = 3'b000; A = 4'b0000; B = 4'b0000; // s = 0
        
        #1 S = 3'b011; A = 4'b0011; B = 4'b0010; // 3 + 2
        
        #1 S = 3'b010; A = 4'b0011; B = 4'b0010; // 3 - 2
        
        #1 S = 3'b100; A = 4'b0011; B = 4'b0010; // 2 ^ 3
    
    end

endmodule
