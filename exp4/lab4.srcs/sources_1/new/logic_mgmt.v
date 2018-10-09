`timescale 1ns / 1ps

module logic_mgmt(
    input clk,                              // clock general del sistema
    input pulse,                            // pulso de 3 segundos
    input [2:0]pos_1,                       // posicion del elevador 1
    input [2:0]pos_2,                       // posicion del elevador 2
    input static_1,                         // estado estatico elevador 1 (True or False)
    input static_2,                         // estado estatico elevador 2 (True or False)
    input dir_1,                            // direccion elevador 1
    input dir_2,                            // direccion elevador 2
    input [5:0]floor_state,                 // peticiones de los pisos
    input [3:0]el_state_1,                  // estado elevador 1
    input [3:0]el_state_2,                  // estado elevador 2
    input [3:0]btn_elevator_1,              // señal boton elevador 1
    input [3:0]btn_elevator_2,              // señal boton elevador 2
    input [3:0]btn_general,                 // señal boton btn pisos 2
    output [1:0]set_elevator_1,             // señal subida elevador 1
    output [1:0]set_elevator_2              // señal subida elevador 2
    );
    
    wire reset_elevator_1;
    wire reset_elevator_2;
    wire reset_state;
    
    assign reset_elevator_1 = 1;
    assign reset_elevator_2 = 3;
    assign reset_state = floor_state&6'b111111;
    
endmodule






