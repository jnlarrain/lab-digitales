`timescale 1ns / 1ps

module main_ale(
    input clk,
    input [15:0] sw,
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an
    );
    
    wire pulse;
    pulse_generator #(150000000)(clk, pulse);
    
    wire [2:0] pos_1;
    wire [2:0] pos_2;
    wire static_1;
    wire static_2;
    wire dir_1;
    wire dir_2;
    
    wire [2:0] set_1;
    wire [2:0] set_2;
    
    move_elevator #(2)(clk, pulse, set_1, pos_1, static_1, dir_1);
    move_elevator #(6)(clk, pulse, set_2, pos_2, static_2, dir_2);
    
    assign set_1 = sw[2:0] > 6 ? 6 : sw[2:0];
    assign set_2 = sw[5:3] > 6 ? 6 : sw[5:3];
    
    assign led[0] = static_1;
    assign led[1] = static_2;
    assign led[2] = dir_1;
    assign led[3] = dir_2;
    
    seven_seg_mgmt_test(clk, 1, pos_2, pos_1, an, seg);
    
endmodule
