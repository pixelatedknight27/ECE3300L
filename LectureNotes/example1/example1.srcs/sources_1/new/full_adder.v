`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2025 02:59:28 PM
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


module full_adder(x, y, Cin, s, Cout);
    input x, y, Cin;
    output s, Cout;
    
	assign s = x ^ y ^ Cin;
	assign Cout = (x & y) | (x & Cin) | (y & Cin);
		    
endmodule 
