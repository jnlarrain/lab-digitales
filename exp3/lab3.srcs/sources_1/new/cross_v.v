`timescale 1ns / 1ps

module cross_v(
    input clk,
    input pulse,
    input [6:0] qty_v,
    input qty_amb,
    input [1:0] state_v,
    output cross_v,
    output cross_amb
    );
    
    reg [3:0] cross_countdown;
    reg cross_v_reg;
    reg cross_amb_reg;
    
    always @ (posedge clk)
        begin
        cross_v_reg <= 0;        
        cross_amb_reg <= 0;
        if (pulse)
            begin
            if (cross_countdown > 0)
                cross_countdown = cross_countdown - 1;
            if (qty_amb && !cross_countdown && !state_v)
                begin
                cross_countdown <= 15;
                cross_amb_reg <= 1;
                end
            else if (qty_v && !cross_countdown && !state_v)
                begin
                cross_countdown <= 15;
                cross_v_reg <= 1;
                end
            end
        end
        
    assign cross_v = cross_v_reg;
    assign cross_amb = cross_amb_reg;
endmodule
