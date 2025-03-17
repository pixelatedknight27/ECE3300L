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
    
    input set_ctr_enable,
    input set_ctr_reset,
    
    input set_sw,
    input alarm_enable,
    output alarm_enable_out,
    
    output [6:0] Cout,
    output DP,
    output [7:0] AN,
    output reg audio_pwm,
    output reg [2:0] rgb_led0,
    output reg [2:0] rgb_led1
    );

    
    reg [31:0] freq_1HZ = 1;
    reg [31:0] freq_400HZ = 400;
    
    clk_gen clk_1HZ(clk, freq_1HZ, 0, outsignal_1HZ);
    clk_gen clk_400HZ(clk, freq_400HZ, 0, outsignal_400HZ);
    
    wire [31:0] mux_ctr_Q, rgb_ctr_Q, sec_ctr_Q, set_ctr_Q;
    
    upcounter mux_ctr(1, outsignal_400HZ, 1, ~32'd0, mux_ctr_Q);
    upcounter rgb_ctr(1, outsignal_1HZ, 1, ~32'd0, rgb_ctr_Q);
    
    upcounter set_ctr(~set_ctr_reset, outsignal_400HZ, set_ctr_enable, 32'd3600, set_ctr_Q);
    downcounter sec_ctr(~set_sw, outsignal_1HZ, 1, set_ctr_Q, sec_ctr_Q);
    
    wire [6:0] Cout0, Cout1, Cout2, Cout3, Cout4, Cout5, Cout6, Cout7;
    wire DP0, DP1, DP2, DP3, DP4, DP5, DP6, DP7;
    wire [7:0] AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7;
    
    bcd_decoder bcd_d0((sec_ctr_Q % 60) % 10, 3'd0, Cout0, DP0, AN0);
    bcd_decoder bcd_d1((sec_ctr_Q % 60) / 10, 3'd1, Cout1, DP1, AN1);
    bcd_decoder bcd_d2((sec_ctr_Q / 60) % 10, 3'd2, Cout2, DP2, AN2);
    bcd_decoder bcd_d3((sec_ctr_Q / 60) / 10, 3'd3, Cout3, DP3, AN3);
    
    bcd_decoder bcd_d4((set_ctr_Q % 60) % 10, 3'd4, Cout4, DP4, AN4);
    bcd_decoder bcd_d5((set_ctr_Q % 60) / 10, 3'd5, Cout5, DP5, AN5);
    bcd_decoder bcd_d6((set_ctr_Q / 60) % 10, 3'd6, Cout6, DP6, AN6);
    bcd_decoder bcd_d7((set_ctr_Q / 60) / 10, 3'd7, Cout7, DP7, AN7);
    
    mux_8_to_1(
        mux_ctr_Q[2:0],
        AN0, Cout0, DP0,
        AN1, Cout1, DP1,
        AN2, Cout2, DP2,
        AN3, Cout3, DP3,
        AN4, Cout4, DP4,
        AN5, Cout5, DP5,
        AN6, Cout6, DP6,
        AN7, Cout7, DP7,
        AN, Cout, DP
    );
    
    assign alarm_enable_out = alarm_enable;
    
    always @ (sec_ctr_Q, rgb_ctr_Q, outsignal_400HZ)
    begin
        if(sec_ctr_Q == 0 & alarm_enable)
        begin
            audio_pwm = outsignal_400HZ;
            rgb_led0 = rgb_ctr_Q[2:0];
            rgb_led1 = ~rgb_ctr_Q[2:0];
        end
        else
        begin
            audio_pwm = 0;
            rgb_led0 = 3'b0;
            rgb_led1 = 3'b0;
        end
    end
    
endmodule
