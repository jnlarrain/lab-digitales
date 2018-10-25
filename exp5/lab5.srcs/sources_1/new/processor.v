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
    output sale_done_pulse,
    output reg not_enough_funds_pulse,
    output reg product_not_available_pulse,
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
    
    parameter price_0 = 50;
    parameter price_1 = 100;
    parameter price_2 = 990;
    parameter price_3 = 5000;
    
    reg [13:0] count_product;
    reg [13:0] price_product;
    
    reg [1:0] product_num;
        
    wire [13:0] total_coins_user;
    
    coin_adder(count_coin_user_500, count_coin_user_100, count_coin_user_50, count_coin_user_10, total_coins_user);
    
    always @ (posedge clk)
    begin
        product_not_available_pulse = 0;
        not_enough_funds_pulse = 0;
        count_product = 0;
        price_product = 0;
        if (~config_mode)
            begin
            if (btns_product)
            begin
                if (btns_product[0])
                begin
                    product_num = 0;
                    count_product = count_product_0;
                    price_product = price_0;
                end
                if (btns_product[1])
                begin
                    product_num = 1;
                    count_product = count_product_1;
                    price_product = price_1;
                end
                if (btns_product[2])
                begin
                    product_num = 2;
                    count_product = count_product_2;
                    price_product = price_2;
                end
                if (btns_product[3])
                begin
                    product_num = 3;
                    count_product = count_product_3;
                    price_product = price_3;
                end
                
                if (count_product)
                begin
                    if (total_coins_user >= price_product)
                    begin
                        // Sigue aqui
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
    
    assign coin_stock_inc = config_mode ? btns_money : 0;
    assign products_inc = config_mode ? btns_product : 0;
    assign coin_user_inc = config_mode ? 0 : btns_money;
    assign coin_user_reset = config_mode ? 0 : btn_cancel;
endmodule
