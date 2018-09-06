`timescale 1ns / 1ps


module display(
    input [1:0] display,
    input clk,
    output reg [7:0] seg
    );


always @(*)
case(display)
    'b00:    seg = 'b00000001;
    'b01:    seg = 'b00000010;
    'b10:    seg = 'b00000011;
    default: seg = 'b00000000;
   
endcase
endmodule