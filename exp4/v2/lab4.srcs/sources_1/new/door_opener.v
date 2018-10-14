`timescale 1ns / 1ps

module door_opener(
    input clk,
    input [2:0] pos_1,
    input [2:0] pos_2,
    input [5:0] floor_press,
    input [3:0] el_press_1,
    input [3:0] el_press_2,
    output reg open_pulse_1,
    output reg open_pulse_2
    );
    
    always @ (posedge clk)
    begin
        open_pulse_1 = 0;
        if (pos_1 == 0)
        begin
            if ((el_press_1 == 4'b0001) | (floor_press == 6'b000001))
                open_pulse_1 = 1;
        end
        
        else if (pos_1 == 2)
        begin
            if ((el_press_1 == 4'b0010) | (floor_press == 6'b000010) | (floor_press == 6'b000100))
                open_pulse_1 = 1;
        end
        
        else if (pos_1 == 4)
        begin
            if ((el_press_1 == 4'b0100) | (floor_press == 6'b001000) | (floor_press == 6'b010000))
                open_pulse_1 = 1;
        end
        
        else if (pos_1 == 6)
        begin
            if ((el_press_1 == 4'b1000) | (floor_press == 6'b100000))
                open_pulse_1 = 1;
        end
        
        open_pulse_2 = 0;
        if (pos_2 == 0)
        begin
            if ((el_press_2 == 4'b0001) | (floor_press == 6'b000001))
                open_pulse_2 = 1;
        end
        
        else if (pos_2 == 2)
        begin
            if ((el_press_2 == 4'b0010) | (floor_press == 6'b000010) | (floor_press == 6'b000100))
                open_pulse_2 = 1;
        end
        
        else if (pos_2 == 4)
        begin
            if ((el_press_2 == 4'b0100) | (floor_press == 6'b001000) | (floor_press == 6'b010000))
                open_pulse_2 = 1;
        end
        
        else if (pos_2 == 6)
        begin
            if ((el_press_2 == 4'b1000) | (floor_press == 6'b100000))
                open_pulse_2 = 1;
        end
    end
endmodule
