`timescale 1ns / 1ps

module main(
    input clk,
    input [15:0] sw,
    output [6:0] seg,
    output [3:0] an
    );
    
  wire [2:0]num1;
  wire [2:0]num2;
  wire [5:0]num3;
  wire [3:0]out1;
  wire [3:0]out2;
  
  assign num1 = sw[2:0];         // solo para degubear el display
  assign num2 = sw[5:3];         // solo para degubear el display
  assign num3 = sw[11:6];
  
  
  distance_calculator(num1, num2, num3, sw[12], sw[13], sw[14], sw[15], out1, out2);
  debug_seven_seg_mgmt(clk, 1, out1, out2, 0, an, seg);   


endmodule
