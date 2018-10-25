	`timescale 1ns / 1ps
/*
				
8	El formato de los contadores de monedas es [500, 100, 50, 10].						
9	Partir con el config_mode y el incremento de la cantidad de monedas y productos.						
*/
module counter_coin_stock(
    input clk,
    input [3:0]inc,
    input [3:0]dec,
    input [13:0] count_coin_stock_500,
    input [13:0] count_coin_stock_100,
    input [13:0] count_coin_stock_50,
    input [13:0] count_coin_stock_10,
    input load,
    output [13:0]quinientos,
    output [13:0]cien,
    output [13:0]cincuenta,
    output [13:0]diez
    );
    
     
    
    reg [13:0]cuenta[3:0];   
    assign quinientos = cuenta[0];
    assign cien =  cuenta[1];
    assign cincuenta =  cuenta[2];
    assign diez =  cuenta[3];


    parameter c1 = 10;
    parameter c2 = 10;
    parameter c3 = 100;
    parameter c0 = 100;
    
    

    initial
    begin
    cuenta[0] = c0;
    cuenta[1] = c1;
    cuenta[2] = c2;
    cuenta[3] = c3;
    end
    
always @(posedge clk)
begin
if (load)
begin
cuenta[0] = count_coin_stock_500;
cuenta[1] = count_coin_stock_100;
cuenta[2] = count_coin_stock_50;
cuenta[3] = count_coin_stock_10;
end
else if(inc[0]|dec[0])
    begin
    if((cuenta[0] <9990) && inc[0])
        cuenta[0] = cuenta[0] + 1;
    else if (dec[0] &&(cuenta[0]>0))
        cuenta[0] = cuenta[0] - 1;
    end
else if(inc[1]|dec[1])
    begin
    if((cuenta[1] <9990) && inc[1])
        cuenta[1] = cuenta[1] + 1;
    else if (dec[1] &&(cuenta[1]>0))
        cuenta[1] = cuenta[1] - 1;
    end
else if(inc[2]|dec[2])
    begin
    if((cuenta[2] <9990) && inc[2])
        cuenta[2] = cuenta[2] + 1;
    else if (dec[2] &&(cuenta[2]>0))
        cuenta[2] = cuenta[2] - 1;
    end
else
    begin
    if((cuenta[3] <9990) && inc[3])
        cuenta[3] = cuenta[3] + 1;
    else if (dec[3] &&(cuenta[3]>0))
        cuenta[3] = cuenta[3] - 1;
    end
end    
endmodule
