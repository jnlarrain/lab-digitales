`timescale 1ns / 1ps

module pulse_extender(
    input clk,
    input in,
    output reg out
    );
    
    reg [27:0] count;
    
    always @ (posedge clk)
    begin
        if (in)
        begin
            out = 1;
            count = 1;
        end
        else if (count > 200000000)
        begin
            out = 0;
            count = 0;
        end
        else if (count)
        begin
            count = count + 1;
        end
    end
endmodule
