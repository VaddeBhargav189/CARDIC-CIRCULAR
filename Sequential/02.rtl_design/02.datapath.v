`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2026 16:23:05
// Design Name: 
// Module Name: datapath
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


module datapath(
       input clk,reset,start_compute,start,
       input [4:0] i,
       input signed [15:0] angle_in,
       input signed [15:0] Z_in,
       input signed [15:0] X_in,Y_in,
       output reg signed [15:0] X_out,Y_out
    );
    reg signed [15:0] Z;
        always@(posedge clk) begin
               if(reset) begin
                   Z<=16'd0;
                   X_out<=16'd0;
                   Y_out<=16'd0;
               end
               else if(start && (~start_compute))begin
               Z<=Z_in;
               X_out<=X_in;
               Y_out<=Y_in;
               end
               if(start_compute) begin
                   if(Z>=16'sd0)begin 
                     X_out<=X_out-(Y_out>>>i);
                     Y_out<=Y_out+(X_out>>>i);
                     Z<=Z-angle_in;
                   end
                  else begin
                     X_out<=X_out+(Y_out>>>i);
                     Y_out<=Y_out-(X_out>>>i);
                     Z<=Z+angle_in;
                  end
               end
        end
endmodule
