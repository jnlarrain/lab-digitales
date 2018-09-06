`timescale 1ns / 1ps

module Basys3(
    input clk,
    input sw,
    input led,
    input seg,
    output JA, 
    output an
    );
    
    // 
    assign an = 'b00;
    
    display(    
    .display(Fsel),
    .clk(clk),
    .seg(seg)
    );  
    
    mem();
    
    clock_divider();
    
    mux();
    
    cont_1();
    
    cont_2();
    
    debouncer();
    
endmodule
