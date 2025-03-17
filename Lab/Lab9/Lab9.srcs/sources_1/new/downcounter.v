`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 03:40:56 AM
// Design Name: 
// Module Name: downcounter
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

module downcounter (Resetn, Clock, E, set_num, Q);
    input Resetn, Clock, E;
    input [31:0] set_num;
    output reg [31:0] Q;
    
    always @(posedge Clock)
    begin
        if (!Resetn)
            begin
                Q = set_num;
            end
            else if (E & Q > 0)
            begin
                Q <= Q - 1;
           end
    end
    
endmodule
