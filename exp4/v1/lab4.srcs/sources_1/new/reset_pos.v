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
    begin
    reset_state = 1;
    end
    else
    begin
    if ((pos_1 == 3'b110)&&(pos_2 == 3'b010))
    reset_state = 0;
    end
        
endmodule