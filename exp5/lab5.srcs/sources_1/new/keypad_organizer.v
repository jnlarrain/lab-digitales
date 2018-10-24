module keypad_organizer(
    input clk,
    input [15:0] btns,
    output [3:0] btns_money,
    output [3:0] btns_products,
    output btn_cancel
    );
    
    assign btns_money = ~{btns[5], btns[9], btns[13], btns[1]};
    assign btns_products = ~{btns[2], btns[14], btns[10], btns[6]};
    assign btn_cancel = ~btns[3];
    
endmodule