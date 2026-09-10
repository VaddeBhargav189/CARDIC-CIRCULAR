`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2026 16:21:59
// Design Name: 
// Module Name: controller
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


module controller(
    input clk,reset,start ,
    input [4:0] i,
    output reg done ,
    output reg start_compute               
    );
    
    always@(posedge clk or posedge reset) begin
        if(reset || (~start)) begin
           done<=1'd0;
           start_compute<=1'd0;
        end
        else begin
          if(i>=5'd15) begin
              done<=1'd1;
              start_compute<=1'd0;
          end
          else start_compute<=1'd1;
        end
    end
endmodule
