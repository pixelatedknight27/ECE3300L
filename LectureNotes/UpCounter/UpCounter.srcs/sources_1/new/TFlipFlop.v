`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 11:06:22 PM
// Design Name: 
// Module Name: TFlipFlop
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


module TFlipFlop(
    input rst, clk, T, 
    output reg Q, Qn
    );
        
    
    always @ (posedge clk, negedge rst)
    begin
        if(!rst)
        begin
                Q = 0;
                Qn = 1;
        end
        else if(T)
        begin
            Q <= ~Q;
            Qn <= Q;
        end
        
        
    end
endmodule
