`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2025 11:14:26 PM
// Design Name: 
// Module Name: mux_4_to_1
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


module mux_8_to_1(
    
    input [2:0] sel,

    input [7:0] AN0,
    input [6:0] Cout0,
    input DP0,
    
    input [7:0] AN1,
    input [6:0] Cout1,
    input DP1,
    
    input [7:0] AN2,
    input [6:0] Cout2,
    input DP2,
    
    input [7:0] AN3,
    input [6:0] Cout3,
    input DP3,
    
    input [7:0] AN4,
    input [6:0] Cout4,
    input DP4,
    
    input [7:0] AN5,
    input [6:0] Cout5,
    input DP5,
    
    input [7:0] AN6,
    input [6:0] Cout6,
    input DP6,
    
    input [7:0] AN7,
    input [6:0] Cout7,
    input DP7,
    
    output reg [7:0] AN,
    output reg [6:0] Cout,
    output reg DP
    
    );
    
    always @ (sel)
    begin
    
    case(sel)
    
        0:
        begin
            AN = AN0;
            Cout = Cout0;
            DP = DP0;
        end
        
        1:
        begin
            AN = AN1;
            Cout = Cout1;
            DP = DP1;
        end
        
        2:
        begin
            AN = AN2;
            Cout = Cout2;
            DP = DP2;
        end
        
        3:
        begin
            AN = AN3;
            Cout = Cout3;
            DP = DP3;
        end
        4:
        begin
            AN = AN4;
            Cout = Cout4;
            DP = DP4;
        end
        
        5:
        begin
            AN = AN5;
            Cout = Cout5;
            DP = DP5;
        end
        
        6:
        begin
            AN = AN6;
            Cout = Cout6;
            DP = DP6;
        end
        
        7:
        begin
            AN = AN7;
            Cout = Cout7;
            DP = DP7;
        end
    endcase
    
    end
endmodule
