`timescale 1ns / 1ps

module main_test(
    input clk,
    input [15:0] sw,
    input btnC,
    input [3:0] JC,
    output [3:0] JB,
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an
    );
    
    parameter price_0 = 50;
    parameter price_1 = 100;
    parameter price_2 = 990;
    parameter price_3 = 5000;
    
    parameter count_product_initial_0 = 20;
    parameter count_product_initial_1 = 0;
    parameter count_product_initial_2 = 2;
    parameter count_product_initial_3 = 4;
    
    parameter count_coin_initial_500 = 10;
    parameter count_coin_initial_100 = 1;
    parameter count_coin_initial_50 = 2;
    parameter count_coin_initial_10 = 3;
    
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
    
    wire [13:0] count_coins_stock_load_500;
    wire [13:0] count_coins_stock_load_100;
    wire [13:0] count_coins_stock_load_50;
    wire [13:0] count_coins_stock_load_10;
    
    wire config_mode;
    wire [3:0] config_choice;
    
    wire sale_done_pulse;
    wire not_enough_funds_pulse;
    wire not_enough_change_pulse;
    wire product_not_available_pulse;
        
    wire sale_done;
    wire not_enough_funds;
    wire not_enough_change;
    wire product_not_available;
    
    wire [13:0] display_num;
    
    wire pulse_keypad;
    wire [15:0] btns_keypad;
    
    wire [3:0] btns_money;
    wire [3:0] btns_products;
    wire btn_cancel;
    
    wire [13:0] price_product;
    
    counter_receipts(clk, inc_receipts, count_receipts);
    counter_products #(count_product_initial_0, count_product_initial_1, count_product_initial_2, count_product_initial_3)
        (clk, inc_products, dec_products, count_product_0, count_product_1, count_product_2, count_product_3);
    counter_coin_stock #(count_coin_initial_500, count_coin_initial_100, count_coin_initial_50, count_coin_initial_10)
        (clk, inc_coins_stock, dec_coins_stock,
        count_coins_stock_load_500, count_coins_stock_load_100, count_coins_stock_load_50, count_coins_stock_load_10, sale_done_pulse,
        count_coins_stock_500, count_coins_stock_100, count_coins_stock_50, count_coins_stock_10);
    counter_coin_user(clk, inc_coins_user, reset_coins_user, count_coins_user_500, count_coins_user_100, count_coins_user_50, count_coins_user_10);
    
    coin_adder(count_coins_user_500, count_coins_user_100, count_coins_user_50, count_coins_user_10, total_coins_user);
    
    display_data(config_mode, sale_done, config_choice, count_receipts,
        count_coin_change_500, count_coin_change_100, count_coin_change_50, count_coin_change_10,
        count_coin_stock_load_500, count_coin_stock_load_100, count_coin_stock_load_50, count_coin_stock_load_10,
        total_coins_user, change, display_num);


    wire enough_change;
    wire [13:0] count_coin_change_500;
    wire [13:0] count_coin_change_100;
    wire [13:0] count_coin_change_50;
    wire [13:0] count_coin_change_10;
    wire [13:0] count_coin_stock_load_500;
    wire [13:0] count_coin_stock_load_100;
    wire [13:0] count_coin_stock_load_50;
    wire [13:0] count_coin_stock_load_10;
    
    change_calculator(price_product, count_coins_user_500, count_coins_user_100, count_coins_user_50, count_coins_user_10,
        count_coins_stock_500, count_coins_stock_100, count_coins_stock_50, count_coins_stock_10,
        enough_change, count_coin_change_500, count_coin_change_100, count_coin_change_50, count_coin_change_10,
        count_coin_stock_load_500, count_coin_stock_load_100, count_coin_stock_load_50, count_coin_stock_load_10);
        
                
    seven_seg_mgmt(clk, 1, display_num, an, seg);
    
    pulse_generator_keypad(clk, pulse_keypad);
    keypad(clk, pulse_keypad, JC, JB, btns_keypad);
    keypad_organizer(clk, btns_keypad, btns_money, btns_products, btn_cancel);
    
    assign price_product = 250;
        
    assign change = count_coin_change_500 * 500 + count_coin_change_100 * 100 + count_coin_change_50 * 50 + count_coin_change_10 * 10;
    
    assign led[15] = enough_change;
    assign config_mode = sw[15];
    assign sale_done = sw[14];
    assign config_choice = sw[3:0];
    
    assign inc_coins_stock = config_mode ? btns_money : 0;
    assign inc_coins_user = config_mode ? 0 : btns_money;
    assign reset_coins_user = config_mode ? 0 : btn_cancel;
    endmodule
