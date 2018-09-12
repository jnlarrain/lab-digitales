`timescale 1ns / 1ps

module counter_1(
    input clk,
    input clk_counter_1,
    input en,
    output reg [7:0] count
    );
    
    always @ (posedge clk)
        if (en & clk_counter_1)
            count = count + 1;
endmodule
