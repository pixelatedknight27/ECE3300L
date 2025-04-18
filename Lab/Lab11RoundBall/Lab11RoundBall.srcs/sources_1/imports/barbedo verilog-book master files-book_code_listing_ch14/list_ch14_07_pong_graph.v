// Listing 14.7
module pong_graph 
   (
    input wire clk, reset,
    input wire [1:0] btn,
    input wire [9:0] pix_x, pix_y,
    input wire gra_still,
    output wire graph_on,
    output reg hit, miss,
    output reg [2:0] graph_rgb
   );

   // costant and signal declaration
   // x, y coordinates (0,0) to (639,479)
   localparam MAX_X = 640;
   localparam MAX_Y = 480;
   wire refr_tick;
   //--------------------------------------------
   // vertical strip as a wall
   //--------------------------------------------
   // wall top,bottom boundary
   localparam WALL_Y_T = 32;
   localparam WALL_Y_B = 35;
   //--------------------------------------------
   // right vertical bar
   //--------------------------------------------
   // bar top, bottom boundary
   localparam BAR_Y_T = 446;
   localparam BAR_Y_B = 449;
   // bar left, right boundary
   wire [9:0] bar_x_l, bar_x_r;
   localparam BAR_X_SIZE = 72;
   // register to track top boundary  (x position is fixed)
   reg [9:0] bar_x_reg, bar_x_next;
   // bar moving velocity when the button are pressed
   localparam BAR_V = 4;
   //--------------------------------------------
   // square ball
   //--------------------------------------------
   localparam BALL_SIZE = 8;
   // ball left, right boundary
   wire [9:0] ball_x_l, ball_x_r;
   // ball top, bottom boundary
   wire [9:0] ball_y_t, ball_y_b;
   // reg to track left, top position
   reg [9:0] ball_x_reg, ball_y_reg;
   wire [9:0] ball_x_next, ball_y_next;
   // reg to track ball speed
   reg [9:0] x_delta_reg, x_delta_next;
   reg [9:0] y_delta_reg, y_delta_next;
   // ball velocity can be pos or neg)
   localparam BALL_V_P = 2;
   localparam BALL_V_N = -2;
   //--------------------------------------------
   // round ball 
   //--------------------------------------------
   wire [2:0] rom_addr, rom_col;
   reg [7:0] rom_data;
   wire rom_bit;
   //--------------------------------------------
   // object output signals
   //--------------------------------------------
   wire wall_on, bar_on, sq_ball_on, rd_ball_on;
   wire [2:0] wall_rgb, bar_rgb, ball_rgb;
  
   // body 
   //--------------------------------------------
   // round ball image ROM
   //--------------------------------------------
   always @*
   case (rom_addr)
      3'h0: rom_data = 8'b00010000; //   ****
      3'h1: rom_data = 8'b00111000; //  ******
      3'h2: rom_data = 8'b00111000; // ********
      3'h3: rom_data = 8'b11111110; // ********
      3'h4: rom_data = 8'b00111000; // ********
      3'h5: rom_data = 8'b01101100; // ********
      3'h6: rom_data = 8'b11000110; //  ******
      3'h7: rom_data = 8'b10000010; //   ****
   endcase
   
   // registers
   always @(posedge clk, posedge reset)
      if (reset)
         begin
            bar_x_reg <= 0;
            ball_x_reg <= 0;
            ball_y_reg <= 0;
            x_delta_reg <= 10'h004;
            y_delta_reg <= 10'h004;
         end   
      else
         begin
            bar_x_reg <= bar_x_next;
            ball_x_reg <= ball_x_next;
            ball_y_reg <= ball_y_next;
            x_delta_reg <= x_delta_next;
            y_delta_reg <= y_delta_next;
         end   

   // refr_tick: 1-clock tick asserted at start of v-sync
   //       i.e., when the screen is refreshed (60 Hz)
   assign refr_tick = (pix_y==481) && (pix_x==0);
   
   //--------------------------------------------
   // (wall) left vertical strip
   //--------------------------------------------
   // pixel within wall
   assign wall_on = (WALL_Y_T<=pix_y) && (pix_y<=WALL_Y_B);
   // wall rgb output
   assign wall_rgb = 3'b001; // blue

   //--------------------------------------------
   // right vertical bar
   //--------------------------------------------
   // boundary
   assign bar_x_l = bar_x_reg;
   assign bar_x_r = bar_x_l + BAR_X_SIZE - 1;
   // pixel within bar
   assign bar_on = (BAR_Y_T<=pix_y) && (pix_y<=BAR_Y_B) &&
                   (bar_x_l<=pix_x) && (pix_x<=bar_x_r); 
   // bar rgb output
   assign bar_rgb = 3'b010; // green
   // new bar y-position
   always @*
   begin
      bar_x_next = bar_x_reg; // no move
      if (gra_still) // initial position of paddle
         bar_x_next = (MAX_X-BAR_X_SIZE)/2;
      else if (refr_tick)
         if (btn[1] & (bar_x_r < (MAX_X-1-BAR_V)))
            bar_x_next = bar_x_reg + BAR_V; // move down
         else if (btn[0] & (bar_x_l > BAR_V)) 
            bar_x_next = bar_x_reg - BAR_V; // move up
   end 

   //--------------------------------------------
   // square ball
   //--------------------------------------------
   // boundary
   assign ball_x_l = ball_x_reg;
   assign ball_y_t = ball_y_reg;
   assign ball_x_r = ball_x_l + BALL_SIZE - 1;
   assign ball_y_b = ball_y_t + BALL_SIZE - 1;
   // pixel within ball
   assign sq_ball_on =
            (ball_x_l<=pix_x) && (pix_x<=ball_x_r) &&
            (ball_y_t<=pix_y) && (pix_y<=ball_y_b);
   // map current pixel location to ROM addr/col
   assign rom_addr = pix_y[2:0] - ball_y_t[2:0];
   assign rom_col = pix_x[2:0] - ball_x_l[2:0];
   assign rom_bit = rom_data[rom_col];
   // pixel within ball
   assign rd_ball_on = sq_ball_on & rom_bit;
   // ball rgb output
   assign ball_rgb = 3'b100;   // red
  
   // new ball position
   assign ball_x_next = (gra_still) ? MAX_X/2 :
                        (refr_tick) ? ball_x_reg+x_delta_reg :
                        ball_x_reg ;
   assign ball_y_next = (gra_still) ? MAX_Y/2 :
                        (refr_tick) ? ball_y_reg+y_delta_reg :
                        ball_y_reg ;
   // new ball velocity
   always @*   
   begin
      hit = 1'b0;
      miss = 1'b0;
      x_delta_next = x_delta_reg;
      y_delta_next = y_delta_reg;
      if (gra_still)     // initial velocity
         begin
            x_delta_next = BALL_V_N;
            y_delta_next = BALL_V_P;
         end   
      else if (ball_x_l < 1) // reach left
         x_delta_next = BALL_V_P;
      else if (ball_x_l > (MAX_X-1)) // reach right
         x_delta_next = BALL_V_N;
      else if (ball_y_t <= WALL_Y_B) // reach wall
         y_delta_next = BALL_V_P;    // bounce back
      else if ((bar_x_l<=ball_x_r) && (ball_x_r<=bar_x_r) &&
               (BAR_Y_T<=ball_y_b) && (ball_y_t<=BAR_Y_B))
         begin
            // reach x of right bar and hit, ball bounce back
            y_delta_next = BALL_V_N;  
            hit = 1'b1;
         end
      else if (ball_y_b>MAX_Y)   // reach right border
         miss = 1'b1;            // a miss       
   end 

   //--------------------------------------------
   // rgb multiplexing circuit
   //--------------------------------------------
   always @* 
      if (wall_on)
         graph_rgb = wall_rgb;
      else if (bar_on)
         graph_rgb = bar_rgb;
      else if (rd_ball_on)
           graph_rgb = ball_rgb;
      else
            graph_rgb = 3'b110; // yellow background
   // new graphic_on signal
   assign graph_on = wall_on | bar_on | rd_ball_on;

endmodule 
