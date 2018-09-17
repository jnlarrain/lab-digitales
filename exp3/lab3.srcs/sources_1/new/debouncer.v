// Source: http://referencedesigner.com/blog/key-debounce-implementation-in-verilog/2649/

`timescale 1ns / 1ps

module debouncer(
    input clk,
    input btn_in,
    output reg btn_out
    );
    
    parameter N = 22;      

    reg  [N-1:0]  delay_count_reg;                     
    reg  [N-1:0]  delay_count_next;
    
    reg flipflop_1, flipflop_2;                                 
    wire q_add;                                     
    wire q_reset;
    
    always @ (posedge clk)
    begin
        flipflop_1 <= btn_in;
        flipflop_2 <= flipflop_1;
        delay_count_reg <= delay_count_next;
    end
 
 
    assign q_reset = (flipflop_1 ^ flipflop_2);
                                  
    assign  q_add = ~(delay_count_reg[N-1]);     
 

    always @ (q_reset, q_add, delay_count_reg)
        begin
            case ({q_reset, q_add})
                0:
                    delay_count_next <= delay_count_reg;
                1:
                    delay_count_next <= delay_count_reg + 1;
                default:
                    delay_count_next <= 0;
            endcase
        end
 
    always @ (posedge clk)
        if(delay_count_reg[N-1] == 1'b1)
                btn_out <= flipflop_2;
        else
                btn_out <= btn_out;
endmodule
