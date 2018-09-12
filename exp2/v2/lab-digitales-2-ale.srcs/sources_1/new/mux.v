`timescale 1ns / 1ps

module mux(
    input [23:0] data_in,
    input [1:0] sel,
    output [7:0] data_out
    );
    
    assign data_out = sel[1] ? (data_in[7:0]) : (sel[0] ? data_in[15:8] : data_in[23:16]);
    
endmodule
