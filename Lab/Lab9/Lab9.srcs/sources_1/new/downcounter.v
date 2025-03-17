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

module downcounter (Resetn, Set, Clock0, Clock1, E, max, Q);
    input Resetn, Set, Clock0, Clock1, E;
    input [31:0] max;
    output reg [31:0] Q;
    
    reg clk_in;
    
    always @ (*)
    begin
        case(Set)
            0: clk_in = Clock0;
            1: clk_in = Clock1;
        endcase
    end
    
    always @(posedge clk_in)
    begin
        if(!Set)
        begin
            if (!Resetn)
            begin
                Q <= 0;
            end
            else if (E & Q > 0)
            begin
                Q <= Q - 1;
           end
        end
        else
        begin
            if(Q == max)
            begin
                Q <= 0;
            end
            else
            begin
                Q <= Q + 1;
            end
        end
    end
    
endmodule
