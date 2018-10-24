`timescale 1ns / 1ps
///////////////////////////////////////////////////////////////////////////////


module display_data(
    input config_mode,
    input sale_done,
    input [3:0] config_choice,
    input [13:0] count_receipts,
    input [13:0] count_product_0,
    input [13:0] count_product_1,
    input [13:0] count_product_2,
    input [13:0] count_product_3,
    input [13:0] count_coin_stock_500,
    input [13:0] count_coin_stock_100,
    input [13:0] count_coin_stock_50,
    input [13:0] count_coin_stock_10,
    input [13:0] user_total,
    input [13:0] change,
    output [13:0] num
    );
    
    assign num = config_mode ? ((config_choice==0 ? (count_receipts)
                              : (config_choice==1) ? (count_product_0)
                              : (config_choice==2) ? (count_product_1)
                              : (config_choice==3) ? (count_product_2)
                              : (config_choice==4) ? (count_product_3)
                              : (config_choice==5) ? (count_coin_stock_500)
                              : (config_choice==6) ? (count_coin_stock_100)
                              : (config_choice==7) ? (count_coin_stock_50)
                              : (config_choice==8) ? (count_coin_stock_10)
                              : (0)))
                             : (sale_done ? (change)
                                          : (user_total));
endmodule
