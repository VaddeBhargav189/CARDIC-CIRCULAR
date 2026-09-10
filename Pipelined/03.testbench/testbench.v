`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.08.2026 00:12:02
// Design Name: 
// Module Name: testbench
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


module testbench ;
reg clk,reset;
reg signed [15:0] X_in,Y_in,Z_in;
wire signed [15:0] X_out,Y_out,Z_out;
top top_insta(.clk(clk),.reset(reset),.X_in(X_in),.Y_in(Y_in),.Z_in(Z_in),.X_out(X_out),.Y_out(Y_out),.Z_out(Z_out));

initial begin
    clk = 1'd1;
    reset = 1'd1;
end
 always #5 clk = ~clk;
 initial begin
    #20 reset = 1'd0;
    X_in = 16'sd9830;
    Y_in = -16'sd13107;
    Z_in = 16'sd0;
    
    #20 X_in = 16'sd0;
       Y_in = 16'sd0;
       Z_in = 16'sd0;
       
    #10000 $finish;
 end
endmodule
