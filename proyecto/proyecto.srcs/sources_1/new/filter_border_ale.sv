`timescale 1ns / 1ps

module filter_border_ale(
    input clk,
    input [7:0] matrix_in [31:0][31:0][2:0],
    output reg [7:0] matrix_out [31:0][31:0][2:0]
    );
    
    integer row_num;
    integer col_num;
    integer row_num_new;
//    integer col_num_new;
    
    always @ (posedge clk)
    begin
        for(row_num = 0; row_num < 32; row_num = row_num + 1)
        begin
            for(col_num = 0; col_num < 32; col_num = col_num + 1)
            begin
                row_num_new = (row_num == 31) ? row_num : row_num + 1;
//                col_num_new = (col_num == 31) ? col_num : col_num + 1;
                matrix_out[row_num][col_num][0] = (matrix_in[row_num][col_num][0] > matrix_in[row_num_new][col_num][0]) ? (matrix_in[row_num][col_num][0] - matrix_in[row_num_new][col_num][0]) : (matrix_in[row_num_new][col_num][0] - matrix_in[row_num][col_num][0]);
                matrix_out[row_num][col_num][1] = (matrix_in[row_num][col_num][1] > matrix_in[row_num_new][col_num][1]) ? (matrix_in[row_num][col_num][1] - matrix_in[row_num_new][col_num][1]) : (matrix_in[row_num_new][col_num][1] - matrix_in[row_num][col_num][1]);
                matrix_out[row_num][col_num][2] = (matrix_in[row_num][col_num][2] > matrix_in[row_num_new][col_num][2]) ? (matrix_in[row_num][col_num][2] - matrix_in[row_num_new][col_num][2]) : (matrix_in[row_num_new][col_num][2] - matrix_in[row_num][col_num][2]);
            end
        end
    end
endmodule
