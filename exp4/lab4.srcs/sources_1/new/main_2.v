`timescale 1ns / 1ps

module main(
    input clk,
    input [15:0] sw,
    output [6:0] seg,
    output [3:0] an
    );
    
  wire [2:0]num;
  assign num = sw[2:0];         // solo para degubear el display
  
  display_floor(clk, num, num, an, seg);
    


endmodule
