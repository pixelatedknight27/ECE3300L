`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 11:13:32 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input X, Y, Cin,
    output S, Cout
    );
    
    
    assign S = X ^ Y ^ Cin;
    assign Cout = (X & Y) | (X & Cin) | (Y & Cin);
    
endmodule
