`timescale 1ns / 1ps
/*
Prende los LEDs de los semaforos según los estados
0 Verde         pins 2 y 5
1 Amarillo      pins 1 y 4
2 Rojo          pins 0 y 3
*/
module stoplight_led_mgmt(
    input en,
    input [1:0]state_v,
    input [1:0]state_h,
    output [5:0]s_JA
    );
    
    assign s_JA[2:0] = en ? (state_v[1] ? (state_v[0] ? 3'b000 : 3'b001) : (state_v[0] ? 3'b010 : 3'b100)) : 3'b000; 
    assign s_JA[5:3] = en ? (state_h[1] ? (state_h[0] ? 3'b000 : 3'b001) : (state_h[0] ? 3'b010 : 3'b100)) : 3'b000;
    
endmodule