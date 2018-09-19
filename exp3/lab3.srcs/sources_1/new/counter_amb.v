`timescale 1ns / 1ps
/*
Almacena la cantidad de ambulacias en la calle vertical. Puede haber una como máximo.
*/
module counter_amb(
    input clk,
    input up,
    input cross_amb,
    output count
);
   
reg cuenta;
assign count = cuenta;   
 
always @(posedge clk)
begin
if((cuenta <1) & up)
cuenta = cuenta + 1;
else if (cross_amb)
cuenta = cuenta - 1;
end    
endmodule
