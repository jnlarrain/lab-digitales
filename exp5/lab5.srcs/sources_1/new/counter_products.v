	`timescale 1ns / 1ps
/*           
Cada producto se asigna al bit segun su indice            
*/
module counter_products(
input clk,
input [3:0]inc,
input [3:0]dec,
output [13:0]product0,
output [13:0]product1,
output [13:0]product2,
output [13:0]product3
);

reg [13:0]cuenta[3:0];   
assign product0 =  cuenta[0];
assign product1 =  cuenta[1];
assign product2 =  cuenta[2];
assign product3 =  cuenta[3];

parameter c0 = 0;
parameter c1 = 0;
parameter c2 = 0;
parameter c3 = 0;

initial
begin
cuenta[0] = c0;
cuenta[1] = c1;
cuenta[2] = c2;
cuenta[3] = c3;
end


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