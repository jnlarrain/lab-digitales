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
    input [2:0]pos_1,                       // posicion del elevador 1
    input [2:0]pos_2,                       // posicion del elevador 2
    input static_1,                         // estado estatico elevador 1 (True or False)
    input static_2,                         // estado estatico elevador 2 (True or False)
    input dir_1,                            // direccion elevador 1: 1 pa arriba 0 pa abajo
    input dir_2,                            // direccion elevador 2: 1 pa arriba 0 pa abajo
    input reset,
    input flag1,
    input flag2,
    input [5:0]floor_state,                 // peticiones de los pisos    
    input [3:0]el_state_1,                  // estado botones dentro del asensor 1
    input [3:0]el_state_2,                  // estado botones dentro del asensor 2
    output reg [2:0]set_elevator_1,             // señal subida elevador 1
    output reg [2:0]set_elevator_2              // señal subida elevador 2
    );
        
    
    //wires para las distancias
    wire [3:0]f10;
    wire [3:0]f11;
    wire [3:0]f12;
    wire [3:0]f13;
    wire [3:0]f14;
    wire [3:0]f15;
    wire [3:0]f20;
    wire [3:0]f21;
    wire [3:0]f22;
    wire [3:0]f23;
    wire [3:0]f24;
    wire [3:0]f25;
    
    //wire para los pisos
    wire [5:0]floor_10;
    wire [5:0]floor_11;
    wire [5:0]floor_12;
    wire [5:0]floor_13;
    wire [5:0]floor_14;
    wire [5:0]floor_15;
    wire [5:0]floor_20;
    wire [5:0]floor_21;
    wire [5:0]floor_22;
    wire [5:0]floor_23;
    wire [5:0]floor_24;
    wire [5:0]floor_25;
    
    wire up11;
    wire up12;
    wire up21;
    wire up22;
    
    wire [2:0]re_1;
    wire [2:0]re_2;   
    
    
    assign up11 = set_elevator_1[1]&((pos_1>3)&dir_1);    
    assign up12 = set_elevator_1[2]&((pos_1>5)&dir_1);
    assign up21 = set_elevator_2[1]&((pos_2>3)&dir_2);
    assign up22 = set_elevator_2[2]&((pos_2>5)&dir_2);
    
    // asigna si una distancia es valida o no segun las configuraci
    assign floor_10 = floor_state[0]|set_elevator_1[0] ? 6'b000001 : 6'b000000;
    assign floor_11 = floor_state[1]|~up11 ? 6'b000010 : 6'b000000;
    assign floor_12 = floor_state[2]|up11 ? 6'b000100 : 6'b000000;
    assign floor_13 = floor_state[3]|~up12 ? 6'b001000 : 6'b000000;
    assign floor_14 = floor_state[4]|up12 ? 6'b010000 : 6'b000000;
    assign floor_15 = floor_state[5]|set_elevator_1[3] ? 6'b100000 : 6'b000000;
    assign floor_20 = floor_state[0]|set_elevator_2[0] ? 6'b000001 : 6'b000000;
    assign floor_21 = floor_state[1]|~up21 ? 6'b000010 : 6'b000000;
    assign floor_22 = floor_state[2]|up21 ? 6'b000100 : 6'b000000;
    assign floor_23 = floor_state[3]|~up22 ? 6'b001000 : 6'b000000;
    assign floor_24 = floor_state[4]|up22 ? 6'b010000 : 6'b000000;
    assign floor_25 = floor_state[5]|set_elevator_2[3] ? 6'b100000 : 6'b000000;
    
    
    //calculo de las distancias si no es valido retorna 15 que es el maximo
    distance_calculator(pos_1, floor_10, dir_1, static_1, f10);                  //pos 0
    distance_calculator(pos_1, floor_11, dir_1, static_1, f11);                  //pos 1
    distance_calculator(pos_1, floor_12, dir_1, static_1, f12);                  //pos 2
    distance_calculator(pos_1, floor_13, dir_1, static_1, f13);                  //pos 3
    distance_calculator(pos_1, floor_14, dir_1, static_1, f14);                  //pos 4
    distance_calculator(pos_1, floor_15, dir_1, static_1, f15);                  //pos 5
    distance_calculator(pos_2, floor_20, dir_2, static_2, f20);                  //pos 0
    distance_calculator(pos_2, floor_21, dir_2, static_2, f21);                  //pos 1
    distance_calculator(pos_2, floor_22, dir_2, static_2, f22);                  //pos 2
    distance_calculator(pos_2, floor_23, dir_2, static_2, f23);                  //pos 3
    distance_calculator(pos_2, floor_24, dir_2, static_2, f24);                  //pos 4
    distance_calculator(pos_2, floor_25, dir_2, static_2, f25);                  //pos 5

 
    
    sort_floor(clk, f10, f11, f12, f13, f14, f15, re_1);
    sort_floor(clk, f20, f21, f22, f23, f24, f25, re_1);
    
    always @(posedge clk)
    begin
    if (~flag1)
    set_elevator_1 = reset ? 3'b110 : (floor_state==el_state_1==el_state_2==0 ? 3'b110 : re_1 );
    if (~flag2)
    set_elevator_2 = reset ? 3'b010 : (floor_state==el_state_1==el_state_2==0 ? 3'b010 : re_2 );    
    end
endmodule






