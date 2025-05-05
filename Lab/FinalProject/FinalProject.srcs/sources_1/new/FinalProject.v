`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2025 02:12:18 AM
// Design Name: 
// Module Name: FinalProject
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


module FinalProject(
    input wire clk100, reset,
    output wire hsync, vsync,
    output wire [2:0] rgb
);

    // signal declaration
    wire [9:0] pixel_x, pixel_y;
    wire video_on, pixel_tick;
    reg [2:0] rgb_reg;
    wire [2:0] rgb_next;
    
    clk_50m_generator clk0(clk100, reset, clk);
    
    // body
    // instantiate vga sync circuit
    vga_sync vsync_unit
    (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
        .video_on(video_on), .p_tick(pixel_tick),
        .pixel_x(pixel_x), .pixel_y(pixel_y));
    // instantiate graphic generator
    CordicAnim CordicAnim_unit
    (.video_on(video_on), .pix_x(pixel_x), .pix_y(pixel_y),
        .graph_rgb(rgb_next));
    // rgb buffer
    always @(posedge clk)
    if (pixel_tick)
        rgb_reg <= rgb_next;
        // output
    assign rgb = rgb_reg;
endmodule
