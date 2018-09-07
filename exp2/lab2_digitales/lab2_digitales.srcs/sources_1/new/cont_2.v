`timescale 1ns / 1ps

module cont_2(
input clock,
output reg [1:0]d //direccion
);

always @(posedge clock)
d = d[2] ? (d[1]?'b00: 'b00):(d[1]?d+1:d+1);

endmodule
