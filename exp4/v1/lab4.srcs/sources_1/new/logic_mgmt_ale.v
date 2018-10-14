`timescale 1ns / 1ps


module logic_mgmt_ale(
    input clk,
    input [2:0] pos_1,
    input [2:0] pos_2,
    input [5:0] floor_state,
    input [3:0] el_state_1,
    input [3:0] el_state_2,
    output reg [2:0] set_1,
    output reg [2:0] set_2
    );
    
    always @ (posedge clk)
    begin
        if (el_state_1 & 4'b0001)
        begin
            set_1 = 0;
        end
        
        else if (floor_state & 6'b000001)
        begin
            set_1 = 0;
        end
        
        else if (el_state_1 & 4'b0010)
        begin
            set_1 = 2;
        end
                
        else if (floor_state & 6'b000100)
        begin
            set_1 = 2;
        end
        
        else if (el_state_1 & 4'b0100)
        begin
            set_1 = 4;
        end
        
        else if (floor_state & 6'b010000)
        begin
            set_1 = 4;
        end
        
        else if (el_state_1 & 4'b1000)
        begin
            set_1 = 6;
        end
        
        else
        begin
            set_1 = 0;
        end
        
        
        if (el_state_2 & 4'b1000)
        begin
            set_2 = 6;
        end
                    
        else if (floor_state & 6'b100000)
        begin
            set_2 = 6;
        end
        
        else if (el_state_2 & 4'b0100)
        begin
            set_2 = 4;
        end
        
        else if (floor_state & 6'b001000)
        begin
            set_2 = 4;
        end
        
        else if (el_state_2 & 4'b0010)
        begin
            set_2 = 2;
        end
        
        else if (floor_state & 6'b000010)
        begin
            set_2 = 2;
        end
        
        else if (el_state_2 & 4'b0001)
        begin
            set_2 = 0;
        end
        
        else
        begin
            set_2 = 6;
        end
    end
endmodule
