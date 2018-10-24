`timescale 1ns / 1ps

module coin_adder(
    input [13:0] count_coin_500,
    input [13:0] count_coin_100,
    input [13:0] count_coin_50,
    input [13:0] count_coin_10,
    output [22:0] sum
    );
    
    assign sum = 500 * count_coin_500 + 100 * count_coin_100 + 50 * count_coin_50 + 10 * count_coin_10;
endmodule
