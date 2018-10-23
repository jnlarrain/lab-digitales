	`timescale 1ns / 1ps
/*           
8    El formato de los contadores de monedas es [500, 100, 50, 10].                        
9    Partir con el config_mode y el incremento de la cantidad de monedas y productos.                        
*/
module counter_coin_user(
input clk,
input [3:0]inc,
input [3:0]dec,
output [9:0]cuenta0,
output [9:0]cuenta1,
output [9:0]cuenta2,
output [9:0]cuenta3
);

reg [9:0]cuenta[3:0];   
assign cuenta0 =  cuenta[0];
assign cuenta1 =  cuenta[1];
assign cuenta2 =  cuenta[2];
assign cuenta3 =  cuenta[3];



always @(posedge clk)
begin
if(inc[0]|dec[0])
begin
if((cuenta[0] <9999) && inc[0])
    cuenta[0] = cuenta[0] + 1;
else if (dec[0] &&(cuenta[0]>0))
    cuenta[0] = cuenta[0] - 1;
end
else if(inc[1]|dec[1])
begin
if((cuenta[1] <9999) && inc[1])
    cuenta[1] = cuenta[1] + 1;
else if (dec[1] &&(cuenta[1]>0))
    cuenta[1] = cuenta[1] - 1;
end
else if(inc[2]|dec[2])
begin
if((cuenta[2] <9999) && inc[2])
    cuenta[2] = cuenta[2] + 1;
else if (dec[2] &&(cuenta[2]>0))
    cuenta[2] = cuenta[2] - 1;
end
else
begin
if((cuenta[3] <9999) && inc[3])
    cuenta[3] = cuenta[3] + 1;
else if (dec[3] &&(cuenta[3]>0))
    cuenta[3] = cuenta[3] - 1;
end
end    
endmodule