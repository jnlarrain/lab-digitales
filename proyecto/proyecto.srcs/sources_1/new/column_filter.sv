`timescale 1ns / 1ps

module colum_filter(
    input [3:0] old_matrix [31:0][31:0][2:0],
    input clk,
    output reg [3:0] matrix [31:0][31:0][2:0]
    );


    integer row_num;
    integer col_num;
    integer col;
    integer row;
    integer value1;
    integer value2;
    integer value3;   

    
always @(posedge clk)
    begin
        for(row_num = 0; row_num < 32; row_num = row_num + 1)
        begin
            for(col_num = 0; col_num < 32; col_num = col_num + 1)
            begin
                col = (col_num - 1 > 0) ? col_num-1 : 0;
                value1 = old_matrix[row_num][col_num][0]-old_matrix[row_num][col][0];
                value2 = old_matrix[row_num][col_num][1]-old_matrix[row_num][col][1];
                value3 = old_matrix[row_num][col_num][2]-old_matrix[row_num][col][2];
                matrix[row_num][col_num][0] = (value1 > 0)? value1 : 0;                
                matrix[row_num][col_num][1] = (value2 > 0)? value2 : 0;                
                matrix[row_num][col_num][2] = (value3 > 0)? value3 : 0;
            end
        end
    end
endmodule