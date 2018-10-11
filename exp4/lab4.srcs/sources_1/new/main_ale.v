`timescale 1ns / 1ps

module main_ale(
    input clk,
    input [3:0] JC,
    input btnU,
    input [15:0]sw,
    output [3:0] JB,
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an
    );
    
    
    // Este pulso se usa en door_led_mgmt y en logic_mgmt.
    wire pulse_slow;
    // Este pulso se usa para el movimiento del ascensor. Su periodo es 1.5 segundos.
    wire pulse_fast;
    // Este es un pulso de alta frecuencia usado para el keypad.
    wire pulse_keypad;
    
    // Esta es una variable intermedia del keypad.
    wire [15:0] btns;
    
    // Posiciones de los ascensores. Van entre 0 y 6.
    wire [2:0] pos_1;
    wire [2:0] pos_2;
    // Indican si el ascensor esta estatico o no.
    wire static_1;
    wire static_2;
    // Indican la direccion del ascensor. 1 si el ascensor sube.
    wire dir_1;
    wire dir_2;
    
    // Cada variable contiene el piso deseado. Van entre 0 y 6.
    wire [2:0] set_1;
    wire [2:0] set_2;
    
    // Estas variables almacenan los pedidos actuales.
    wire [5:0] floor_state;
    wire [3:0] el_state_1;
    wire [3:0] el_state_2;
    
    // Estas variables tienen el estado real de los botones.
    wire [5:0] floor_press;
    wire [3:0] el_press_1;
    wire [3:0] el_press_2;
    
    // Estas variables se usan para modificar los state cuando se satisface un pedido.
    wire [5:0] floor_pull;
    wire [3:0] el_pull_1;
    wire [3:0] el_pull_2;
    
    // 1 si la puerta esta abierta.
    wire door_led_1;
    wire door_led_2;
    // Pulso que indica que se debe abrir una puerta. Se emite cuando el ascensor para.
    wire open_pulse_1;
    wire open_pulse_2;
    // Se emite un pulso cuando la puerta se cierra.
    wire close_pulse_1;
    wire close_pulse_2;
    // FALTA IMPLEMENTAR QUE SE ABRA LA PUERTA
    
    // Generadores de pulsos.
    pulse_generator (clk, pulse_slow);
    pulse_generator #(150000000)(clk, pulse_fast);
    pulse_generator_keypad(clk, pulse_keypad);
    
    // Modulos relacionados al keypad y el estado de los pedidos.
    keypad(clk, pulse_keypad, JC[3:0], JB[3:0], btns[15:0]);
    button_press_detector(clk, btns, floor_press, el_press_1, el_press_2);
    button_state(clk, floor_press, el_press_1, el_press_2, floor_pull, el_pull_1, el_pull_2, floor_state, el_state_1, el_state_2);
    button_puller(clk, pos_1, pos_2, static_1, static_2, floor_pull, el_pull_1, el_pull_2);
    
    // Modulos para mover ascensores
    move_elevator #(2)(clk, pulse_fast, set_1, pos_1, static_1, dir_1);
    move_elevator #(6)(clk, pulse_fast, set_2, pos_2, static_2, dir_2);
    
    // Emite un pulso cuando el ascensor para.
    edge_detector(clk, static_1, open_pulse_1);
    edge_detector(clk, static_2, open_pulse_2);
    // Este close_pulse le avisa al logic_mgmt que ya se cerro la puerta. Es un pulso.
    door_led_mgmt(clk, open_pulse_1, door_led_1, close_pulse_1);
    door_led_mgmt(clk, open_pulse_2, door_led_2, close_pulse_2);
    
    // Leds para mostrar info.
    assign led[0] = dir_1;
    assign led[1] = dir_2;
    assign led[2] = door_led_1;
    assign led[3] = door_led_2;
    wire reset;
    
    
    wire [2:0]aux_1;
    wire [2:0]aux_2;
    wire [5:0]aux_3;
    wire [2:0]reset_aux;
    
    assign aux_1 = sw[2:0];
    assign aux_2 = sw[5:3];
    assign aux_3 = sw[11:6];
    
    assign reset_aux = {3'b00, reset};
    
    //logic_mgmt(clk, pos_1, pos_2, static_1, static_2, dir_1, dir_2, reset, door_led_1, door_led_2, floor_state, el_state_1, el_state_2, set_1, set_2);
    logic_mgmt(clk, aux_1, aux_2, 0, 0, dir_1, dir_2, reset, door_led_1, door_led_2, aux_3, el_state_1, el_state_2, set_1, set_2);
    //display_floor(clk, pos_1, pos_2, an, seg);
    display_floor(clk, 0, reset_aux, an, seg);
    reset_pos(clk, btnU, pos_1, pos_2, reset);
    
    
endmodule
