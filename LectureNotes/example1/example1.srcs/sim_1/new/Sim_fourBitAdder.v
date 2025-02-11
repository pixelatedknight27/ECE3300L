`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2025 01:16:14 PM
// Design Name: 
// Module Name: Sim_fourBitAdder
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


module Sim_fourBitAdder;
    reg [3:0] x, y;
    wire [3:0] S;
    wire Cout;
    adder_4bit uut(x, y, S, Cout);
    
    initial
    begin
    x = 4'b0;y = 4'b0;
    
    for(integer k = 0; k <= 15; k = k+1)
        begin
        
        #1 x = k;
        
        for(integer j = 0; j <= 15; j = j+1)
            begin 
                
            #1 y = j;
                
            end
        end
    
    end
    
endmodule
