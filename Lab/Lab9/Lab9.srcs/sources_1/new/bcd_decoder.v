`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2025 06:34:31 PM
// Design Name: 
// Module Name: bcd_decoder
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


module bcd_decoder(
    input [3:0] data,
    input [2:0] AN_sel,
    output reg [6:0] Cout,
    output DP,
    output reg [7:0] AN
    );
    
    assign DP = 1;
    
    always @(data, AN_sel)
    begin
        case(data)
        0: Cout = 7'b0000001;
        1: Cout = 7'b1001111;
        2: Cout = 7'b0010010;
        3: Cout = 7'b0000110;
        4: Cout = 7'b1001100;
        5: Cout = 7'b0100100;
        6: Cout = 7'b0100000;
        7: Cout = 7'b0001111;
        8: Cout = 7'b0000000;
        9: Cout = 7'b0000100;
        10: Cout = 7'b0001000;
        11: Cout = 7'b1100000;
        12: Cout = 7'b1110010;
        13: Cout = 7'b1000010;
        14: Cout = 7'b0110000;
        15: Cout = 7'b0111000;
        endcase
        
        AN = 8'hff; 
        
        AN[AN_sel] = 0;
    end
        
endmodule
