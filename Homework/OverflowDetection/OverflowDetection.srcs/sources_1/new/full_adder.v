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
    
    wire w0, w1, w2;
    
    half_adder stage0(Cin, X, w0, w1);
    half_adder stage1(w0, Y, S, w2);
    
    assign Cout = w1 | w2;
    
endmodule
