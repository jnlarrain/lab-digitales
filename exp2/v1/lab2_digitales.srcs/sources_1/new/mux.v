module mux(
input [7:0] a, b, c, 
input [1:0] sel,
output [7:0] salida
);


assign salida = sel[1] ? (sel[0] ? a : b) : (sel[0]? 'b0000000 : c);


endmodule
