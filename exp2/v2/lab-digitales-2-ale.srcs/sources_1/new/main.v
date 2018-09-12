`timescale 1ns / 1ps


module main(
    input clk,
    input [15:0] sw,
    input btnC,
    output [15:0] led,
    output [3:0] an,
    output [6:0] seg,
    output [7:0] JA
    );
    
    wire clk_counter_1;
    wire [7:0] count_counter_1;
    wire [23:0] triple_data;
    wire [7:0] single_data;
    wire filtered_btn;
    wire press_pulse;
    wire [1:0] current_shape;
    
    wire en;
    wire [1:0] freq_sel;
    wire change_btn;
    
    
    assign en = sw[15];
    assign freq_sel = sw[1:0];
    assign change_btn = btnC;
    
    clk_mgmt(clk, freq_sel, clk_counter_1);
    counter_1(clk, clk_counter_1, en, count_counter_1);
    memory(count_counter_1, triple_data);
    
    debouncer(clk, change_btn, filtered_btn);
    edge_detector(clk, filtered_btn, press_pulse);
    counter_2(clk, press_pulse, en, current_shape);
    mux(triple_data, current_shape, single_data);
    led_mgmt(single_data, en, led);
    seven_seg(current_shape, en, an, seg);
    assign JA = en ? single_data : 0;
    
endmodule
