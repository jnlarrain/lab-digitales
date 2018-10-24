`timescale 1ns / 1ps

module keypad(
    input clk,
    input pulse,
    input [3:0] JC,
    output [3:0] JB,
    output reg [15:0] btns
    );
    
    reg [1:0] state;
    
    always @ (posedge clk)
    begin
        if (pulse)
        begin
            state = state + 1;
            if ( state == 0 )
                begin
                btns[3:0] = JC[3:0];
                end
            else if ( state == 1 )
                begin
                btns[7:4] = JC[3:0];
                end
            else if ( state == 2 )
                begin
                btns[11:8] = JC[3:0];
                end
            else if ( state == 3 )
                begin
                btns[15:12] = JC[3:0];
                end
        end
    end
    
    assign JB[3:0] = state[1] ? (state[0] ? 4'b0111 : 4'b1011) : (state[0] ? 4'b1101 : 4'b1110);
endmodule