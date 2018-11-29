//`timescale 1ns / 1ps

//module main(
//    input clk,
//    input [15:0] sw,
//    output [15:0] led,
//    output [7:0] JB,
//    output [7:0] JC
//    );
    
//    wire r1;
//    wire g1;
//    wire b1;
//    wire r2;
//    wire g2;
//    wire b2;
//    wire a;
//    wire b;
//    wire c;
//    wire d;
//    wire clk2;
//    wire stb;
//    wire oe;
    
//    assign JB[0] = r1;
//    assign JB[1] = g1;
//    assign JB[2] = b1;
//    assign JB[3] = r2;
//    assign JB[4] = g2;
//    assign JB[5] = b2;
//    assign JB[6] = a;
//    assign JB[7] = b;
//    assign JC[0] = c;
//    assign JC[1] = d;
//    assign JC[2] = clk2;
//    assign JC[3] = stb;
//    assign JC[4] = oe;
    
//    wire [24575:0] matrix;
    
//    matrix_generator(clk, matrix);
    
//    rgb_matrix(clk, matrix, r1, g1, b1, r2, g2, b2, a, b, c, d, clk2, stb, oe);
     
//    assign led = matrix[15:0];
//endmodule
