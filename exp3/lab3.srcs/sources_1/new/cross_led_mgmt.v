`timescale 1ns / 1ps
/*
cross_v y cross_h enviarán pulsos que informan el cruce de un vehículo.
Al recibir un pulso, el LED correspondiente debe mantenerse encendido por medio segundo.
Se puede utilizar la variable pulse para manejar el tiempo.
*/
module cross_led_mgmt(
    input en,
    input clk,
    input cross_v,
    input cross_h,
    input cross_amb,
    input pulse,
    output [2:0]s_led
    );

reg [2:0]time_counter;
reg change;
reg [2:0]last;
wire [2:0]status;
assign s_led = en ? last : 3'b000;

assign status[0] = cross_v;
assign status[1] = cross_h;
assign status[2] = cross_amb;

always @(posedge clk)
begin
if (time_counter ==0)
last = 3'b000;
else if (pulse)
time_counter = time_counter-1;
if (status != 3'b000)
begin
last = status;
time_counter = 5;
end
end

endmodule