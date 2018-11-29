`timescale 1ns / 1ps

module filter_main(
    input clk,
    input [5:0] sel,
    input [3:0] matrix_in [31:0][31:0][2:0],
    output [3:0] matrix_out [31:0][31:0][2:0]
    );
    
//    always @ (posedge clk)
//    begin
//        case (sel)
//        0: matrix_out = matrix_in;
//        endcase
//    end

    assign matrix_out = matrix_in;
endmodule
