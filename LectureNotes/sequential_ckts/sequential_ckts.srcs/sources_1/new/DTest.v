`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 01:41:21 PM
// Design Name: 
// Module Name: DTest
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


module DTest(
    input CLK, D,
    output [2:0] Q, Qn
    );
    
    wire CLKn;
    
    assign CLKn = ~CLK;
    
    gated_D_Latch L2(D, CLK, Q[2], Qn[2]);
    DFlipFlop L1(D, CLK, Q[1], Qn[1]);
    DFlipFlop L0(D, CLKn, Q[0], Qn[0]);
    
endmodule
