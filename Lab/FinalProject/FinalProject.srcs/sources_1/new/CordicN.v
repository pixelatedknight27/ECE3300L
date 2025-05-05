`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2025 01:38:55 PM
// Design Name: 
// Module Name: CordicN
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


module CordicN(t_ang, ang, x, y, pi_dn, it, angp, xp, yp, pi_dnp, itp);
    
    parameter n = 16;
    parameter m = 16;
    input [n-1:0] t_ang;
    input [n-1:0] ang;
    input [n-1:0] x;
    input [n-1:0] y;
    input [n-1:0] pi_dn;
    input [n-1:0] it;
    
    wire [n-1:0] angpn [n-1:0];
    wire [n-1:0] xpn [n-1:0];
    wire [n-1:0] ypn [n-1:0];
    wire [n-1:0] pi_dnpn [n-1:0];
    wire [n-1:0] itpn [n-1:0];
    
    output wire [n-1:0] angp;
    output reg [n-1:0] xp;
    output reg [n-1:0] yp;
    output wire [n-1:0] pi_dnp;
    output wire [n-1:0] itp;
    
    genvar i;
    
    Cordic u0(t_ang, ang, x, y, pi_dn, it, angpn[0], xpn[0], ypn[0], pi_dnpn[0], itpn[0]);
    
    wire [n-1:0] xn, yn;
    reg [n-1:0] x1, y1;
    
    for(i = 0; i < m - 1; i = i+1)
    begin
        Cordic un(t_ang, angpn[i], xpn[i], ypn[i], pi_dnpn[i], itpn[i], angpn[i+1], xpn[i+1], ypn[i+1], pi_dnpn[i+1], itpn[i+1]);
    end
    
    Cordic un(t_ang, angpn[m-1], xpn[m-1], ypn[m-1], pi_dnpn[m-1], itpn[m-1], angp, xn, yn, pi_dnp, itp);
    
//    reg [n-1:0] = 0.607253;

//    real x_scale = 0.5249935913868239;
//    real y_scale = 0.6165656869755014;
    
    integer x_scale = 1;
    integer y_scale = 1;
    
    always @ (*)
    begin
        x1 = xn;
        xp = x1;
        xp = xp + 16'b0001001000001111;
        if(xp[n-1])
        begin
            xp = xp * -1;
            xp = xp * x_scale;
            xp = xp * -1;
        end
        else 
        begin
            xp = xp * x_scale;
        end
        y1 = yn;
        yp = y1;
        if(yp[n-1])
        begin
            yp = yp * -1;
            yp = yp * y_scale;
            yp = yp * -1;
        end
        else 
        begin
            yp = yp * y_scale;
        end
    end
    
endmodule
