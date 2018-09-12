`timescale 1ns / 1ps

module seven_seg(
    input [1:0] data,
    input en,
    output [3:0] an,
    output [6:0] seg
    );

assign an = en ? 4'b1110 : 4'b1111;
assign  seg = data[1] ? (data[0] ? 'b1111111 : 'b0110000): (data[0] ?  'b0100100 : 'b1111001);

endmodule