`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2026 16:22:49
// Design Name: 
// Module Name: counter
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


module counter(
       input clk,
       input start,
       input reset,
       output reg [4:0] i
    );
    
    always@(posedge clk or posedge reset) begin
           if(reset || (~start) || (i>=16'd15)) i<=5'd0;
           else i<=i+1;
    end
endmodule
