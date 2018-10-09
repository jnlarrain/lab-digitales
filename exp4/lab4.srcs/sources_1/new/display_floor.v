`timescale 1ns / 1ps
/*


*/
module display_floor(
    input clk,
    input  [2:0] pos_1,     // position firts elevator 1
    input  [2:0] pos_2,     // position second elevator 2
    output [3:0] s_an,      // selector segments
    output [6:0] s_seg      // segments
    );

    reg [1:0] display;
    wire [16:0] clock_divide_max = 17'b11110000100000000;
    reg [16:0] clock_divide_counter;
    wire [2:0] number;
    wire [6:0] segmentos [4:0];
    wire [2:0]sig1;
    wire [2:0]sig2;
    wire [2:0]num1;
    wire [2:0]num2;
    
    assign num1 = pos_1[2] ? (pos_1[1] ? 3'b010 : 3'b001): 3'b000;    
    assign num2 = pos_2[2] ? (pos_2[1] ? 3'b010 : 3'b001): 3'b000;
    assign sig1 = pos_1[2] ? 3'b100 :(pos_1[1] ? 3'b100 : 3'b011);
    assign sig2 = pos_2[2] ? 3'b100 :(pos_2[1] ? 3'b100 : 3'b011);
    assign s_an = display[1] ? (display[0] ? 4'b1011 : 4'b0111) : (display[0] ? 4'b1110 : 4'b1101); // change display
    assign number = display[1] ? (display[0] ? num1 : sig1) : (display[0] ? num2 : sig2);
    
    assign {segmentos[0],
            segmentos[1],
            segmentos[2],
            segmentos[3],
            segmentos[4]} = {7'b1111001,        // numero 1
                             7'b0100100,        // numero 2
                             7'b0110000,        // numero 3
                             7'b0111111,        // signo -
                             7'b1111111};       // todo apagado
        
    assign s_seg = segmentos[number];

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
