module keypad_organizer(
    input clk,
    input [15:0] btns,
    output [3:0] btn_money,
    output [3:0] btn_product,
    output btn_cancel
    );
    
    wire [5:0] floor_press_temp;
    wire [3:0] el_press_1_temp;
    wire [3:0] el_press_2_temp;
    
    assign floor_press[5:0] = ~{btns[5], btns[8], btns[9], btns[12], btns[13], btns[0]};
    assign el_press_1[3:0] = ~{btns[6], btns[10], btns[14], btns[2]};
    assign el_press_2[3:0] = ~{btns[7], btns[11], btns[15], btns[3]};
    
endmodule