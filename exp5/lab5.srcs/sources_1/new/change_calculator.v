`timescale 1ns / 1ps

module change_calculator(
    input [13:0] price,
    input [9:0] count_coin_user_500,
    input [9:0] count_coin_user_100,
    input [9:0] count_coin_user_50,
    input [9:0] count_coin_user_10,
    input [13:0] count_coin_stock_500,
    input [13:0] count_coin_stock_100,
    input [13:0] count_coin_stock_50,
    input [13:0] count_coin_stock_10,
    output enough_change,
    output [13:0] count_coin_change_500,
    output [13:0] count_coin_change_100,
    output [13:0] count_coin_change_50,
    output [13:0] count_coin_change_10,
    output [13:0] count_coin_stock_new_500,
    output [13:0] count_coin_stock_new_100,
    output [13:0] count_coin_stock_new_50,
    output [13:0] count_coin_stock_new_10
    );
    
    wire [13:0] change;
    wire [13:0] temp_500;
    wire [13:0] temp_100;
    wire [13:0] temp_50;
    wire [13:0] temp_10;
    wire [13:0] total_coins_user;
    
    coin_adder(count_coin_user_500, count_coin_user_100, count_coin_user_50, count_coin_user_10, total_coins_user);
    
    assign change = (total_coins_user >= price) ? (total_coins_user - price) : 0;
    
    assign temp_500 = (change / 500);
    assign count_coin_change_500 = (temp_500 > (count_coin_stock_500 + count_coin_user_500)) ? (count_coin_stock_500 + count_coin_user_500) : temp_500;
    assign temp_100 = (change - count_coin_change_500 * 500) / 100;
    assign count_coin_change_100 = (temp_100 > (count_coin_stock_100 + count_coin_user_100)) ? (count_coin_stock_100 + count_coin_user_100) : temp_100;
    assign temp_50 = (change - count_coin_change_500 * 500 - count_coin_change_100 * 100) / 50;
    assign count_coin_change_50 = (temp_50 > (count_coin_stock_50 + count_coin_user_50)) ? (count_coin_stock_50 + count_coin_user_50) : temp_50;
    assign temp_10 = (change - count_coin_change_500 * 500 - count_coin_change_100 * 100 - count_coin_change_50 * 50) / 10;
    assign count_coin_change_10 = (temp_10 > (count_coin_stock_10 + count_coin_user_10)) ? (count_coin_stock_10 + count_coin_user_10) : temp_10;
    
    assign enough_change = count_coin_change_500 * 500 + count_coin_change_100 * 100 + count_coin_change_50 * 50 + count_coin_change_10 * 10 == change;
    
    assign count_coin_stock_new_500 = count_coin_stock_500 + count_coin_user_500 - count_coin_change_500;
    assign count_coin_stock_new_100 = count_coin_stock_100 + count_coin_user_100 - count_coin_change_100;
    assign count_coin_stock_new_50 = count_coin_stock_50 + count_coin_user_50 - count_coin_change_50;
    assign count_coin_stock_new_10 = count_coin_stock_10 + count_coin_user_10 - count_coin_change_10;
endmodule
