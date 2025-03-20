`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2025 11:45:32 PM
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
    input sel, rst, 
    input [2:0] Tin,
    output Q, Qn
    );
    
    TFlipFlop tff(rst, Tin[sel], 1, Q, Qn);
    
endmodule
