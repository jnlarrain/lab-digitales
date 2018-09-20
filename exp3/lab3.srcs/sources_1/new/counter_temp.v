`timescale 1ns / 1ps

module counter_temp(
    input clk,
    input clk_counter_1,
    output reg count
    );
    
    always @ (posedge clk)
        if (clk_counter_1)
            count = count + 1;
endmodule
