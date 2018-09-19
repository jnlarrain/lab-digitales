`timescale 1ns / 1ps
/*
cross_v y cross_h enviarán pulsos que informan el cruce de un vehículo.
Al recibir un pulso, el LED correspondiente debe mantenerse encendido por medio segundo.
Se puede utilizar la variable pulse para manejar el tiempo.
*/
module cross_led_mgmt(
    input en,
    input cross_v,
    input cross_h,
    input croos_amb,
    input pulse,
    output [2:0]s_led
    );

reg [2:0]time_counter;
reg [2:0]status;
wire led;
assign led = en ? ((time_counter>0) ? 1'b1 : 1'b0): 1'b0;
assign s_led = led ? status : 3'b000;

always @(posedge cross_v,posedge cross_h,posedge croos_amb)
begin
if(time_counter == 0)
time_counter = 5;
if (cross_h)
status = 3'b001;
else if (cross_v)
status = 3'b010;
else if (croos_amb)
status = 3'b100;
end

always @(posedge pulse)
begin
if(time_counter > 0) 
time_counter = time_counter-1;
end

endmodule