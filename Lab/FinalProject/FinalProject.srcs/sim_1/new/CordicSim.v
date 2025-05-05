`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 05:31:22 PM
// Design Name: 
// Module Name: CordicSim
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


module CordicSim;
    parameter n = 16;
    reg signed [n-1:0] t_ang = 16'b1010011000000000;
    reg signed [n-1:0] ang = 0;
    reg signed [n-1:0] x = 16'b0100000000000000;
    reg signed [n-1:0] y = 16'b0000000000000000;
    reg signed [n-1:0] pi_dn = 16'b0101101000000000;
    reg signed [n-1:0] it = 0;
    
    wire signed [n-1:0] angp;
    wire signed [n-1:0] xp;
    wire signed [n-1:0] yp;
    wire signed [n-1:0] pi_dnp;
    wire signed [n-1:0] itp;
    
    CordicN uut(t_ang, ang, x, y, pi_dn, it, angp, xp, yp, pi_dnp, itp);
    
    integer signed i;
    initial begin
        for(i = -90; i < 90; i = i+1)
        begin
            #1 t_ang = i << 8;
        end
    end
    
endmodule
