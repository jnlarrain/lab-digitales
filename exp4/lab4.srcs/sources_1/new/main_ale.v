`timescale 1ns / 1ps

module main_ale(
    input clk,
    input [0:0] sw,
    output [1:0] led
    );
    
    wire debounced;
    wire edged;
    wire close;
    
    debouncer(clk, sw[0], debounced);
    edge_detector(clk, debounced, edged);
    door_led_mgmt(clk, edged, led[0], close);
    xorer(clk, close, led[1]);
    
endmodule
