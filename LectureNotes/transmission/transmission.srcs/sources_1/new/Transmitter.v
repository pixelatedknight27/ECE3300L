`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2025 07:12:40 PM
// Design Name: 
// Module Name: Transmitter
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

module Transmitter(reset, clk, Qin, load, out);
    parameter n = 8;
    input reset, clk, load;
    input [n-1:0] Qin;
    output reg out;
    
    wire shift_out;
    ShiftReg u0(reset, clk, load, Qin, shift_out);
    
    wire [2:0] count_out;
    Counter u1(~load, clk, count_out);
    
    wire fsm_out;
    ParodyFSM u2(~load, clk, shift_out, fsm_out);
    
    wire [1:0] mux_in;
    assign  mux_in = {fsm_out, shift_out};
    wire mux_out;
    Mux_2_1 u3(mux_in, &count_out, mux_out);
    
    always @(posedge clk)
    begin
        out <= mux_out;
    end


endmodule
