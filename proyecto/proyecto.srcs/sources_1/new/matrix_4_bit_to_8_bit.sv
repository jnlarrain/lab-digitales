`timescale 1ns / 1ps

module matrix_4_bit_to_8_bit(
    input clk,
    input sel,
    input [3:0] matrix_in [31:0][31:0][2:0],
    output reg [7:0] matrix_out [31:0][31:0][2:0]
    );
    
    integer row_num;
    integer col_num;
    
    always @ (posedge clk)
    begin
        for(row_num = 0; row_num < 32; row_num = row_num + 1)
        begin
            for(col_num = 0; col_num < 32; col_num = col_num + 1)
            begin
                if (sel)
                begin
                    case (matrix_in[row_num][col_num][0])
                    0: matrix_out[row_num][col_num][0] = 0;
                    1: matrix_out[row_num][col_num][0] = 2;
                    2: matrix_out[row_num][col_num][0] = 4;
                    3: matrix_out[row_num][col_num][0] = 7;
                    4: matrix_out[row_num][col_num][0] = 11;
                    5: matrix_out[row_num][col_num][0] = 18;
                    6: matrix_out[row_num][col_num][0] = 30;
                    7: matrix_out[row_num][col_num][0] = 40;
                    8: matrix_out[row_num][col_num][0] = 50;
                    9: matrix_out[row_num][col_num][0] = 65;
                    10: matrix_out[row_num][col_num][0] = 80;
                    11: matrix_out[row_num][col_num][0] = 100;
                    12: matrix_out[row_num][col_num][0] = 125;
                    13: matrix_out[row_num][col_num][0] = 160;
                    14: matrix_out[row_num][col_num][0] = 200;
                    15: matrix_out[row_num][col_num][0] = 255;
                    endcase
                    
                    case (matrix_in[row_num][col_num][1])
                    0: matrix_out[row_num][col_num][1] = 0;
                    1: matrix_out[row_num][col_num][1] = 2;
                    2: matrix_out[row_num][col_num][1] = 4;
                    3: matrix_out[row_num][col_num][1] = 7;
                    4: matrix_out[row_num][col_num][1] = 11;
                    5: matrix_out[row_num][col_num][1] = 18;
                    6: matrix_out[row_num][col_num][1] = 30;
                    7: matrix_out[row_num][col_num][1] = 40;
                    8: matrix_out[row_num][col_num][1] = 50;
                    9: matrix_out[row_num][col_num][1] = 65;
                    10: matrix_out[row_num][col_num][1] = 80;
                    11: matrix_out[row_num][col_num][1] = 100;
                    12: matrix_out[row_num][col_num][1] = 125;
                    13: matrix_out[row_num][col_num][1] = 160;
                    14: matrix_out[row_num][col_num][1] = 200;
                    15: matrix_out[row_num][col_num][1] = 255;
                    endcase
                    
                    case (matrix_in[row_num][col_num][2])
                    0: matrix_out[row_num][col_num][2] = 0;
                    1: matrix_out[row_num][col_num][2] = 2;
                    2: matrix_out[row_num][col_num][2] = 4;
                    3: matrix_out[row_num][col_num][2] = 7;
                    4: matrix_out[row_num][col_num][2] = 11;
                    5: matrix_out[row_num][col_num][2] = 18;
                    6: matrix_out[row_num][col_num][2] = 30;
                    7: matrix_out[row_num][col_num][2] = 40;
                    8: matrix_out[row_num][col_num][2] = 50;
                    9: matrix_out[row_num][col_num][2] = 65;
                    10: matrix_out[row_num][col_num][2] = 80;
                    11: matrix_out[row_num][col_num][2] = 100;
                    12: matrix_out[row_num][col_num][2] = 125;
                    13: matrix_out[row_num][col_num][2] = 160;
                    14: matrix_out[row_num][col_num][2] = 200;
                    15: matrix_out[row_num][col_num][2] = 255;
                    endcase
                end
                else
                begin
                    matrix_out[row_num][col_num][0] = matrix_in[row_num][col_num][0] << 4;
                    matrix_out[row_num][col_num][1] = matrix_in[row_num][col_num][1] << 4;
                    matrix_out[row_num][col_num][2] = matrix_in[row_num][col_num][2] << 4;
                end
            end
        end
    end
endmodule
