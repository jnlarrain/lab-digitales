`timescale 1ns / 1ps

module rgb_matrix(
    input clk,
    input pulse,
    input [7:0] matrix [31:0][31:0][2:0],
    output reg r1,
    output reg g1,
    output reg b1,
    output reg r2,
    output reg g2,
    output reg b2,
    output reg a,
    output reg b,
    output reg c,
    output reg d,
    output reg clk2,
    output reg stb,
    output reg oe
    );
        
    integer row_num;
    integer col_num;
    
    reg [2:0] bit_num;
    reg [8:0] remaining;
    
    reg row_ready;
    reg latch_up;
    
    initial
    begin
    r1 = 0;
    g1 = 0;
    b1 = 0;
    r2 = 0;
    g2 = 0;
    b2 = 0;
    a = 0;
    b = 0;
    c = 0;
    d = 0;
    clk2 = 0;
    stb = 0;
    oe = 0;
    
    row_num = 0;
    col_num = 0;
    
    bit_num = 0;
    remaining = 1;
    
    row_ready = 0;
    latch_up = 0;
    end
    
    always @ (posedge clk)
    begin
        if (pulse)
        begin
            if (remaining == 0)
            begin
            bit_num = bit_num + 1;
            if (bit_num == 8)
            begin
                bit_num = 0;
            end
            remaining = 1 << bit_num;
            end
            
            if (~row_ready)
            begin
                if (clk2)
                begin
                    r1 = matrix[row_num][col_num][0][bit_num];
                    g1 = matrix[row_num][col_num][1][bit_num];
                    b1 = matrix[row_num][col_num][2][bit_num];
                    r2 = matrix[row_num + 16][col_num][0][bit_num];
                    g2 = matrix[row_num + 16][col_num][1][bit_num];
                    b2 = matrix[row_num + 16][col_num][2][bit_num];
                    col_num = col_num + 1;
                    if (col_num == 33)
                    begin
                        col_num = 0;
                        row_ready = 1;
                        clk2 = 0;
                    end
                end
            clk2 = clk2 + 1; // Temp
            end
            else
            begin
                if (~latch_up)
                begin
                    latch_up = 1;
                    oe = 1;
                    {d, c, b, a} = row_num;
                    row_num = row_num + 1;
                    if (row_num == 16)
                    begin
                        row_num = 0;
                    end
                    stb = 1;
                end
                else
                begin
                    latch_up = 0;
                    row_ready = 0;
                    stb = 0;
                    oe = 0;
                    remaining = remaining - 1;
                end
            end
        end
    end
    
endmodule
