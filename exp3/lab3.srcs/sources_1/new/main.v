`timescale 1ns / 1ps


module main(
    input clk,
    output [6:0]seg,
    output [3:0]an
    );
    
seven_seg(8'b01110111, 8'b01100110, 1'b1, clk, an, seg);   
    

    
endmodule
