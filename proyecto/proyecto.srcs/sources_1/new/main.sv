`timescale 1ns / 1ps

module main(
    input clk,
    input [15:0] sw,
    input RsRx,
    output [15:0] led,
    output [7:0] JB,
    output [7:0] JC
    );
    
    wire r1;
    wire g1;
    wire b1;
    wire r2;
    wire g2;
    wire b2;
    wire a;
    wire b;
    wire c;
    wire d;
    wire clk2;
    wire stb;
    wire oe;
    
    wire [3:0] matrix_0 [31:0][31:0][2:0];
//    wire [3:0] matrix_1 [31:0][31:0][2:0];
    //wire [7:0] matrix_2 [31:0][31:0][2:0];
    
    wire pulse;
    
    assign JB[0] = r1;
    assign JB[1] = g1;
    assign JB[2] = b1;
    assign JB[3] = r2;
    assign JB[4] = g2;
    assign JB[5] = b2;
    assign JB[6] = a;
    assign JB[7] = b;
    assign JC[0] = c;
    assign JC[1] = d;
    assign JC[2] = clk2;
    assign JC[3] = stb;
    assign JC[4] = oe;
    
    wire sel;
    
    wire [7:0] data;
    wire change;
    receiver(clk, 0, RsRx, change, data);

    rx_processor(clk, sw[14:10], data, change, matrix_0, led[8], led[9]);
    
    pulse_generator(clk, pulse);
    
//    assign matrix_1 = matrix_0;
    
    //filter_main(clk, sw[2:0], sw[10:3], matrix_0, matrix_1);
    //assign matrix_1 = matrix_0;
    
//    matrix_generator(matrix);
    //matrix_4_bit_to_8_bit(clk, sel, matrix_1, matrix_2);
    
    rgb_matrix(clk, pulse, matrix_0, r1, g1, b1, r2, g2, b2, a, b, c, d, clk2, stb, oe);
    
    assign led[7:0] = data;
    assign sel = sw[15];
//    assign led[15:8] = matrix[sw[11:7]][sw[6:2]][sw[1:0]];
endmodule
