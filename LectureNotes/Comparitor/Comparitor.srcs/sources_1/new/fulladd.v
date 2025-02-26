`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2025 01:55:56 PM
// Design Name: 
// Module Name: fulladd
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


module fulladd (Cin, x, y, s, Cout);

  input Cin, x, y;

  output s, Cout;

  assign s = x ^ y ^ Cin,

       Cout = (x & y) | (x & Cin) | (y & Cin);

endmodule  
