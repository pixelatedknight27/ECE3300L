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
    input wire clk100, reset, btnu, btnd,
    input playSound,
    output wire hsync, vsync,
    output wire [2:0] rgb,
    output reg audioOut,
    output wire aud_sd
);

    // signal declaration
    wire [9:0] pixel_x, pixel_y;
    wire video_on, pixel_tick;
    reg [2:0] rgb_reg;
    wire [2:0] rgb_next;
    
    wire clk_p5;
    reg [7:0] scale;
    
    clk_50m_generator clk0(clk100, reset, clk);
    slowerClkGen(clk100, reset, clk_p5);
    
    // body
    // instantiate vga sync circuit
    vga_sync vsync_unit
    (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
        .video_on(video_on), .p_tick(pixel_tick),
        .pixel_x(pixel_x), .pixel_y(pixel_y));
    // instantiate graphic generator
    CordicAnim CordicAnim_unit
    (.video_on(video_on), .pix_x(pixel_x), .pix_y(pixel_y),
        .scale(scale), .graph_rgb(rgb_next));
    // rgb buffer
    always @(posedge clk)
    begin
        if (pixel_tick)
            rgb_reg <= rgb_next;
            // output
    end
    
    always @(posedge clk_p5, posedge reset)
    begin
        if(reset)
            scale = 1;
        else if(btnu)
            scale = scale + 1;
        else if(btnd)
            scale = scale - 1;
        end
    assign rgb = rgb_reg;
    
    // music
    reg [19:0] counter;
    reg [31:0] time1, noteTime;
    reg [9:0] msec, number; //millisecond counter, and sequence number of musical note.
    wire [4:0] note, duration;
    wire [19:0] notePeriod;
    parameter clockFrequency = 100_000_000;
    assign aud_sd = 1'b1;
    
    MusicSheet mysong(scale, notePeriod, duration );
    
    always @ (posedge clk100)
    begin
        if(reset | ~playSound)
        begin
            counter <=0;
            time1<=0;
            number <=0;
            audioOut <=1;
        end
        else
        begin
            counter <= counter + 1;
            time1<= time1+1;
        if( counter >= notePeriod)
        begin
            counter <=0;
            audioOut <= ~audioOut ;
        end //toggle audio output
        if( time1 >= noteTime)
        begin
            time1 <=0;
            number <= number + 1;
        end //play next note
        if(number == 48) number <=0; // Make the number reset at the end of the song
        end
    end
    
    always @(duration)
        noteTime = duration * (clockFrequency/8);
    //number of FPGA clock periods in one note.
    
endmodule
