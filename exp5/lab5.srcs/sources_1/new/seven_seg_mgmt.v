`timescale 1ns / 1ps

module seven_seg_mgmt(
    input clk,
    input en,               // enable
    input [13:0] num,       // quantity
    output [3:0] s_an,      // selector segments
    output [6:0] s_seg      // segments
    );

    reg [1:0] display;
    wire [16:0] clock_divide_max = 17'b11110000100000000;
    reg [16:0] clock_divide_counter;
    wire [3:0] number;
    wire [6:0] segmentos [15:0];
    
    
    wire [3:0] mil;
    wire [3:0] cen;
    wire [3:0] dec;
    wire [3:0] uni;
    wire [13:0]aux1;
    wire [13:0]aux2;
    wire [13:0]aux3;
    wire [13:0]aux4;
    wire [13:0]aux0;
    
    wire [3:0] an_mask;


    assign aux0 = num%10;
    assign aux1 = (num%100-aux0)/10;
    assign aux2 = num%1000;
    assign aux3 = (aux2-aux1)/100;
    assign aux4 = (num - aux2)/1000;
    
    
    assign uni = num%10;
    assign dec = aux1%10; 
    assign cen = aux3%10;
    assign mil = aux4;
   
    assign an_mask = num > 999 ? 4'b1111 : num > 99 ? 4'b0111 : num > 9 ? 4'b0011 : 4'b0001;
    assign s_an = (en ? (display[1] ? (display[0] ? 4'b1011 : 4'b0111) : (display[0] ? 4'b1110 : 4'b1101)) : 4'b0000) | ~an_mask;
    assign number = display[1] ? (display[0] ? cen : mil ) : (display[0] ? uni : dec);
    
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
