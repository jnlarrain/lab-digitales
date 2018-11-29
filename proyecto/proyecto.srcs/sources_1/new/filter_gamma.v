`timescale 1ns / 1ps

module filter_gamma(
    input [3:0] old_matrix [31:0][31:0][2:0],
    input clk,
    input [7:0]factor,
    output reg [3:0] matrix [31:0][31:0][2:0]
    );

    integer row_num;
    integer col_num;
    integer value1;
    integer value2;
    integer value3;
        
    
always @(posedge clk)
    begin
        for(row_num = 0; row_num < 32; row_num = row_num + 1)
        begin
            for(col_num = 0; col_num < 32; col_num = col_num + 1)
            begin
                value1 = old_matrix[row_num][col_num][0]**(0.01*factor);
                matrix[row_num][col_num][0] = (value1 < 16)? value1 : 15;   
                value2 = old_matrix[row_num][col_num][1]**(0.01*factor);
                matrix[row_num][col_num][1] = (value2 < 16)? value2 : 15; 
                value3 = old_matrix[row_num][col_num][2]**(0.01*factor);
                matrix[row_num][col_num][2] = (value3 < 16)? value3 : 15;              
            end
        end
    end
endmodule