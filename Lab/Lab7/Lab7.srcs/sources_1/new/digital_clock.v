`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2025 05:34:01 PM
// Design Name: 
// Module Name: digital_clock
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


module digital_clock(
    input clk,
    input clk_1HZ_reset, 
    input clk_400HZ_reset, 
    
    input ctr0_enable,
    input ctr0_reset,
    
    input ctr1_enable,
    input ctr1_reset,
    
    output [6:0] Cout,
    output DP,
    output [7:0] AN
    );
    
    wire outsignal_1HZ;
    wire outsignal_400HZ;
    
    reg [31:0] freq_1HZ = 1;
    reg [31:0] freq_400HZ = 400;
    
    clk_gen clk_1HZ(clk, freq_1HZ, clk_1HZ_reset, outsignal_1HZ);
    clk_gen clk_400HZ(clk, freq_400HZ, clk_400HZ_reset, outsignal_400HZ);
    
    wire [31:0] Q, Q0, Q1, Q2, Q3;
    wire [3:0] carry;
   
    wire ctr0_out;
    
    upcounter ctr_mux(ctr1_reset, outsignal_400HZ, ctr1_enable, 32'd4, Q, ctr0_out);
    
    upcounter ctr0(ctr0_reset, outsignal_1HZ, ctr0_enable, 32'd9, Q0, carry[0]);
    upcounter ctr1(ctr0_reset, carry[0], ctr0_enable, 32'd5, Q1, carry[1]);
    upcounter ctr2(ctr0_reset, carry[1], ctr0_enable, 32'd9, Q2, carry[2]);
    upcounter ctr3(ctr0_reset, carry[2], ctr0_enable, 32'd5, Q3, carry[3]);
    
    wire [6:0] Cout0, Cout1, Cout2, Cout3;
    wire DP0, DP1, DP2, DP3;
    wire [7:0] AN0, AN1, AN2, AN3;
    
    bcd_decoder bcd_d0(Q0, 3'd0, Cout0, DP0, AN0);
    bcd_decoder bcd_d1(Q1, 3'd1, Cout1, DP1, AN1);
    bcd_decoder bcd_d2(Q2, 3'd2, Cout2, DP2, AN2);
    bcd_decoder bcd_d3(Q3, 3'd3, Cout3, DP3, AN3);
    
    mux_4_to_1(
        Q[1:0],
        AN0, Cout0, DP0,
        AN1, Cout1, DP1,
        AN2, Cout2, DP2,
        AN3, Cout3, DP3,
        AN, Cout, DP
    );
    
    
endmodule
