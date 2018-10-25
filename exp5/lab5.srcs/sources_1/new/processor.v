`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2018 20:53:38
// Design Name: 
// Module Name: processor
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


module processor(
    input clk,
    input config_mode,
    input [13:0] count_coin_stock_500,
    input [13:0] count_coin_stock_100,
    input [13:0] count_coin_stock_50,
    input [13:0] count_coin_stock_10,
    input [9:0] count_coin_user_500,
    input [9:0] count_coin_user_100,
    input [9:0] count_coin_user_50,
    input [9:0] count_coin_user_10,
    input [13:0] count_product_0,
    input [13:0] count_product_1,
    input [13:0] count_product_2,
    input [13:0] count_product_3,
    input [3:0] btns_money,
    input [3:0] btns_product,
    input btn_cancel,
    output sale_done_pulse,
    output not_enough_funds_pulse,
    output product_not_available_pulse,
    output [3:0] coin_stock_inc,
    output coin_stock_load,
    output [13:0] coin_stock_load_500,
    output [13:0] coin_stock_load_100,
    output [13:0] coin_stock_load_50,
    output [13:0] coin_stock_load_10,
    output [3:0] coin_user_inc,
    output coin_user_reset,
    output [3:0] products_inc,
    output [3:0] products_dec,
    output [13:0] change
    );
    
    always @ (posedge clk)
    begin
        if (config_mode)
        begin
        
        end
        else
        begin
        
        end
    end
    
    assign coin_stock_inc = btns_money & config_mode;
    assign products_inc = btns_product & config_mode;
    assign coin_user_inc = btns_money & ~config_mode;
    assign coin_user_reset = btn_cancel & ~config_mode;
endmodule
