`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 01:19:23 PM
// Design Name: 
// Module Name: Divider
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


module divider(clock, reset, command, dataA, dataB, quotient, i, registerRA, state_reg, remainder, done);
localparam n=8;
localparam m=4;
input clock, reset, command;
input [n-1:0] dataA; 
input [m-1:0] dataB;
output reg [n-1:0] quotient;
output reg [n-1:0] remainder;
output reg done;
output reg [2:0] i;
output reg [2*n-1:0] registerRA;
output reg [1:0] state_reg;
localparam [1:0] s1=2'b00, s2=2'b01, s3=2'b10;
reg [1:0] state_next;
reg [n-1:0] registerA, registerA_next;
reg [n-1:0] registerB, registerB_next;
reg [2*n-1:0] registerRA_next;
reg [n-1:0] quotient_next;
reg [n-1:0] remainder_next;
reg [2:0]  i_next;
reg done_next;

always @(posedge clock)
       if (reset)
          begin
             state_reg <= s1;
             registerA<=0;
             registerB<=0;
             registerRA<=0;
             quotient<=0;
             remainder<=0;
             i<=n-1;
             done<=0;
          end
       else
          begin
             state_reg<= state_next;
             registerA<=registerA_next;
             registerB<=registerB_next;
             registerRA<=registerRA_next;
             quotient<=quotient_next;
             remainder<=remainder_next;
             i<=i_next;
             done<=done_next;
          end
always @*
begin
    state_next = state_reg; 
    registerA_next=registerA;
    registerB_next=registerB;
    registerRA_next=registerRA;
    quotient_next=quotient;
    remainder_next=remainder;
    i_next=i;
    done_next=done;    
    case (state_reg)
    s1:
    begin
       registerRA_next={remainder, registerA};
       if (command==1)
         begin
           state_next=s2;
           done_next=0;
         end
       else
         begin
           registerA_next =dataA;
           registerB_next ={4'b0,dataB};
           registerRA_next={remainder, registerA_next};
           remainder_next=0;
           i_next=n-1;
           done_next=0;
         end
    end     
    s2:
    begin
        registerRA_next={registerRA[2*n-2:0],1'b0}; //shift left {R, A}; needs to use "="
        if (registerRA_next[2*n-1:n]>=registerB)
           begin
              quotient_next[i]=1;
              registerRA_next[2*n-1:n]=
              registerRA_next[2*n-1:n]-registerB;
              remainder_next=registerRA_next[2*n-1:n]; 
           end
        else
           begin
             quotient_next[i]=0;
           end
        if (i==0)
         begin
           state_next=s3;
         end
       else
        begin
          i_next=i-1;
        end
     end
    s3:
    begin
      done_next=1;
      //remainder_next=registerRA[2*n-1:n];
      if (command==0)
         state_next=s1;
    end
    
    default:
    begin
        state_next = s1;
        done_next=0;
    end
    endcase
end

endmodule
