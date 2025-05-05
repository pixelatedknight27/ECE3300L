`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 04:59:45 PM
// Design Name: 
// Module Name: Cordic
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


module Cordic(t_ang, ang, x, y, pi_dn, it, angp, xp, yp, pi_dnp, itp);
    parameter n = 16;
    input signed[n-1:0] t_ang;
    input signed [n-1:0] ang;
    input signed [n-1:0] x;
    input signed [n-1:0] y;
    input signed [n-1:0] pi_dn;
    input signed [n-1:0] it;
    
    output reg signed [n-1:0] angp;
    output reg signed [n-1:0] xp;
    output reg signed [n-1:0] yp;
    output reg signed [n-1:0] pi_dnp;
    output reg signed [n-1:0] itp;
    
    reg signed [n-1:0] xn;
    reg signed [n-1:0] yn;
    
    always @ (*)
    begin
        
        pi_dnp <= pi_dn >> 1;
        
        
        
        if(x < 0)
            begin
                xn = (x >> it) | (16'hFFFF << 16-it);
            end
        else
        begin
                xn = x >> it;
        end
        
        if(y < 0)
        begin
                yn = (y >> it) | (16'hFFFF << 16-it);
        end
        else
        begin
                yn = y >> it;
        end
        
        if(ang < t_ang)
        begin
            
            xp <= x - yn;
            yp <= y + xn;
            angp <= ang + pi_dnp;
        end
        else
        begin
            xp <= x + yn;
            yp <= y - xn;
            angp <= ang - pi_dnp;
        end
        
        itp <= it + 1;
    end
endmodule
