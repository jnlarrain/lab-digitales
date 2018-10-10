module distance_calculator(
    input [2:0]pos_1,                       // posicion del elevador 1
    input [2:0]pos_2,                       // posicion del elevador 2
    input [5:0]floor,                       // peticion exclusiva de distancia
    input dir_1,                            // direccion elevador 1: 1 para arriba 0 para abajo
    input dir_2,                            // direccion elevador 2: 1 para arriba 0 para abajo
    input static_1,                         // estado estatico elevador 1 (True or False)
    input static_2,                         // estado estatico elevador 2 (True or False)
    output [3:0]dis_1,                      // distancia de asensor 1 a piso pedido
    output [3:0]dis_2                       // distancia de asensor 2 a piso pedido
    );
    /*
    floor es un vector que alberga de big a little lo siguiente:
    piso 3 direccion hacia abajo
    piso 2 direccion hacia arriba
    piso 2 direccion hacia abajo
    piso 1 direccion hacia arriba
    piso 1 direccion hacia abajo
    piso -1 direccion hacia arriba
    que corresponde a las peticiones en cada piso
    */
    wire [2:0]dist_extra_1;
    wire [2:0]dist_extra_2;
    wire direction;
    wire [2:0]pos_aux;
    
    assign direction = floor[0]|floor[2]|floor[4] ? 1'b1 : 1'b0;
    assign pos_aux = floor[0] ? 3'b000 : (floor[1]|floor[2] ? 3'b010 : (floor[3]|floor[4] ? 3'b100 : 3'b110));
    assign dist_extra_1 = static_1 ? 3'b000 : direction&dir_1 ? 3'b000 : (direction ? 3'b110-pos_1 :(dir_1 ? pos_1 : 3'b000));
    assign dist_extra_2 = static_2 ? 3'b000 : direction&dir_2 ? 3'b000 : (direction ? 3'b110-pos_2 :(dir_2 ? pos_2 : 3'b000));
    assign dis_1 = (pos_aux > pos_1)? pos_aux-pos_1+dist_extra_1 : pos_1-pos_aux+dist_extra_1;
    assign dis_2 = (pos_aux > pos_2)? pos_aux-pos_2+dist_extra_2 : pos_2-pos_aux+dist_extra_2;
endmodule