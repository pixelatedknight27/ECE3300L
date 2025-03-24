`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/19/2025 01:12:15 PM
// Design Name: 
// Module Name: CounterStage
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


module CounterStage(
    input rst,
    input enable,
    input clk,
    input load,
    input [3:0] data,
    output reg [3:0] Q
    );
    
    always @(posedge clk, negedge rst)
    begin
    
        if(enable)
        begin
        
            if(!rst)
                Q <= 0;
            else if (load)
                Q <= data;
            else
                Q <= Q+1;
                
        end
        
    end
endmodule
