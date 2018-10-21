`timescale 1ns / 1ps


module main(
    input clk,
    input [13:0] sw,
    output [6:0] seg,
    output [3:0] an
    );
    

    
    seven_seg_mgmt(clk, 1, sw, an, seg);
    

endmodule
