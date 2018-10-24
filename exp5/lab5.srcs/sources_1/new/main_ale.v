`timescale 1ns / 1ps

module main_ale(
    input clk,
    input [15:0] sw,
    input btnC,
    input [3:0] JC,
    output [3:0] JB,
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an
    );
    
    wire [13:0] count_receipts;
    wire [13:0] count_product_0;
    wire [13:0] count_product_1;
    wire [13:0] count_product_2;
    wire [13:0] count_product_3;
    wire [13:0] count_coins_stock_500;
    wire [13:0] count_coins_stock_100;
    wire [13:0] count_coins_stock_50;
    wire [13:0] count_coins_stock_10;
    wire [9:0] count_coins_user_500;
    wire [9:0] count_coins_user_100;
    wire [9:0] count_coins_user_50;
    wire [9:0] count_coins_user_10;
    
    wire [22:0] total_coins_user;
    wire [13:0] change;
    
    wire inc_receipts;
    wire [3:0] inc_products;
    wire [3:0] dec_products;
    wire [3:0] inc_coins_stock;
    wire [3:0] dec_coins_stock;
    wire [3:0] inc_coins_user;
    wire reset_coins_user;
    
    wire config_mode;
    wire sale_done;
    wire [3:0] config_choice;
    
    wire [13:0] display_num;
    
    wire pulse_keypad;
    wire [15:0] btns_keypad;
    
    wire [3:0] btns_money;
    wire [3:0] btns_products;
    wire btn_cancel;
    
    assign config_mode = sw[15];
    assign sale_done = sw[14]; // REMOVE BEFORE FLIGHT
    assign config_choice = sw[3:0];
    
    counter_receipts(clk, inc_receipts, count_receipts);
    counter_products(clk, inc_products, dec_products, count_product_0, count_product_1, count_product_2, count_product_3);
    counter_coin_stock(clk, inc_coins_stock, dec_coins_stock, count_coins_stock_500, count_coins_stock_100, count_coins_stock_50, count_coins_stock_10);
    counter_coin_user(clk, inc_coins_user, reset_coins_user, count_coins_user_500, count_coins_user_100, count_coins_user_50, count_coins_user_10);
    
    coin_adder(count_coins_user_500, count_coins_user_100, count_coins_user_50, count_coins_user_10, total_coins_user);
    
    display_data(config_mode, sale_done, config_choice, count_receipts,
        count_product_0, count_product_1, count_product_2, count_product_3,
        count_coins_stock_500, count_coins_stock_100, count_coins_stock_50, count_coins_stock_10,
        total_coins_user, change, display_num);
        
    seven_seg_mgmt(clk, 1, display_num, an, seg);
    
    pulse_generator_keypad(clk, pulse_keypad);
    keypad(clk, pulse_keypad, JC, JB, btns_keypad);
    keypad_organizer(clk, btns_keypad, btns_money, btns_products, btn_cancel);
    assign led[8:5] = btns_money;
    assign led[4:1] = btns_products;
    assign led[0] = btn_cancel;
    endmodule
