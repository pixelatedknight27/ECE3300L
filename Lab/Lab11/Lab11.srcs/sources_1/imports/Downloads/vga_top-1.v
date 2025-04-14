`timescale 1ns / 1ps
module VGA_top(
    input wire clk, reset, reset_clk,
    output wire hsync, vsync,
    output wire [11:0] rgb
    );

   // signal declaration
   wire [9:0] pixel_x, pixel_y;
   wire video_on, pixel_tick;
   reg [11:0] rgb_reg;
   wire [11:0] rgb_next;
   // body
   // instantiate vga sync circuit
   wire clk_50m;
   clk_50m_generator myclk(clk, reset_clk, clk_50m);

//   vga_sync vsync_unit
//      (.clk(clk_50m), .reset(reset), .hsync(hsync), .vsync(vsync),
//       .video_on(video_on), .p_tick(pixel_tick),
//       .pixel_x(pixel_x), .pixel_y(pixel_y));
//   // instantiate graphic generator
//   pong_graph_st pong_grf_unit
//      (.video_on(video_on), .pix_x(pixel_x), .pix_y(pixel_y),
//       .graph_rgb(rgb_next));
       
       vga_test vga_test_unit
          (.clk(clk_50m), .reset(reset), .hsync(hsync), .vsync(vsync),
           .video_on(video_on), .p_tick(pixel_tick),
           .pixel_x(pixel_x), .pixel_y(pixel_y));
       
   // rgb buffer
   always @(posedge clk_50m)
      if (pixel_tick)
        begin
         rgb_reg <= rgb_next;
        end
   // output
  assign rgb = rgb_reg;
endmodule

