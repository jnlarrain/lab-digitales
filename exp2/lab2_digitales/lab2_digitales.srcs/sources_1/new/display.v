`timescale 1ns / 1ps


module display(
    input [1:0] display,
    input clk,
    output reg [6:0] seg
    );


always @(*)
case(display)
    'b01:    seg = 7'b0001111;
    'b10:    seg = 7'b0010010;
    'b11:    seg = 7'b0000110;
    default: seg = 7'b0000000;
   
endcase
endmodule