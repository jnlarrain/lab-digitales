`timescale 1ns / 1ps

module xorer(
    input clk,
    input trig,
    output reg out
    );
    
    always @ (posedge clk)
    begin
        if (trig)
            out = out + 1;
    end
endmodule