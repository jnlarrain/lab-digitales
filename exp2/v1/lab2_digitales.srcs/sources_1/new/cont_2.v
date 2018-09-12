`timescale 1ns / 1ps

module cont_2(
input clock,
output reg [1:0]d //direccion

);
always @(*)
begin
d = clock ? (d[1] ? (d[0]?'b00: 'b00):(d[0]?d+1:d+1)) : d;
end
endmodule
