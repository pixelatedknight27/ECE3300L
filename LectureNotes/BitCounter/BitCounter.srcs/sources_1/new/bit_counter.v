`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025 05:30:58 PM
// Design Name: 
// Module Name: bit_counter
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


module bit_counter(rst, Clock, Qin, Load, Enable, Qout, Done, Slow_Clock);
    parameter n = 8;
    input rst, Clock, Load, Enable;
    input [n-1:0] Qin;
    output [$clog2(n) - 1:0] Qout;
    output reg Done;
    output Slow_Clock;
    
    slowerClkGen u0(Clock, resetSW, Slow_Clock);
    
    wire [n-1:0] Qshift;
    shiftright u1(rst, Qin, Load, Enable & ~Done, 0, Slow_Clock, Qshift);
    counter u2(rst, Qshift[0], Enable & ~Done, Slow_Clock, Qout);
    
    always @ (posedge rst, posedge Clock)
    begin
        if(rst)
            Done <= 0;
        else if(~|Qshift)
            Done <= 1;
        else
            Done <= 0;
    end
endmodule
