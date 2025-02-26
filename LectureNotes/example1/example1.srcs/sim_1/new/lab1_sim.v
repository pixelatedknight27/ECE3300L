`timescale 1ns / 1ps   //this line should be already included in the default code

module lab1_sim;
  reg [2:0] test_data;
  wire [7:0] test_y;
  decoder3to8 uut(.data(test_data), .y(test_y) ); 
 // uut stands for "Unit Under Test", which is declared as an 'object' of module "decoder"

initial begin
 test_data=0;
 #1 test_data =1;
 #1 test_data =2;
 #1 test_data =3;
 #1 test_data =4;
 #1 test_data =5;
 #1 test_data =6;
 #1 test_data =7;
 end
endmodule
