`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2025 03:22:32 PM
// Design Name: 
// Module Name: four_to_sixteen_decoder
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


module four_to_sixteen_decoder(data, y);
    input [3:0] data;
    output reg [15:0] y;
    
    always @ (data)
    begin
        y = 0;   	//default all outputs to be inactive
        y[data] =1;  //the selected output is set to be active. 
    end 
endmodule
