`timescale 1ns / 1ps

module button_puller(
    input clk,
    input [2:0] pos_1,
    input [2:0] pos_2,
    input static_1,
    input static_2,
    output reg [5:0] floor_pull,
    output reg [3:0] el_pull_1,
    output reg [3:0] el_pull_2
    );
    
    always @ (posedge clk)
    begin
        floor_pull = 0;
        el_pull_1 = 0;
        el_pull_2 = 0;
        if (static_1)
        begin
            case (pos_1)
                0:
                begin
                el_pull_1 = 4'b0001;
                floor_pull = floor_pull | 6'b000001;
                end
                2:
                begin
                el_pull_1 = 4'b0010;
                floor_pull = floor_pull | 6'b000110;
                end
                4:
                begin
                el_pull_1 = 4'b0100;
                floor_pull = floor_pull | 6'b011000;
                end
                6:
                begin
                el_pull_1 = 4'b1000;
                floor_pull = floor_pull | 6'b100000;
                end
            endcase
        end
        
        if (static_2)
        begin
            case (pos_2)
                0:
                begin
                el_pull_2 = 4'b0001;
                floor_pull = floor_pull | 6'b000001;
                end
                2:
                begin
                el_pull_2 = 4'b0010;
                floor_pull = floor_pull | 6'b000110;
                end
                4:
                begin
                el_pull_2 = 4'b0100;
                floor_pull = floor_pull | 6'b011000;
                end
                6:
                begin
                el_pull_2 = 4'b1000;
                floor_pull = floor_pull | 6'b100000;
                end
            endcase
        end
   end
endmodule
