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
    output wire [n-1:0] xp;
    output wire [n-1:0] yp;
    output wire [n-1:0] pi_dnp;
    output wire [n-1:0] itp;
    
    genvar i;
    
    Cordic u0(t_ang, ang, x, y, pi_dn, it, angpn[0], xpn[0], ypn[0], pi_dnpn[0], itpn[0]);
    
    for(i = 0; i < n - 1; i = i+1)
    begin
        Cordic un(t_ang, angpn[i], xpn[i], ypn[i], pi_dnpn[i], itpn[i], angpn[i+1], xpn[i+1], ypn[i+1], pi_dnpn[i+1], itpn[i+1]);
    end
    
    Cordic un(t_ang, angpn[n-1], xpn[n-1], ypn[n-1], pi_dnpn[n-1], itpn[n-1], angp, xp, yp, pi_dnp, itp);
endmodule
