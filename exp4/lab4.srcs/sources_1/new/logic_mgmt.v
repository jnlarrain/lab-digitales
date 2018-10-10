`timescale 1ns / 1ps
/* ESTA ES LA DOCUMENTACIONDE LOS INPUTS DE ESTE MODULO
    los vectores pos entrega la posicion del asensor y sus estados intermedios   
    las posiciones son:
    0 en piso -1
    1 entre -1 y 1
    2 en piso 1
    3 entre 1 y 2
    4 en piso 2
    5 entre 2 y 3
    6 en piso 3

    floor_state es un vector que alberga de big a little lo siguiente:
    piso 3 direccion hacia abajo
    piso 2 direccion hacia arriba
    piso 2 direccion hacia abajo
    piso 1 direccion hacia arriba
    piso 1 direccion hacia abajo
    piso -1 direccion hacia arriba
    que corresponde a las peticiones en cada piso
    
    PARA LOS OUTPUTS
    
    salida de 3 bits, con las posibles salidas:
    0 -> piso destino es -1
    2 -> piso destino es  1
    4 -> piso destino es  2
    6 -> piso destino es  3
    */
module logic_mgmt(
    input clk,                              // clock general del sistema
    input pulse,                            // pulso de 3 segundos
    input [2:0]pos_1,                       // posicion del elevador 1
    input [2:0]pos_2,                       // posicion del elevador 2
    input static_1,                         // estado estatico elevador 1 (True or False)
    input static_2,                         // estado estatico elevador 2 (True or False)
    input dir_1,                            // direccion elevador 1: 1 pa arriba 0 pa abajo
    input dir_2,                            // direccion elevador 2: 1 pa arriba 0 pa abajo
    input [5:0]floor_state,                 // peticiones de los pisos    
    input [3:0]el_state_1,                  // estado botones dentro del asensor 1
    input [3:0]el_state_2,                  // estad botones dentro del asensor 2
    output [2:0]set_elevator_1,             // señal subida elevador 1
    output [2:0]set_elevator_2              // señal subida elevador 2
    );
    
    wire reset_elevator_1;
    wire reset_elevator_2;
    wire reset_state;
    
    assign reset_elevator_1 = 1;
    assign reset_elevator_2 = 3;
    assign reset_state = floor_state&6'b111111;
    
endmodule






