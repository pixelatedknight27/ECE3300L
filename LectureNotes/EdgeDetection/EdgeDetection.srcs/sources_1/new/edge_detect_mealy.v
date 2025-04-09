`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 02:55:33 PM
// Design Name: 
// Module Name: edge_detect_mealy
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


module edge_detect_mealy (input wire clk, reset, level, output reg tick);
    localparam [1:0] zero=1'b0, one=1'b1;
    reg state_reg, state_next;
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
            begin
                tick=1'b1; //this change is immediate
                state_next=one;
            end
            one:
            if (~level)
                state_next=zero;
            default:
            state_next=zero;
        endcase
    end
endmodule	

