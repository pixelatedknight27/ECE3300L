`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 02:52:53 PM
// Design Name: 
// Module Name: seven_seg_decoder
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


module seven_seg_decoder(data, Cout, DP);
    input [15:0] data;
    output reg [6:0] Cout;
    output DP;
    
    assign DP = 1;
    
    
    always @(data)
        case(data)
        16'b0000000000000001: Cout = 7'b0000001; // 0
        16'b0000000000000010: Cout = 7'b1001111; // 1
        16'b0000000000000100: Cout = 7'b0010010; // 2
        16'b0000000000001000: Cout = 7'b0000110; // 3
        16'b0000000000010000: Cout = 7'b1001100; // 4
        16'b0000000000100000: Cout = 7'b0100100; // 5
        16'b0000000001000000: Cout = 7'b0100000; // 6
        16'b0000000010000000: Cout = 7'b0001111; // 7
        16'b0000000100000000: Cout = 7'b0000000; // 8
        16'b0000001000000000: Cout = 7'b0000100; // 9
        16'b0000010000000000: Cout = 7'b0001000; // a
        16'b0000100000000000: Cout = 7'b1100000; // b
        16'b0001000000000000: Cout = 7'b1110010; // c
        16'b0010000000000000: Cout = 7'b1000010; // d
        16'b0100000000000000: Cout = 7'b0110000; // e
        16'b1000000000000000: Cout = 7'b0111000; // f
        endcase
    
endmodule
