`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2025 11:28:20 PM
// Design Name: 
// Module Name: adder_subtractor
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

`define n 3

//module adder_subtractor(
//    input [`n:0] X, Y,
//    input Sub,
//    output [`n:0] S,
//    output Cout,
//    output Overflow
//    );
    
//    wire [`n+1:0] carry;
    
//    assign carry[0] = Sub;
    
//    genvar i;
    
//    for(i = 0; i <= `n; i = i + 1)
//    begin
    
//        full_adder stagen(X[i], Y[i] ^ Sub, carry[i], S[i], carry[i+1]);
    
//    end
    
//    assign Cout = carry[`n + 1];
    
//    assign Overflow = Cout ^ carry[`n];
    
//endmodule


module adder_subtractor(carryin, X, Y, S, carryout);
    input carryin;
    input [1:0] X, Y;
    output [1:0] S;
    output carryout;
    wire [1:1] C;
    full_adder stage0 (carryin, X[0], Y[0], S[0], C[1]);
    full_adder stage1 (C[1], X[1], Y[1], S[1], carryout);
endmodule