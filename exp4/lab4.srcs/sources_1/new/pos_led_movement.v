`timescale 1ns / 1ps

module pos_led_movement(
    input [2:0] pos_1,
    input [2:0] pos_2,
    output [13:0] led
    );
    
    assign led[6:0] = (1 << pos_1);
    assign led[13:7] = (1 << pos_2);
endmodule
