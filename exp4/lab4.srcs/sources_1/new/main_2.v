`timescale 1ns / 1ps

module main(
    input clk,
    input [15:0] sw,
    input btnU,
    output [6:0] seg,
    output [3:0] an
    );
    
  wire pulse;
  wire [2:0]pos_1;
  wire [2:0]pos_2;
  wire static_1;
  wire static_2;
  wire dir_1;
  wire dir_2;
  wire reset;
  reg [3:0]el_state_1;
  reg [3:0]el_state_2;
  reg [5:0]floor_state;
  wire[2:0]set_elevator_2;
  wire[2:0]set_elevator_1;
  
logic_mgmt(clk, pulse, pos_1, pos_2, static_1, static_2, dir_1, dir_2, reset, floor_state, el_state_1, el_state_2, set_elevator_1, set_elevator_2);
display_floor(clk, pos_1, pos_2, an, seg);
reset_pos(clk, btnU, pos_1, pos_2, reset);

button_press_detector();
button_state(clk, floor_prees, el_press_1, el_press_2, floor_pull, el_pull_1, el_pull_2, floor_state, el_state_1, el_state_2);

debouncer();


pulse_generator();
move_elevator();
edge_detector();
door_led_mgmt();


endmodule
