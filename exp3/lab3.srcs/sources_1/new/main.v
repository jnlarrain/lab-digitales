`timescale 1ns / 1ps


module main(
    input clk,
    input btnC,     // ambulancia
    input btnR,     // horizontal
    input btnD,     // vertical
    input sw,
    input [3:0]led,
    output [6:0]seg,
    output [3:0]an,
    output [5:0]JA
    );
    
wire [6:0]qty_v;
wire [6:0]qty_h;
wire qty_amb;
wire en;
wire [1:0]state_v;
wire [1:0]state_h;
wire cross_h;
wire cross_v;
wire cross_amb;
wire pulse;
wire s_btnC;
wire s_btnD;
wire s_btnR;
wire high_flow;

seven_seg(clk, en, qty_v, qty_h, qty_amb, an, seg);
stoplight_led_mgmt(en, state_v, state_h, JA);
debouncer ambulances(clk, btnC, s_btnC);
debouncer vertical(clk, btnD, s_btnD);
debouncer horizontal(clk, btnR, s_btnR);
cross_led_mgmt(en, cross_v, cross_h, cross_amb, pulse, led[2:0]);
flow_led_mgmt(en, high_flow, led[3]);
counter_v(clk, s_btnD, cross_v, qty_v);    
counter_h(clk, s_btnR, cross_h, qty_h);
counter_amb(clk, s_btnC, cross_amb, qty_amb);
stoplight_state_mgmt(clk, pulse );
high_flow_detector();
cross_h();
cross_v();
edge_detector();

endmodule
