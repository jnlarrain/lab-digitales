`timescale 1ns / 1ps
/*
Cuenta hasta un maximo de 9999 boletas
*/
module counter_receipts(
input clk,
input up,
output [13:0]count
);

reg [13:0]cuenta;   
assign count = cuenta;

always @(posedge clk)
begin
if((cuenta <9999) && up)
cuenta = cuenta + 1;
end    
endmodule
