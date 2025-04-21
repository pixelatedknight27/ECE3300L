`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2025 01:47:07 PM
// Design Name: 
// Module Name: ShiftReg
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


module ShiftReg(reset, clk, load, Qin, Qout);
    parameter n = 8;
    input reset;
    input clk;
    input load;
    input [n-1:0] Qin;
    output reg [n-1:0] Qout;
    
    always @(posedge reset, posedge clk)
    begin
        if(reset)
        begin
            Qout = 0;
        end
        else if(load)
        begin
            Qout = Qin;
        end
        else
            Qout <= {0,Qout[n-1:1]};
    end
endmodule
