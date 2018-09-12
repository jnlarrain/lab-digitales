`timescale 1ns / 1ps

module Basys3(
    input clk,
    input [15:0] sw,
    input [15:0] led,
    input btnC,
    output [6:0] seg,
    output [7:0] JA, 
    output [3:0] an
    );
    
    wire clock;
    wire [1:0] Fsel;
    wire [1:0] Bsel;
    wire [7:0] direccion;
    wire [23:0] datos;
    wire enable;
    wire [7:0]leds;
    wire [1:0] mux_sel;
    wire [1:0] speed;
    wire [1:0] pb_out;  // salida del debouncer
    wire  pb_1;
    assign an = 'b1110;
    
    // Listo llegar y conectar (creo)
    display display1(mux_sel, seg);  
      
    // Falta por hacer
    memoria(direccion, datos);
    
        //Falta por hacer
    cont_2 contador2(btnC, mux_sel);
    
    // Falta por conectar
    clock_divider nuevo_clock(clk, speed, clock);
    
    //Falta por conectar
    mux(datos[23:16], datos[15:8], datos[7:0], mux_sel, leds);
    
    //Falta por hacer
    cont_1 contador1(clock, enable, direccion);
    
    //Falta por hacer
//    debouncer(, clk, pb_out);
    
    leds_mgmt_2();
   
    //assign pb_1 = ;
endmodule
