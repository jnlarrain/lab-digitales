module reset_pos(
    input clk,
    input s_sw,
    input [2:0]pos_1,
    input [2:0]pos_2,
    output reset
    );
    
    reg reset_state;
    assign reset = reset_state;
    
    
    always @(posedge clk)
    if(s_sw)
    reset_state = 1;
    else
    begin
    if ((pos_1 == 2)&&(pos_2 == 6))
    reset_state = 0;
    end
        
endmodule