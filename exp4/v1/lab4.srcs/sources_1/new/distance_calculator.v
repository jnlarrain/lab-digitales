module distance_calculator(
    input [2:0]pos,                       // posicion del elevador 2
    input [5:0]floor,                       // peticion exclusiva de distancia
    input dir,                            // direccion elevador 2: 1 para arriba 0 para abajo
    input static,                         // estado estatico elevador 2 (True or False)
    output [3:0]dis                       // distancia de asensor 2 a piso pedido
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
    wire direction;
    wire [2:0]pos_aux;
    
    
    wire [3:0]arriba_abajo = 12-pos-pos_aux;    
    wire [3:0]abajo_arriba = pos + pos_aux;    
    wire [3:0]distancia;    
    
    assign direction = floor[0]|floor[2]|floor[4];
    assign pos_aux = floor[0] ? 3'b000 : (floor[1]|floor[2] ? 3'b010 : (floor[3]|floor[4] ? 3'b100 : 3'b110));
    
    assign distancia = (pos_aux>pos) ? (direction&dir ? pos_aux-pos : (dir ? 12-(pos_aux+pos) : (direction ? pos+pos_aux : 6+pos+pos_aux))) : 
        (direction&dir ? 6+pos+pos_aux : (dir ? 12 -(pos_aux+pos) :(direction ? pos+pos_aux : 6+pos+pos_aux)));
    
    assign dis = floor==0 ? 4'b1111 : distancia;
endmodule