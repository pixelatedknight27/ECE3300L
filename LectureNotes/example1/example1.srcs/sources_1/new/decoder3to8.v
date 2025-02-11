`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2025 01:29:29 PM
// Design Name: 
// Module Name: decoder3to8
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


module decoder3to8(data, y);
    input [2:0] data;
    output reg [7:0] y;
always @ (data)
begin
	y = 0;   	//default all outputs to be inactive
	y[data] =1;  //the selected output is set to be active. 
end 
endmodule
