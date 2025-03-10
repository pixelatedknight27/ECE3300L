`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2025 01:35:23 PM
// Design Name: 
// Module Name: muxdff
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


module muxdff (D0, D1, Sel, Clock, Q);

  input D0, D1, Sel, Clock;

  output reg Q;

  wire D;

  assign D = Sel ? D1 : D0;

  always @(posedge Clock)

        Q = D;

endmodule
