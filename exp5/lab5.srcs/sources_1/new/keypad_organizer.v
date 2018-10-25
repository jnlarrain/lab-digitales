module keypad_organizer(
    input clk,
    input [15:0] btns,
    output [3:0] btns_money,
    output [3:0] btns_products,
    output btn_cancel,
    output btn_buy
    );
        
    wire btn_debounced_0;
    wire btn_debounced_1;
    wire btn_debounced_2;
    wire btn_debounced_3;
    wire btn_debounced_4;
    wire btn_debounced_5;
    wire btn_debounced_6;
    wire btn_debounced_7;
    wire btn_debounced_8;
    wire btn_debounced_9;
    wire btn_debounced_10;
    wire btn_debounced_11;
    wire btn_debounced_12;
    wire btn_debounced_13;
    wire btn_debounced_14;
    wire btn_debounced_15;
    
    wire btn_edged_0;
    wire btn_edged_1;
    wire btn_edged_2;
    wire btn_edged_3;
    wire btn_edged_4;
    wire btn_edged_5;
    wire btn_edged_6;
    wire btn_edged_7;
    wire btn_edged_8;
    wire btn_edged_9;
    wire btn_edged_10;
    wire btn_edged_11;
    wire btn_edged_12;
    wire btn_edged_13;
    wire btn_edged_14;
    wire btn_edged_15;
    
    debouncer(clk, ~btns[0], btn_debounced_0);
    debouncer(clk, ~btns[1], btn_debounced_1);
    debouncer(clk, ~btns[2], btn_debounced_2);
    debouncer(clk, ~btns[3], btn_debounced_3);
    debouncer(clk, ~btns[4], btn_debounced_4);
    debouncer(clk, ~btns[5], btn_debounced_5);
    debouncer(clk, ~btns[6], btn_debounced_6);
    debouncer(clk, ~btns[7], btn_debounced_7);
    debouncer(clk, ~btns[8], btn_debounced_8);
    debouncer(clk, ~btns[9], btn_debounced_9);
    debouncer(clk, ~btns[10], btn_debounced_10);
    debouncer(clk, ~btns[11], btn_debounced_11);
    debouncer(clk, ~btns[12], btn_debounced_12);
    debouncer(clk, ~btns[13], btn_debounced_13);
    debouncer(clk, ~btns[14], btn_debounced_14);
    debouncer(clk, ~btns[15], btn_debounced_15);
    
    edge_detector(clk, btn_debounced_0, btn_edged_0);
    edge_detector(clk, btn_debounced_1, btn_edged_1);
    edge_detector(clk, btn_debounced_2, btn_edged_2);
    edge_detector(clk, btn_debounced_3, btn_edged_3);
    edge_detector(clk, btn_debounced_4, btn_edged_4);
    edge_detector(clk, btn_debounced_5, btn_edged_5);
    edge_detector(clk, btn_debounced_6, btn_edged_6);
    edge_detector(clk, btn_debounced_7, btn_edged_7);
    edge_detector(clk, btn_debounced_8, btn_edged_8);
    edge_detector(clk, btn_debounced_9, btn_edged_9);
    edge_detector(clk, btn_debounced_10, btn_edged_10);
    edge_detector(clk, btn_debounced_11, btn_edged_11);
    edge_detector(clk, btn_debounced_12, btn_edged_12);
    edge_detector(clk, btn_debounced_13, btn_edged_13);
    edge_detector(clk, btn_debounced_14, btn_edged_14);
    edge_detector(clk, btn_debounced_15, btn_edged_15);
    
    assign btns_money = {btn_edged_1, btn_edged_13, btn_edged_9, btn_edged_5};
    assign btns_products = {btn_edged_2, btn_edged_14, btn_edged_10, btn_edged_6};
    assign btn_cancel = btn_edged_3;
    assign btn_buy = btn_edged_7;
    
endmodule