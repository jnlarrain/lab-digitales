`timescale 1ns / 1ps

module rx_processor(
    input clk,
    input [7:0] data,
    input change,
    output reg [7:0] matrix [31:0][31:0][2:0]
    );
    
    integer row_num;
    integer col_num;
    
    reg listen;
    reg [10:0] count;
    reg byte_count;
    reg [7:0] first_byte;
    
    
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
            end
            else
            begin
                if (~count)
                begin
                    first_byte = data;
                end
                else
                begin
                    if (listen)
                    begin
                        red = first_byte[5:2] << 4;
                        green = {first_byte[1:0], data[5:4]} << 4;
                        blue = data[3:0] << 4;
                        
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
                end
                byte_count = byte_count + 1;
            end
        end
    end
endmodule
