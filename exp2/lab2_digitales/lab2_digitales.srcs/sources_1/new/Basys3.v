`timescale 1ns / 1ps

module Basys3(
    input clk,
    input sw,
    input led,
    input seg,
    output JA, 
    output an
    );
    
    // Falta realizar los wires internos para las conecciones de los diferentes modulos
    // Falta realizar las operaciones propias de los wires
    // Falta seleccionar las frecuencias y senal
    // Falta selector de boton
    // Falta encender leds
    assign an = 'b00;
    
    // Listo llegar y conectar (creo)
    display(    
    .display(Fsel),
    .clk(clk),
    .seg(seg)
    );  
    
    // Falta por hacer
    mem();
    
    // Falta por conectar
    clock_divider(
    .clk(clk),
    .speed(Sspeed),
    .clock(clock)
    
    );
    
    //Falta por conectar
    mux();
    
    //Falta por hacer
    cont_1();
    
    //Falta por hacer
    cont_2();
    
    //Falta por hacer
    debouncer();
    
    leds_mgmt_2();
    
endmodule
