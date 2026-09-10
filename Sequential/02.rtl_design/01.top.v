`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2026 14:11:34
// Design Name: 
// Module Name: top
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


module top(
  input clk,reset,start,
  input signed [15:0] Z_in,
  input signed [15:0] X_in,Y_in,
  output done,
  output signed [15:0] X_out,Y_out
    );
    
    
    // Controller-Interface
    wire start_compute;
    
    // Counter-Interface
    wire [4:0] i;
    
    // ROM-Interface
    wire signed [15:0] rtd_angle;
    
    // 1.Controller
     controller controller_insta(.clk(clk),.reset(reset),.start(start),.i(i),.done(done),.start_compute(start_compute));
    
    // 2.Counter 
    counter counter_insta(.clk(clk),.reset(reset),.start(start_compute),.i(i));
    
    // 3.ROM
    ROM ROM_insta(.reset(reset),.i(i),.rtd_angle(rtd_angle));
    
    // 4.datapath
    datapath datapath_insta(.clk(clk),.reset(reset),.start(start),.start_compute(start_compute),.i(i),.angle_in(rtd_angle),.X_in(X_in),.Y_in(Y_in),.Z_in(Z_in),.X_out(X_out),.Y_out(Y_out));
endmodule
