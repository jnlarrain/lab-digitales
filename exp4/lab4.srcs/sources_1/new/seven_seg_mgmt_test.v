`timescale 1ns / 1ps
/*
qty_1 y qty_2 dos son variables de 7 bits. 
El número decimal de cada variable será mostrado en los displays de siete segmentos. 
Se debe tomar en cuenta la presencia de un ambulancia en la calle vertical.
*/
module seven_seg_mgmt_test(
    input clk,
    input en,               // enable
    input [6:0] qty_1,      // quantity 1
    input [6:0] qty_2,      // quantity 2
    output [3:0] s_an,      // selector segments
    output [6:0] s_seg      // segments
    );

    reg [1:0] display;
    wire [16:0] clock_divide_max = 17'b11110000100000000;
    reg [16:0] clock_divide_counter;
    wire [3:0] number;
    wire [6:0] segmentos [15:0];
    wire [3:0] dec1;
    wire [3:0] dec2;
    wire [3:0] uni1;
    wire [3:0] uni2;


    assign uni1 = (qty_1)%10;
    assign uni2 = qty_2%10;
    assign dec1 = (qty_1 - uni1)/10;
    assign dec2 = (qty_2 - uni2)/10;
    assign s_an = en ? (display[1] ? (display[0] ? 4'b1011 : 4'b0111) : (display[0] ? 4'b1110 : 4'b1101)) : 4'b0000;
    assign number = display[1] ? (display[0] ? uni1 : dec1) : (display[0] ? uni2 : dec2);
    
    assign {segmentos[0],
            segmentos[1],
            segmentos[2],
            segmentos[3],
            segmentos[4],
            segmentos[5],
            segmentos[6],
            segmentos[7],
            segmentos[8],
            segmentos[9],
            segmentos[10],
            segmentos[11],
            segmentos[12],
            segmentos[13],
            segmentos[14],
            segmentos[15]} = {7'b1000000,
                              7'b1111001,
                              7'b0100100,
                              7'b0110000,
                              7'b0011001,
                              7'b0010010,
                              7'b0000010,
                              7'b1111000,
                              7'b0000000,
                              7'b0010000,
                              7'b0001000,
                              7'b0000011,
                              7'b1000110,
                              7'b0100001,
                              7'b0000110,
                              7'b0001110};
        
    assign s_seg = en ? segmentos[number] : 7'b1111111;

    always @ (posedge clk)
    begin
        if (clock_divide_counter >= clock_divide_max)
            begin
            clock_divide_counter = 17'b00000000000000000;
            display = display + 1;
            end
        else
            clock_divide_counter = clock_divide_counter + 1;
    end

endmodule