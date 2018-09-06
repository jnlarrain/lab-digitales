`timescale 1ns / 1ps


module display(
    input [1:0] display,
    input clk,
    output reg [7:0] seg
    );


always @(*)
case(display)
    'b00:    seg = 8'b11111001;
    'b01:    seg = 8'b10100100;
    'b10:    seg = 8'b11001111;
    default: seg = 8'b11111111;
   
endcase
endmodule