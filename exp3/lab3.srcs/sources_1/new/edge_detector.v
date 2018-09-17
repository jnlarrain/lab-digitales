`timescale 1ns / 1ps

module edge_detector(
    input clk,
    input level_in,
    output level_out
    );
    
    reg delay_reg;
    always @ (posedge clk)
        delay_reg = level_in;
    
    assign level_out = ~delay_reg & level_in;
endmodule
