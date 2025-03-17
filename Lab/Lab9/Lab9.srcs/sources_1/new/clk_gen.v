`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2025 05:15:20 PM
// Design Name: 
// Module Name: clk_gen
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


module clk_gen(
    input clk,
    input [31:0] freq,
    input reset,
    output outsignal
    );
    
    reg outsignal;
    
    reg [31:0] counter;
    
    always @ (posedge clk)
    begin
        if (reset)
        begin
            counter=0;
            outsignal=0;
        end
        else
        begin
            counter = counter +1;
            if (counter == 100_000_000/ (2 * freq)) //why is this a 0.5 Hz?
            begin
                outsignal=~outsignal;
                counter =0;
            end
        end
    end
    
    
    
    
endmodule
