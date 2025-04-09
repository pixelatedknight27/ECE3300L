`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2025 12:07:42 PM
// Design Name: 
// Module Name: Exercise1
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


module Exercise1(
    input reset, clk, w, z, 
    output reg Q
    );
    
    reg [1:0] inputs;
    
    always @ (reset, clk)
    begin
    
        inputs = {w,z};
        
        if(!reset)
            Q = 0;
            
        else
        begin
            
            if(!Q)
            begin
                case(inputs)
                    0: Q <= Q;
                    2: Q <= ~Q;
                    default: Q <= Q;
                endcase
            end
            else
            begin
                case(inputs)
                    0: Q <= ~Q;
                    3: Q <= Q;
                    default: Q <= Q;
                endcase
            end
        end
    end
endmodule
