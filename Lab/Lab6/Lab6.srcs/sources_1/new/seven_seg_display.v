`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 03:23:26 PM
// Design Name: 
// Module Name: seven_seg_display
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


module seven_seg_display(
    input clkin,
    input resetCLK, resetCTR, enable,
    output [6:0] Cout, 
    output DP, 
    output [7:0] AN);
    
    wire [15:0] AN_CTRL, seven_seg_in;
    wire clkout_0_5hz, clkout_400hz;
    reg [3:0] ctr_out_reg, num_off;
    wire [3:0] ctr_out;
    
    wire [3:0] dcdr_in;
    
    
    
    slowerClkGen clk(clkin, resetCLK, clkout_0_5hz, clkout_400hz);
    upcounter ctr0(resetCTR, clkout_400hz, enable, ctr_out);
    four_to_sixteen_decoder d1(dcdr_in, AN_CTRL);
    four_to_sixteen_decoder d2(num_off, seven_seg_in);
    seven_seg_decoder d3(seven_seg_in, Cout, DP);
    
    always @(clkout_0_5hz)
    begin
        
        ctr_out_reg = ctr_out;
    
        if(clkout_0_5hz)
        begin
            num_off = ctr_out_reg[1:0]+5;
        end
        else
        begin
            num_off = ctr_out_reg[1:0]+1;
        end
    end
    
    assign dcdr_in[3:2] = 0;
    
    assign dcdr_in[1:0] = ctr_out_reg[1:0];
    
    assign AN[7:4] = 4'b1111;
    assign AN[3:0] = ~AN_CTRL[3:0];
    
endmodule
