`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2025 01:17:24 PM
// Design Name: 
// Module Name: mux4to1
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


module mux4to1(W, S, F);
    input[4:0] W;
    input[1:0] S;
    output reg F;
    
    always @(W,S)
        case(S)
            0: F = W[0];
            1: F = W[1];
            2: F = W[2];
            3: F = W[3];
        endcase
endmodule
