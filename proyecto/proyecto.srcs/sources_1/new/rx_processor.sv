`timescale 1ns / 1ps

module rx_processor(
    input clk,
    input [3:0] sel,
    input sel_2,
    input [7:0] data,
    input change,
    output reg [7:0] matrix [31:0][31:0][2:0],
    output listen_out,
    output byte_count_out
    );
    
    integer row_num;
    integer col_num;
    
    reg listen;
    reg [10:0] count;
    reg byte_count;
    reg [7:0] first_byte;
    
    assign listen_out = listen;
    assign byte_count_out = byte_count;
    
    
    reg [7:0] red;
    reg [7:0] green;
    reg [7:0] blue;
    
    reg [5:0] row;
    reg [5:0] col;
    
    initial
    begin
        listen = 0;
        count = 0;
        byte_count = 0;
        first_byte = 0;
        red = 0;
        green = 0;
        blue = 0;
        row = 0;
        col = 0;
        for(row_num = 0; row_num < 32; row_num = row_num + 1)
        begin
            for(col_num = 0; col_num < 32; col_num = col_num + 1)
            begin
                matrix[row_num][col_num][0] = 128;
                matrix[row_num][col_num][1] = 128;
                matrix[row_num][col_num][2] = 128;
            end
        end
    end
    
    always @ (posedge clk)
    begin
        if (change)
        begin
            if (data == 0)
            begin
                listen = 1;
                count = 0;
                first_byte = 0;
                row = 0;
                col = 0;
                byte_count = 0;
            end
            else if (listen)
            begin
                if (~byte_count)
                begin
                    first_byte = data;
                end
                else
                begin
                    red = first_byte[5:2];
                    green = {first_byte[1:0], data[5:4]};
                    blue = data[3:0];
                    
                    if (sel == 1)
                    begin
                        red = 15 - red;
                        green = 15 - green;
                        blue = 15 - blue;
                    end
                    else if (sel == 2)
                    begin
                        green = blue;
                        blue = green;
                    end
                    else if (sel == 3)
                    begin
                        red = green;
                        green = red;
                    end
                    else if (sel == 4)
                    begin
                        red = green;
                        green = blue;
                        blue = red;
                    end
                    else if (sel == 5)
                    begin
                        red = blue;
                        green = red;
                        blue = green;
                    end
                    else if (sel == 6)
                    begin
                        red = blue;
                        blue = red;
                    end
                    
                    if (sel_2)
                    begin           
                        case (red)
                        0: red = 0;
                        1: red = 2;
                        2: red = 4;
                        3: red = 7;
                        4: red = 11;
                        5: red = 18;
                        6: red = 30;
                        7: red = 40;
                        8: red = 50;
                        9: red = 65;
                        10: red = 80;
                        11: red = 100;
                        12: red = 125;
                        13: red = 160;
                        14: red = 200;
                        15: red = 255;
                        endcase
                    
                        case (green)
                        0: green = 0;
                        1: green = 2;
                        2: green = 4;
                        3: green = 7;
                        4: green = 11;
                        5: green = 18;
                        6: green = 30;
                        7: green = 40;
                        8: green = 50;
                        9: green = 65;
                        10: green = 80;
                        11: green = 100;
                        12: green = 125;
                        13: green = 160;
                        14: green = 200;
                        15: green = 255;
                        endcase
                
                        case (blue)
                        0: blue = 0;
                        1: blue = 2;
                        2: blue = 4;
                        3: blue = 7;
                        4: blue = 11;
                        5: blue = 18;
                        6: blue = 30;
                        7: blue = 40;
                        8: blue = 50;
                        9: blue = 65;
                        10: blue = 80;
                        11: blue = 100;
                        12: blue = 125;
                        13: blue = 160;
                        14: blue = 200;
                        15: blue = 255;
                        endcase
                    end
                    else
                    begin
                        red = red << 4;
                        green = green << 4;
                        blue = blue << 4;
                    end
                    
                    
                    matrix[row][col][0] = red;
                    matrix[row][col][1] = green;
                    matrix[row][col][2] = blue;
//                    count = count + 1;
                    col = col + 1;
                    if (col == 32)
                    begin
                        col = 0;
                        row = row + 1;
                    end
                    if (row == 32)
                    begin
                        row = 0;
                        col = 0;
                        listen = 0;
                    end
                end
                byte_count = byte_count + 1;
            end
        end
    end
endmodule
