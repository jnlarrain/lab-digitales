module button_state(
    input clk,
    input [5:0] floor_press,
    input [3:0] el_press_1,
    input [3:0] el_press_2,
    input [5:0] floor_pull,
    input [3:0] el_pull_1,
    input [3:0] el_pull_2, 
    output reg [5:0] floor_state,
    output reg [3:0] el_state_1,
    output reg [3:0] el_state_2
    );
    
    initial
    begin
        floor_state = 6'b000000;
        el_state_1 = 4'b0000;
        el_state_2 = 4'b0000;
    end
    
    reg [28:0] counter;
    parameter MAXVAL = 100000000;
    
    always @ (posedge clk)
    begin
        if (counter < MAXVAL)
        begin
            counter = counter + 1;
        end
        else
        begin
    //        if (floor_press[0])
    //            floor_state[0] = 1;
    //        else if (floor_press[1])
    //            floor_state[0] = 0;
            floor_state = floor_state | floor_press;
            el_state_1 = el_state_1 | el_press_1;
            el_state_2 = el_state_2 | el_press_2;
            
            floor_state = floor_state & ~floor_pull;
            el_state_1 = el_state_1 & ~el_pull_1;
            el_state_2 = el_state_2 & ~el_pull_2;
        end
    end
    
    
endmodule