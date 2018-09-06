`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2018 02:47:13 AM
// Design Name: 
// Module Name: leds_mgmt_2
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


module leds_mgmt_2(
    output [15:0] led,
    input [7:0] bytes
    );
    
    assign led = (bytes < 16) ? 16'b0000000000000001
               : (bytes < 32) ? 16'b0000000000000010
               : (bytes < 48) ? 16'b0000000000000100
               : (bytes < 64) ? 16'b0000000000001000
               : (bytes < 80) ? 16'b0000000000010000
               : (bytes < 96) ? 16'b0000000000100000
               : (bytes < 112) ? 16'b0000000001000000
               : (bytes < 128) ? 16'b0000000010000000
               : (bytes < 144) ? 16'b0000000100000000
               : (bytes < 160) ? 16'b0000001000000000
               : (bytes < 176) ? 16'b0000010000000000
               : (bytes < 192) ? 16'b0000100000000000
               : (bytes < 208) ? 16'b0001000000000000
               : (bytes < 224) ? 16'b0010000000000000
               : (bytes < 240) ? 16'b0100000000000000
               : 16'b1000000000000000;
               
endmodule
