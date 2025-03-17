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
    
    input set,
    
    output [6:0] Cout,
    output DP,
    output [7:0] AN,
    output outsignal_1HZ,
    output outsignal_400HZ,
    output reg audio_pwm,
    output reg [2:0] rgb_led
    );

    
    reg [31:0] freq_1HZ = 1;
    reg [31:0] freq_400HZ = 400;
    
    clk_gen clk_1HZ(clk, freq_1HZ, clk_1HZ_reset, outsignal_1HZ);
    clk_gen clk_400HZ(clk, freq_400HZ, clk_400HZ_reset, outsignal_400HZ);
    
    wire [31:0] Q, Q0, Q1, Q2, Q3;
    
    upcounter ctr_mux(ctr1_reset, outsignal_400HZ, ctr1_enable, ~32'd0, Q);
    upcounter ctr1(ctr1_reset, outsignal_1HZ, ctr1_enable, ~32'd0, Q1);
    
    downcounter ctr0(ctr0_reset, set, outsignal_1HZ, outsignal_400HZ, ctr0_enable, 32'd3600, Q0);
    
    wire [6:0] Cout0, Cout1, Cout2, Cout3;
    wire DP0, DP1, DP2, DP3;
    wire [7:0] AN0, AN1, AN2, AN3;
    
    bcd_decoder bcd_d0((Q0 % 60) % 10, 3'd0, Cout0, DP0, AN0);
    bcd_decoder bcd_d1((Q0 % 60) / 10, 3'd1, Cout1, DP1, AN1);
    bcd_decoder bcd_d2((Q0 / 60) % 10, 3'd2, Cout2, DP2, AN2);
    bcd_decoder bcd_d3((Q0 / 60) / 10, 3'd3, Cout3, DP3, AN3);
    
    mux_4_to_1(
        Q[1:0],
        AN0, Cout0, DP0,
        AN1, Cout1, DP1,
        AN2, Cout2, DP2,
        AN3, Cout3, DP3,
        AN, Cout, DP
    );
    
    always @ (Q0, Q1, outsignal_400HZ)
    begin
        if(Q0 == 0)
        begin
            audio_pwm = outsignal_400HZ;
            rgb_led = Q1[2:0];
        end
        else
        begin
            audio_pwm = 0;
            rgb_led = 3'b0;
        end
        
        
    end
    
    
endmodule
