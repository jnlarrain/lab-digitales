`timescale 1ns / 1ps

module cont_1(
input clk,
input enable,
output reg [7:0]direccion
);

always @(posedge clk)
if (direccion == 255) direccion= 'b00000000;
else  if(~enable) direccion = direccion +1;

endmodule
