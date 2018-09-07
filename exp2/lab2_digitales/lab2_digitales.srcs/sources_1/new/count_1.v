`timescale 1ns / 1ps

module cont_1(
input clock,
input enable,
output reg [7:0]direccion
);

always @(posedge clock)
if (direccion == 255) direccion= 'b00000000;
else  if(~enable) direccion = direccion +1;

endmodule
