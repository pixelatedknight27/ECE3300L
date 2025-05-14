`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2025 11:45:53 AM
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


module slowerClkGen(clk, resetSW, outsignal);
    input clk;
    input resetSW;
    output outsignal;
    reg [26:0] counter;
    reg outsignal;
    always @ (posedge clk)
    begin
        if (resetSW)
        begin
            counter=0;
            outsignal=0;
        end
        else
        begin
            counter = counter +1;
            if (counter == 100_000_000) //why is this a 0.5 Hz?
            begin
                outsignal=~outsignal;
                counter =0;
            end
        end
    end
endmodule
