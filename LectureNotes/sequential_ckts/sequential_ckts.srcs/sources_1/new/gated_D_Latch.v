`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2025 01:31:46 PM
// Design Name: 
// Module Name: gated_D_Latch
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


module gated_D_Latch(
    input d,
    input en,
    output reg q, qn
    );
    
    always @ (d, en)
    begin
        if(en)
            q = d;
            qn = ~d;
    end
    
endmodule
