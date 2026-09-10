`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.08.2026 16:23:59
// Design Name: 
// Module Name: ROM
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


module ROM(
            input [4:0] i,
            input reset,
            output reg signed [15:0] rtd_angle                                                         
            );
        reg signed [15:0] angle [0:15];
        always@(*)  begin
                 angle[0] = 16'd12868;
                 angle[1] = 16'd7596;
                 angle[2] = 16'd4014;
                 angle[3] = 16'd2037;
                 angle[4] = 16'd1023;
                 angle[5] = 16'd512;
                 angle[6] = 16'd256;
                 angle[7] = 16'd128;
                 angle[8] = 16'd64;
                 angle[9] = 16'd32;
                 angle[10] = 16'd16;
                 angle[11] = 16'd8;
                 angle[12] = 16'd4;
                 angle[13] = 16'd2;
                 angle[14] = 16'd1;
                 angle[15] = 16'd0;
                 
                if(reset) rtd_angle = 16'd0;
                else rtd_angle = angle[i];
        end
endmodule
