`timescale 1ns / 1ps


module main(
    input clk,
    input btnC,     // ambulancia
    input btnR,     // horizontal
    input btnU,     // vertical
    input [15:0]sw,
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
wire ss_btnC;
wire ss_btnD;
wire ss_btnR;
wire s_btnC;
wire s_btnD;
wire s_btnR;
wire high_flow;

assign en = sw[0];

seven_seg(clk, en, qty_v, qty_h, qty_amb, an, seg);
stoplight_led_mgmt(en, state_v, state_h, JA);
debouncer ambulances_debouncer(clk, btnC, s_btnC);
debouncer vertical_debouncer(clk, btnU, s_btnD);
debouncer horizontal_debouncer(clk, btnR, s_btnR);
cross_led_mgmt(en, cross_v, cross_h, cross_amb, pulse, led[2:0]);
flow_led_mgmt(en, high_flow, led[3]);
counter_v(clk, ss_btnD, cross_v, qty_v);    
counter_h(clk, ss_btnR, cross_h, qty_h);
counter_amb(clk, ss_btnC, cross_amb, qty_amb);
edge_detector ambulances_pulse(clk, s_btnC, ss_btnC);
edge_detector vertical_pulse(clk, s_btnD, ss_btnD);
edge_detector horizontal_pulse(clk, s_btnR, ss_btnR);
pulse_generator(clk, pulse);
stoplight_state_mgmt(clk, pulse, ss_btnC, high_flow, state_v, state_h);
cross_v(clk, pulse, qty_v, qty_amb, state_v, cross_v, cross_amb);
cross_h(clk, pulse, qty_h, state_h, cross_h);
high_flow_detector(qty_v, qty_h, qty_amb, high_flow);







endmodule
