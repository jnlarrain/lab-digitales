`timescale 1ns / 1ps

module filter_main(
    input clk,
    input [2:0] sel,
    input [7:0] factor,
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
    wire [3:0] matrix_gamma [31:0][31:0][2:0];
    
    filter_border_ale(clk, matrix_in, matrix_border);
    filter_gamma(matrix_in, clk, factor, matrix_gamma);
    assign matrix_out = (sel == 0) ? matrix_in : 
                        (sel == 1) ? matrix_border :
                        matrix_gamma;
endmodule
