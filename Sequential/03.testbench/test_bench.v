`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2026 15:16:20
// Design Name: 
// Module Name: test_bench
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


module test_bench ;
reg clk,reset,start;
reg signed [15:0] Z_in,X_in,Y_in;
wire done;
wire signed [15:0] X_out,Y_out;

top top_insta(.clk(clk),.reset(reset),.start(start),.Z_in(Z_in),.X_in(X_in),.Y_in(Y_in),.done(done),.X_out(X_out),.Y_out(Y_out));

initial begin
     clk = 1'd1;
     reset = 1'd1;
     start = 1'd0;
     Z_in = 16'd0;
     X_in = 16'd0;
     Y_in = 16'd0;
end

always #5 clk = ~clk;

initial begin
     #15 reset = 1'd0;
         start = 1'd1;
         Z_in = 16'sd8579;
         X_in = 16'd16384;
         Y_in = 16'd0;
         wait(done);
         start = 1'd0;
         
    // displaying inputs and outputs
    $display("INPUTS");
    $display("-----------------------------------------------------------------------------------------------");
    $display("Angle (Z)        = %0d",Z_in);
    $display("Xin              = %0d",X_in);
    $display("Yin              = %0d",Y_in);
    $display("-----------------------------------------------------------------------------------------------");
    $display("OUTPUTS");
    $display("-----------------------------------------------------------------------------------------------");
    $display("Xout             = %0d",X_out);
    $display("Yout             = %0d",Y_out);
    $display("-----------------------------------------------------------------------------------------------");
    $display("Calculations and Final OUTPUTS");
    $display("-----------------------------------------------------------------------------------------------");
    $display("-----------------------------------------------------------------------------------------------");
    $display("Removing the gain");
    $display("-----------------------------------------------------------------------------------------------");
    $display("Xout              = %0f",(X_out/1.64676));
    $display("Yout              = %0f",(Y_out/1.64676));
    $display("-----------------------------------------------------------------------------------------------");
    $display("Final OUTPUTS");   
    $display("-----------------------------------------------------------------------------------------------");
    $display("Xout              = %0f",(X_out/(1.64676*16384)));    
    $display("Y_out             = %0f",(Y_out/(1.64676*16384)));
    $display("-----------------------------------------------------------------------------------------------");
         #10000;
         $finish;
end
endmodule
