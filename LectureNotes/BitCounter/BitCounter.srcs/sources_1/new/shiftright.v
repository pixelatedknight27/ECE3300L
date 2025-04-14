`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025 04:39:40 PM
// Design Name: 
// Module Name: shiftright
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


module shiftright (rst, R, L, E, w, Clock, Q);
    parameter n = 8;
    input [n-1:0] R;
    input rst, L, E, w, Clock;
    output reg [n-1:0] Q;
    integer k;
    always @(posedge Clock, posedge rst)
    begin
        if (rst)
            Q <= 0;
        else if (L)
            Q <= R;
        else if (E)
        begin
            for (k = n-1; k >= 0; k = k-1)
                Q[k] <= Q[k+1];
            Q[n-1] <= w;
        end
    end
endmodule
