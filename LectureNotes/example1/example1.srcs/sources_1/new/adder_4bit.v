`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2025 03:13:36 PM
// Design Name: 
// Module Name: adder_4bit
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


module adder_4bit(x, y, S, Cout);
	input [3:0] x, y;
	output [3:0] S;
	output Cout;
	wire [3:1] C;
	
	full_adder stage0 (1'b0, x[0], y[0], S[0], C[1]);
	full_adder stage1 (C[1], x[1], y[1], S[1], C[2]);
	full_adder stage2 (C[2], x[2], y[2], S[2], C[3]);
	full_adder stage3 (C[3], x[3], y[3], S[3], Cout);


endmodule
