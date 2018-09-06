`timescale 1ns / 1ps

module cont_2(
input clk,
output reg [1:0]direccion
);

always @(posedge clk)
if (direccion == 2) direccion= 'b00;
else direccion = direccion +1;

endmodule

