`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2026 16:45:34
// Design Name: 
// Module Name: datapath15
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


module datapath15(
     input clk,reset,
     input signed [15:0] X_in,Y_in,Z_in,
     output reg signed [15:0] X_out,Y_out,Z_out
    );
    wire signed [15:0] X,Y;
    assign X = {16{X_in[15]}};
    assign Y = {16{Y_in[15]}};
    
    always@(posedge clk or posedge reset)begin
        if(reset)begin
           X_out<=16'sd0;
           Y_out<=16'sd0;
           Z_out<=16'sd0;
        end
        else begin
  //////////////////////ROTATION MODE/////////////////////////////
          /*X_out<=X_in-(Y^{16{Z_in[15]}})-Z_in[15];
          Y_out<=Y_in+(X^{16{Z_in[15]}})+Z_in[15];
          Z_out<=Z_in;*/
          
  //////////////////////VECTOR MODE/////////////////////////////
           X_out<=X_in+(Y^{16{Y_in[15]}})+Y_in[15];
          Y_out<=Y_in-(X^{16{Y_in[15]}})-Y_in[15];
          Z_out<=Z_in;
        end
    end
endmodule
