`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2025 11:48:16 PM
// Design Name: 
// Module Name: upcounter
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


//module upcounter (
//    input Resetn, Clock, E,
//    input [31:0] max,
//    output reg [31:0] Q
//    );
//    always @(posedge Clock)
//    begin
//        if (!Resetn)
//            Q <= 0;
//        else if (E)
//            Q <= Q + 1;
            
//        if(Q = max)
//            Q <= 0;
//    end
//endmodule

module upcounter (Resetn, Clock, E, max, Q);
    input Resetn, Clock, E;
    input [31:0] max;
    output reg [31:0] Q;
    
    always @(posedge Clock)
    begin
        if (!Resetn)
        begin
            Q <= 0;
        end
        else if (E)
        begin
            Q <= Q + 1;
       end
         if(Q == max)
            Q <= 0;
    end
endmodule