`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 03:03:18 PM
// Design Name: 
// Module Name: upcounter
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


module upcounter (Resetn, Clock, E, Q);
    input Resetn, Clock, E;
    output reg [3:0] Q;
    
    always @(negedge Resetn, posedge Clock)
        if (!Resetn)
        Q <= 0;
        else if (E)
        Q <= Q + 1;
endmodule
