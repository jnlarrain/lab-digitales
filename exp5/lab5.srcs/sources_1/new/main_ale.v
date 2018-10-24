`timescale 1ns / 1ps

module main_ale(
    input clk,
    input [15:0] sw,
    input btnC,
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an
    );
    pulse_extender(clk, btnC, led[15]);
//    wire [22:0] sum;
//    assign led[15:0] = sum;
//    coin_adder(sw[15:12], sw[11:8], sw[7:4], sw[3:0], sum);
//    seven_seg_mgmt(clk, 1, sum, an, seg);
endmodule
