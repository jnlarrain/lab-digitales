`timescale 1ns / 1ps


module main(
    input   clk,
    input   [13:0] sw,
    input   btnU,
    output  [6:0] seg,
    output  [3:0] an
    );
    
    wire [13:0]count;
    wire pulse;
    pulse_generator(clk, pulse);
    counter_products(clk, pulse, 0, count);
    seven_seg_mgmt(clk, 1, count, an, seg);
    

endmodule
