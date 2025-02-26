`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2025 01:37:58 PM
// Design Name: 
// Module Name: gated_D_Latch_sim
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


module gated_D_Latch_sim;

    reg en, d;
    wire q, qn;

    gated_D_Latch d1(d, en, q, qn);
    
    integer i;
    
    initial begin
        
//        for(i = 0; i < 4; i = i + 1)
//        begin
//            #1 en = i[0]; d = i[1];
            
//        end
        
        #1 en = 0; d = 0;
        #1 en = 0; d = 1;
        #1 en = 1; d = 0;
        #1 en = 1; d = 1;
        
    end
    
endmodule
