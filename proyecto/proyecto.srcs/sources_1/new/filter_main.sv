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
    wire [3:0] matrix_border [31:0][31:0][2:0];
    
    filter_border_ale(clk, matrix_in, matrix_border);
    assign matrix_out = (sel == 0) ? matrix_in : matrix_border;
endmodule
