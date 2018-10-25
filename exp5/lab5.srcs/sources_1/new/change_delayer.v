`timescale 1ns / 1ps

module change_delayer(
    input clk,
    input [13:0] change_in,
    input sale_done,
    output reg [13:0] change_out
    );
    
    
    reg [27:0] count;
    
    reg out;
    
    initial
    begin
    count = 0;
    out = 0;
    end
    
    always @ (posedge clk)
    begin
        if (sale_done)
        begin
            out = 1;
            count = 1;
        end
        else if (out)
        begin        
            if (count > 200000000)
                begin
                    out = 0;
                    count = 0;
                end
                else if (count)
                begin
                    count = count + 1;
                end
            end
        else
        begin
        change_out = change_in;
        end
    end
endmodule
