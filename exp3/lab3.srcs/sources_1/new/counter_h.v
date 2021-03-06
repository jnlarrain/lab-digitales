`timescale 1ns / 1ps
/*
Almacena la cantidad de autos en la calle horizontal. El valor count puede estar entre 0 y 99.
*/
module counter_h(
    input clk,
    input up,
    input cross_h,
    output [6:0]count
);

reg [6:0]cuenta;   
assign count = cuenta;
 
always @(posedge clk)
begin
if((cuenta <99) && up)
cuenta = cuenta + 1;
else if (cross_h &&(cuenta>0))
cuenta = cuenta - 1;
end    
endmodule
