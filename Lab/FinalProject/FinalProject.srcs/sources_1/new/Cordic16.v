`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2025 05:55:28 PM
// Design Name: 
// Module Name: Cordic16
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


module Cordic16(t_ang, ang, x, y, pi_dn, it, angp, xp, yp, pi_dnp, itp);
    parameter n = 16;
    input [n-1:0] t_ang;
    input [n-1:0] ang;
    input [n-1:0] x;
    input [n-1:0] y;
    input [n-1:0] pi_dn;
    input [n-1:0] it;
    
    wire [n-1:0] angp0;
    wire [n-1:0] angp1;
    wire [n-1:0] angp2;
    wire [n-1:0] angp3;
    wire [n-1:0] angp4;
    wire [n-1:0] angp5;
    wire [n-1:0] angp6;
    
    wire [n-1:0] xp0;
    wire [n-1:0] xp1;
    wire [n-1:0] xp2;
    wire [n-1:0] xp3;
    wire [n-1:0] xp4;
    wire [n-1:0] xp5;
    wire [n-1:0] xp6;
    
    wire [n-1:0] yp0;
    wire [n-1:0] yp1;
    wire [n-1:0] yp2;
    wire [n-1:0] yp3;
    wire [n-1:0] yp4;
    wire [n-1:0] yp5;
    wire [n-1:0] yp6;
    
    wire [n-1:0] pi_dnp0;
    wire [n-1:0] pi_dnp1;
    wire [n-1:0] pi_dnp2;
    wire [n-1:0] pi_dnp3;
    wire [n-1:0] pi_dnp4;
    wire [n-1:0] pi_dnp5;
    wire [n-1:0] pi_dnp6;
    
    wire [n-1:0] itp0;
    wire [n-1:0] itp1;
    wire [n-1:0] itp2;
    wire [n-1:0] itp3;
    wire [n-1:0] itp4;
    wire [n-1:0] itp5;
    wire [n-1:0] itp6;
    
    output wire [n-1:0] angp;
    output wire [n-1:0] xp;
    output wire [n-1:0] yp;
    output wire [n-1:0] pi_dnp;
    output wire [n-1:0] itp;
    
    Cordic u0(t_ang, ang, x, y, pi_dn, it, angp0, xp0, yp0, pi_dnp0, itp0);
    Cordic u1(t_ang, angp0, xp0, yp0, pi_dnp0, itp0, angp1, xp1, yp1, pi_dnp1, itp1);
    Cordic u2(t_ang, angp1, xp1, yp1, pi_dnp1, itp1, angp2, xp2, yp2, pi_dnp2, itp2);
    Cordic u3(t_ang, angp2, xp2, yp2, pi_dnp2, itp2, angp3, xp3, yp3, pi_dnp3, itp3);
    Cordic u4(t_ang, angp3, xp3, yp3, pi_dnp3, itp3, angp4, xp4, yp4, pi_dnp4, itp4);
    Cordic u5(t_ang, angp4, xp4, yp4, pi_dnp4, itp4, angp5, xp5, yp5, pi_dnp5, itp5);
    Cordic u6(t_ang, angp5, xp5, yp5, pi_dnp5, itp5, angp6, xp6, yp6, pi_dnp6, itp6);
    Cordic u7(t_ang, angp6, xp6, yp6, pi_dnp6, itp6, angp, xp, yp, pi_dnp, itp);
    
endmodule
