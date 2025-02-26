`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2025 02:55:56 PM
// Design Name: 
// Module Name: slowerClkGen
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


module slowerClkGen(
    input clk,
    input resetSW,
    output reg outsignal_0,
    output reg outsignal_1
    );
    
    reg [25:0] counter_0, counter_1;
    always @ (posedge clk)
    begin
        if (resetSW)
        begin
            counter_0=0;
            counter_1=1;
            outsignal_0=0;
            outsignal_1=0;
        end
        else
        begin
            counter_0 = counter_0 +1;
            counter_1 = counter_0 +1;
            if (counter_0 == 50_000_000) //why is this a 0.5 Hz?
                begin
                outsignal_0=~outsignal_0;
                counter_0=0;
            end
            if (counter_1 == 250_000) //why is this a 0.5 Hz?
                begin
                outsignal_1=~outsignal_1;
                counter_1 =0;
            end
        end
    end
endmodule
