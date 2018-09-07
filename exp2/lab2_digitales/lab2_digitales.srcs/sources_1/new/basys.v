`timescale 1ns / 1ps

module Basys3(
    input clk,
    input [15:0] sw,
    input [15:0] led,
    output [7:0] seg,
    input [4:0] btn,
    output [7:0] JA, 
    output [3:0] an
    );
    
    wire clock;
    wire [1:0] Fsel;
    wire [1:0] Bsel;
    assign an = 'b1110;
    
    // Listo llegar y conectar (creo)
    display(    
    .display(Fsel),
    .clk(clk),
    .seg(seg)
    );  
    
    // Falta por hacer
    memoria();
    
    // Falta por conectar
    clock_divider(
    .clk(clk),
    .speed('b01),
    .clock(clock)
    
    );
    
    //Falta por conectar
    mux();
    
    //Falta por hacer
    cont_1();
    
    //Falta por hacer
    cont_2(
    .clk(btn[0]),
    .direccion(Fsel)
    );
    
    //Falta por hacer
    debouncer(
    );
    
    leds_mgmt_2();
    
endmodule
