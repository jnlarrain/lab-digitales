`timescale 1ns / 1ps

module matrix_generator(
    output reg [7:0] matrix [31:0][31:0][2:0]
    );
        
    integer row_num;
    integer col_num;
    
    initial
    begin
        for(row_num = 0; row_num < 32; row_num = row_num + 1)
        begin
            for(col_num = 0; col_num < 32; col_num = col_num + 1)
            begin
                matrix[row_num][col_num][0] = 255 - col_num * 4;
                matrix[row_num][col_num][1] = row_num * 7;
                matrix[row_num][col_num][2] = col_num * 6;
            end
        end
    end
endmodule
