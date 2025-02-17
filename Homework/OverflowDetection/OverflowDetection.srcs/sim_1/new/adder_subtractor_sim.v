`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 01:00:46 AM
// Design Name: 
// Module Name: adder_subtractor_sim
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

`define n 7

module adder_subtractor_sim();
    reg [`n:0] X, Y;
    reg Sub;
    wire [`n:0] S;
    wire Cout;
    wire Overflow;
    
    adder_subtractor uut(X, Y, Sub, S, Cout, Overflow);
    
    initial begin
        Sub = 0;
        X = 8'b0;
        Y = 8'b0;
        #1 X = 8'd64; Y = 8'd64;
        #1 X = 8'd127; Y = 8'b11111111;
        #1 X = 8'b10000000; Y = 8'd2;
        #1 X = 8'b11000001; Y = 8'b10111111;
    end
endmodule
