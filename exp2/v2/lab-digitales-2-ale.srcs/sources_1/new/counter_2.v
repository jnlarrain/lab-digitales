`timescale 1ns / 1ps

module counter_2(
    input clk,
    input clk_counter_2,
    input en,
    output reg [1:0] count
    );
    
    always @ (posedge clk)
        if (en & clk_counter_2)
            if (count == 2)
                count = 0;
            else
                count = count + 1;
endmodule
