`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2025 02:45:31 PM
// Design Name: 
// Module Name: lab2_sim
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


module lab2_sim;
    reg [7:0] data;
    reg [2:0] sel;
    wire out;
    
    integer i;
    integer j;
    
    
    mux8to1 uut(data, sel, out);
    
    initial
    begin
        data = 8'b0;sel = 3'b0;
//        for(i = 0; i <=7; i = i+1 )
//        begin
//            #1 sel = i;
            
//            for(j = 0; j <= 255; j = j+1 )
//            begin
//                #1 data = j;
                
//            end
            
//        end

        
    end

endmodule
