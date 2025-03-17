`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2025 01:39:03 PM
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

module ShiftReg(clock, load, w, Q);
    input load;
    input w;
    input clock; 
    output reg[3:0]Q;
    
    wire [3:0] wp;
    
    assign wp[0] = w;
    assign wp[3:1] = 0;
    
    always @ (*)
    begin
        
    end
    
    always@(posedge clock)
        begin

        if (load)
            Q<=4'b1111;
        else
            begin
            Q<=Q<<1 | wp; 
        end 
    end
endmodule