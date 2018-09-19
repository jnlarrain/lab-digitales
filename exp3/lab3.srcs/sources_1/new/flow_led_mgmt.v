`timescale 1ns / 1ps
/*
El LED debe estar encendido s� y solo s� en y high_flow est�n activas.
*/
module flow_led_mgmt(
    input en, 
    input high_flow,
    output s_led
    );

    assign s_led = en ? (high_flow ? 1'b1 : 1'b0) : 1'b0;
 
endmodule