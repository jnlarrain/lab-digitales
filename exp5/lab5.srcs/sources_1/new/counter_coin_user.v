	`timescale 1ns / 1ps
/*           
8    El formato de los contadores de monedas es [500, 100, 50, 10].                        
9    Partir con el config_mode y el incremento de la cantidad de monedas y productos.                        
*/
module counter_coin_user(
input clk,
input [3:0]inc,
input reset,
output [9:0]cuenta0,
output [9:0]cuenta1,
output [9:0]cuenta2,
output [9:0]cuenta3
);

wire [13:0]valor;
reg [9:0]cuenta[3:0];   
assign cuenta0 =  cuenta[0];
assign cuenta1 =  cuenta[1];
assign cuenta2 =  cuenta[2];
assign cuenta3 =  cuenta[3];

assign valor = (cuenta[0]+inc[0])*500 + (cuenta[1]+inc[1])*100 + (cuenta[2]+inc[2])*50 +(cuenta[3]+inc[3])*10;

always @(posedge clk)
begin
if(inc[0])
begin
if((valor <9990) && inc[0])
    cuenta[0] = cuenta[0] + 1;
end
else if(inc[1])
begin
if((valor <9990) && inc[1])
    cuenta[1] = cuenta[1] + 1;
end
else if(inc[2])
begin
if((valor <9990) && inc[2])
    cuenta[2] = cuenta[2] + 1;
end
else if (inc[3])
begin
if((valor <9990) && inc[3])
    cuenta[3] = cuenta[3] + 1;
end
else if(reset)
begin
cuenta[0] = 0;
cuenta[1] = 0;
cuenta[2] = 0;
cuenta[3] = 0;
end
end    
endmodule