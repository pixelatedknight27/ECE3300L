`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 02:49:35 PM
// Design Name: 
// Module Name: edge_detect_moore
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


module edge_detect_moore (input wire clk, reset, level, output reg tick);
    localparam [1:0] zero=2'b00, edg=2'b01, one=2'b10;
    reg [1:0] state_reg, state_next;
    always @(posedge clk, posedge reset)
    if (reset)
        state_reg<=zero;
    else
        state_reg<=state_next;

    always@*
    begin
        state_next=state_reg;
        tick=1'b0;
        case (state_reg)
            zero:
            if (level)
                state_next=edg;
            edg:
            begin
                tick=1'b1; //Moore
                if (level)
                    state_next=one;
                else
                    state_next=zero;
            end
            one:
            if (~level)
                state_next=zero;
            default:
            state_next=zero;

        endcase
    end
endmodule
