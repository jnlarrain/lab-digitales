`timescale 1ns / 1ps

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
    input btn_buy,
    output reg sale_done_pulse,
    output reg not_enough_funds_pulse,
    output reg not_enough_change_pulse,
    output reg product_not_available_pulse,
    output [3:0] coin_stock_inc,
    output [13:0] coin_stock_load_500,
    output [13:0] coin_stock_load_100,
    output [13:0] coin_stock_load_50,
    output [13:0] coin_stock_load_10,
    output [3:0] coin_user_inc,
    output coin_user_reset,
    output [3:0] products_inc,
    output reg [3:0] products_dec,
    output [13:0] change,
    output enough_change
    );
    
    parameter price_0 = 100;
    parameter price_1 = 100;
    parameter price_2 = 100;
    parameter price_3 = 100;
    // CAMBIAR PARAMETER POR WIRE
    
    reg [13:0] count_product;
    wire [13:0] price_product;
    
    reg [1:0] product_num;
        
    wire [13:0] total_coins_user;
    
    //wire enough_change;
    wire [13:0] count_coin_change_500;
    wire [13:0] count_coin_change_100;
    wire [13:0] count_coin_change_50;
    wire [13:0] count_coin_change_10;
//    wire [13:0] count_coin_stock_new_500;
//    wire [13:0] count_coin_stock_new_100;
//    wire [13:0] count_coin_stock_new_50;
//    wire [13:0] count_coin_stock_new_10;
        
    coin_adder(count_coin_user_500, count_coin_user_100, count_coin_user_50, count_coin_user_10, total_coins_user);
    change_calculator(price_product, count_coin_user_500, count_coin_user_100, count_coin_user_50, count_coin_user_10,
        count_coin_stock_500, count_coin_stock_100, count_coin_stock_50, count_coin_stock_10,
        enough_change, count_coin_change_500, count_coin_change_100, count_coin_change_50, count_coin_change_10,
        coin_stock_load_500, coin_stock_load_100, coin_stock_load_50, coin_stock_load_10);
    
    always @ (posedge clk)
    begin
        product_not_available_pulse = 0;
        not_enough_funds_pulse = 0;
        not_enough_change_pulse = 0;
        sale_done_pulse = 0;
        products_dec = 0;
//        count_product = 0;
//        price_product = 50;  // REMOVE BEFORE FLIGHT. EL PROGRAMA REVISA CON ESTO Y NO CON EL VALOR QUE SE FIJA DESPUES.
        if (~config_mode)
            begin
            if (btns_product)
            begin
                if (btns_product[0])
                begin
                    product_num = 0;
                    count_product = count_product_0;
//                    price_product = price_0;
//                    price_product = 13'd50;
                end
                else if (btns_product[1])
                begin
                    product_num = 1;
                    count_product = count_product_1;
//                    price_product = price_1;
//                    price_product = 13'd90;
                end
                else if (btns_product[2])
                begin
                    product_num = 2;
                    count_product = count_product_2;
//                    price_product = price_2;
//                    price_product = 13'd900;
                end
                else if (btns_product[3])
                begin
                    product_num = 3;
                    count_product = count_product_3;
//                    price_product = price_3;
//                    price_product = 13'd5000;
                end
            end
            else if (btn_buy)
            begin
                if (count_product)
                begin
                    if (total_coins_user >= price_product)
                    begin
                        if (enough_change)
                        begin
                            sale_done_pulse = 1;
                            products_dec[product_num] = 1;
                        end
                        else
                        begin
                            not_enough_change_pulse = 1;
                        end
                    end
                    else
                    begin
                        not_enough_funds_pulse = 1;
                    end
                end
                else
                begin
                    product_not_available_pulse = 1;
                end
            end
        end
    end
    
    assign price_product = (product_num == 0) ? price_0 : product_num == 1 ? price_1 : product_num == 2 ? price_2 : product_num == 3 ? price_3 : 0; // REMOVE BEFORE FLIGHT
    
    assign coin_stock_inc = config_mode ? btns_money : 0;
    assign products_inc = config_mode ? btns_product : 0;
    assign coin_user_inc = config_mode ? 0 : btns_money;
    assign coin_user_reset = config_mode ? 0 : btn_cancel | sale_done_pulse;
    assign change = count_coin_change_500 * 500 + count_coin_change_100 * 100 + count_coin_change_50 * 50 + count_coin_change_10 * 10;
endmodule
