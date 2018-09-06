`timescale 1ns / 1ps


module display(
    input [3:0] dis_a, dis_b, dis_c, dis_d,
    input clk,
    output reg [7:0] seg,
    output reg [3:0] an
    );



wire [1:0] display;
wire [3:0] number;


always @(*)
case(display)
    'b00: an = 'b0111;
    'b01: an = 'b1011;
    'b10: an = 'b1101;
    'b11: an = 'b1110;
endcase

case(display)
    'b00: number = dis_a;
    'b01: number = dis_b;
    'b10: number = dis_c;
    'b11: number = dis_d;  
endcase

case(number)
    'b0000: seg = 'b11000000;
    'b0001: seg = 'b11111001;
    'b0010: seg = 'b10100100;
    'b0011: seg = 'b10110000;
    'b0100: seg = 'b10011001;
    'b0101: seg = 'b10010010;
    'b0110: seg = 'b10000010;
    'b0111: seg = 'b11111000;
    'b1000: seg = 'b10000000;
    'b1001: seg = 'b10010000;
    'b1010: seg = 'b10001000;
    'b1011: seg = 'b10000011;
    'b1100: seg = 'b11000110;
    'b1101: seg = 'b10100001;
    'b1110: seg = 'b10000110;
    'b1111: seg = 'b10001110;
   
endcase
endmodule