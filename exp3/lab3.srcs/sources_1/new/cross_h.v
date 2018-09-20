`timescale 1ns / 1ps

module cross_h(
    input clk,
    input pulse,
    input en, 
    input [6:0] qty_h,
    input [1:0] state_h,
    output cross_h
    );
    
    reg [3:0] cross_countdown;
    reg cross_h_reg;
    
    always @ (posedge clk)
        begin
        cross_h_reg = 0;
        if (pulse && en)
            begin
            if (cross_countdown > 0)
                cross_countdown = cross_countdown - 1;
            if (qty_h && !cross_countdown && !state_h)
                begin
                cross_countdown = 15;
                cross_h_reg = 1;
                end
            end
        end
        
    assign cross_h = cross_h_reg;
endmodule
