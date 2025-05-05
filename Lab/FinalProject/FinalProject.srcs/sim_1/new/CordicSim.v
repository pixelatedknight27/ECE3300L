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
    reg signed [n-1:0] t_ang = 16'b0;
    reg signed [n-1:0] ang = 0;
    reg signed [n-1:0] x = 16'b0100000000000000;
    reg signed [n-1:0] y = 16'b0000000000000000;
    reg signed [n-1:0] pi_dn = 16'b0101101000000000;
    reg signed [n-1:0] it = 0;
    
    reg signed [n-1:0] xpr;
    reg signed [n-1:0] ypr;
    
    wire signed [n-1:0] angp;
    wire signed [n-1:0] xp;
    wire signed [n-1:0] yp;
    wire signed [n-1:0] pi_dnp;
    wire signed [n-1:0] itp;
    
    CordicN uut(t_ang, ang, x, y, pi_dn, it, angp, xp, yp, pi_dnp, itp);
    
    
    
    integer signed i;
    
    integer mod_pix_x;
    integer xin;
    
    initial begin
        
        for(i = 1; i <= 360; i = i+2)
        begin
            #1;
            
            mod_pix_x = i % 360;
            
            if(mod_pix_x < 90)
            begin
                xin = i % 90;
                xpr = xp;
                ypr = yp;
            end
            else if (mod_pix_x >= 90 && mod_pix_x < 180)
            begin
                xin = 90 - i % 90;
                xpr = -xp;
                ypr = yp;
            end
            else if (mod_pix_x >= 180 && mod_pix_x < 270)
            begin
                xin = i % 90;
                xpr = -xp;
                ypr = -yp;
            end
            else if (mod_pix_x >= 270 && mod_pix_x <= 360)
            begin
                xin = 90 - i % 90;
                xpr = xp;
                ypr = -yp;
            end
            
            t_ang = xin << 8;
            
        end
    end
    
endmodule
