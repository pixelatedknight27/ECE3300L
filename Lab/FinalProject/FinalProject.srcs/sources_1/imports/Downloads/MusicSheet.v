`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 03:16:21 PM
// Design Name: 
// Module Name: MusicSheet
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


module MusicSheet( input [7:0] number,
output reg [19:0] note,//what is the max frequency
output reg [4:0] duration);
parameter QUARTER = 5'b00010;
parameter HALF = 5'b00100;
parameter ONE = 2* HALF;
parameter TWO = 2* ONE;
parameter FOUR = 2* TWO;
parameter C4=50_000_000 / 262, D4=50_000_000 / 294, E4 = 50_000_000 / 330, F4 = 50_000_000 / 349, G4 = 50_000_000 / 392, C5 = 50_000_000 / 523, SP = 1;
always @ (number[2:0]) begin
case(number) //Row Row Row your boat
0: begin note = C4; duration = FOUR; end //row
1: begin note = D4; duration = FOUR; end //
2: begin note = E4; duration = FOUR; end //row
3: begin note = F4; duration = FOUR; end //
4: begin note = G4; duration = FOUR; end //row
5: begin note = C5; duration = FOUR; end //
6: begin note = D4; duration = FOUR; end //your
default: begin note = C4; duration = FOUR; end
endcase
end
endmodule
