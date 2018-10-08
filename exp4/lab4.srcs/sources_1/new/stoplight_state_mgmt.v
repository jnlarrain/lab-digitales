`timescale 1ns / 1ps

module stoplight_state_mgmt(
    input clk,
    input pulse,
    input en,
    input amb_pulse,
    input high_flow,
    output [1:0] state_v,
    output [1:0] state_h
    );
    
    reg [2:0] state;
    reg [5:0] counter;
    wire [5:0] counter_max;
    
    assign counter_max = high_flow ? (state % 3 == 2 ? (5) : (state % 3 == 1 ? (10) : (60)))
                                   : (state % 3 == 2 ? (5) : (state % 3 == 1 ? (10) : (30)));
                                   
    assign state_v = (state == 0) ? 0
                   : (state == 1) ? 1
                   : 2;
                   
    assign state_h = (state == 3) ? 0
                   : (state == 4) ? 1
                   : 2;     
    
    always @ (posedge clk)
        if (amb_pulse && en)
            begin
            if (state == 0)
                begin
                state = 0;
                counter = 0;
                end
            else if (state == 1)
                begin
                state = 0;
                counter = 0;
                end
            else if (state == 2)
                begin
                state = 0;
                counter = 0;
                end
            else if (state == 3)
                begin
                state = 4;
                counter = 0;
                end
            end
        else if (pulse && en)
            if (counter >= counter_max)
                begin
                if (state == 5)
                    state = 0;
                else
                    state = state + 1;
                counter = 0;
                end
            else
                counter = counter + 1;
endmodule

