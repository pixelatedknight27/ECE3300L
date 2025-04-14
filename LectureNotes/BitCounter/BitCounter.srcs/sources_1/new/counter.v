`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025 05:21:19 PM
// Design Name: 
// Module Name: counter
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


module counter(rst, L, E, Clock, Q);
    parameter n = 4;
    input rst;
    input L, E, Clock;
    output reg [$clog2(n)-1:0] Q;
    integer k;
    always @(posedge Clock, posedge rst)
    begin
        if (rst)
            Q <= 0;
        else if (E)
        begin
            if(L)
                Q <= Q+1;
        end
    end
endmodule
