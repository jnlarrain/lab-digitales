`timescale 1ns / 1ps
/*
Almacena la cantidad de autos en la calle vertical. El valor count puede estar entre 0 y 98.
*/
module counter_v(
    input clk,
    input up,
    input cross_v,
    output [6:0]count
);
   
reg [6:0]cuenta;
assign count = cuenta;   
 
always @(posedge clk)
begin
if((cuenta <98) && up)
cuenta = cuenta + 1;
else if (cross_v&&(cuenta>0))
cuenta = cuenta - 1;
end    
endmodule