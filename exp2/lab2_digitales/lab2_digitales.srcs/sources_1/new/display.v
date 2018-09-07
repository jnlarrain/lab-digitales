`timescale 1ns / 1ps


module display(
    input [1:0] display,
    output [6:0] segmento
    );


assign  segmento = display[1] ? (display[0] ? 'b1001111 : 'b0000000 ): (display[0] ?  'b1111001 : 'b0100100);

endmodule