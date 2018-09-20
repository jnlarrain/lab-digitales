`timescale 1ns / 1ps

module main(
    input clk,
    input btnC,
    input btnD,
    input btnR,
    input [15:0] sw,
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an
    );
    
    wire pulse;
    
    wire v_pulse;
    wire h_pulse;
    wire amb_pulse;
   
    wire btn_v_out;
    wire btn_h_out;
    wire btn_amb_out;
    
    wire en;
    
    wire [1:0] state_v;
    wire [1:0] state_h;
    
    wire cross_h;
    wire cross_v;
    wire cross_amb;

    wire [6:0] qty_h;
    wire [6:0] qty_v;
    wire qty_amb;
    
    wire high_flow;
    
    assign en = sw[15];
    
    pulse_generator(clk, pulse);
    
    debouncer(clk, btnD, btn_v_out);
    edge_detector(clk, btn_v_out, v_pulse);
    debouncer(clk, btnR, btn_h_out);
    edge_detector(clk, btn_h_out, h_pulse);
    debouncer(clk, btnC, btn_amb_out);
    edge_detector(clk, btn_amb_out, amb_pulse);
    
    stoplight_state_mgmt(clk, pulse, en, amb_pulse, high_flow, state_v, state_h);
    
    cross_v(clk, pulse, en, qty_v, qty_amb, state_v, cross_v, cross_amb);
    cross_h(clk, pulse, en, qty_h, state_h, cross_h);
    
    counter_h(clk, h_pulse, cross_h, qty_h);
    counter_v(clk, v_pulse, cross_v, qty_v);
    counter_amb(clk, amb_pulse, cross_amb, qty_amb);
    
    high_flow_detector(qty_v, qty_h, qty_amb, high_flow);
        
    // Manejo de LEDs
    flow_led_mgmt(en, high_flow, led[3]);
    //cross_led_mgmt(en, cross_v, cross_h, cross_amb, pulse, led[2:0]);
    stoplight_led_mgmt(en, state_v, state_h, led[15:10]);
    seven_seg_mgmt(clk, en, qty_v, qty_h, qty_amb, an, seg);
    
    // Estos reemplazan temporalmente al cross_led_mgmt. Cambian el estado de un led cuando pasa un auto.
    counter_temp(clk, cross_h, led[0]);
    counter_temp(clk, cross_v, led[1]);
    counter_temp(clk, cross_amb, led[2]);
endmodule
