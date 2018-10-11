`timescale 1ns / 1ps

module sort_floor(  
    input   clk,
    input   [3:0]d0,
    input   [3:0]d1,
    input   [3:0]d2,
    input   [3:0]d3,
    input   [3:0]d4,
    input   [3:0]d5,
    output  reg [2:0]out
);

    integer i, j;
    reg [3:0] temp;
    reg [2:0] temp2;
    reg [3:0] array1 [5:0];
    reg [2:0] array2 [5:0];
    always @* 
    begin
    array1[0] = d0;
    array1[1] = d1;
    array1[2] = d2;
    array1[3] = d3;
    array1[4] = d4;
    array1[5] = d5;
    array2[0] = 3'b000;
    array2[1] = 3'b010;
    array2[2] = 3'b010;
    array2[3] = 3'b100;
    array2[4] = 3'b100;
    array2[5] = 3'b110;
    for (i = 5; i > 0; i = i - 1)
        begin
            for (j = 0 ; j < i; j = j + 1)
            begin
                if (array1[j] < array1[j + 1])
                begin
                    temp            = array1[j];
                    temp2           = array2[j]; 
                    array1[j]       = array1[j + 1];
                    array1[j + 1]   = temp;
                    array2[j]       = array2[j + 1];
                    array2[j + 1]   = temp2;
                end 
            end
        end
    out = array2[0];
    end
endmodule