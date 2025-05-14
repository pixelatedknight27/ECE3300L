`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2025 02:23:07 AM
// Design Name: 
// Module Name: CordicAnim
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


module CordicAnim(
    input wire video_on,
    input wire [9:0] pix_x, pix_y,
    input wire [7:0] scale,
    output reg [2:0] graph_rgb
);

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

    reg [9:0] mod_pix_x;
    reg [9:0] xin;

    reg signed [n-1:0] xpr, xpr1, xpr2;
    reg signed [n-1:0] ypr;

    integer i;

    always @(*)
    begin

        i = pix_x * 2 * scale;

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


    CordicN uut(t_ang, ang, x, y, pi_dn, it, angp, xp, yp, pi_dnp, itp);

    always @*
    if (~video_on)
        graph_rgb = 3'b000; // blank
    else
    begin
        if(xpr[16])
            begin
                xpr1 = 200 - (xpr >> 8);
            end
        else
        begin
                xpr1 = 200 + (xpr >> 8);
        end
        if ((pix_y > xpr1) && (pix_y < xpr1 + 5))
            graph_rgb = 3'b010;
        else
            graph_rgb = 3'b000; // yellow background
    end
endmodule
