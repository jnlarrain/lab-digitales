`timescale 1ns / 1ps

module memoria(
    input [7:0] address,
    output [23:0] data
    );
    
wire [23:0] mem [255:0];

assign {mem[0],
        mem[1],
        mem[2],
        mem[3],
        mem[4],
        mem[5],
        mem[6],
        mem[7],
        mem[8],
        mem[9],
        mem[10],
        mem[11],
        mem[12],
        mem[13],
        mem[14],
        mem[15],
        mem[16],
        mem[17],
        mem[18],
        mem[19],
        mem[20],
        mem[21],
        mem[22],
        mem[23],
        mem[24],
        mem[25],
        mem[26],
        mem[27],
        mem[28],
        mem[29],
        mem[30],
        mem[31],
        mem[32],
        mem[33],
        mem[34],
        mem[35],
        mem[36],
        mem[37],
        mem[38],
        mem[39],
        mem[40],
        mem[41],
        mem[42],
        mem[43],
        mem[44],
        mem[45],
        mem[46],
        mem[47],
        mem[48],
        mem[49],
        mem[50],
        mem[51],
        mem[52],
        mem[53],
        mem[54],
        mem[55],
        mem[56],
        mem[57],
        mem[58],
        mem[59],
        mem[60],
        mem[61],
        mem[62],
        mem[63],
        mem[64],
        mem[65],
        mem[66],
        mem[67],
        mem[68],
        mem[69],
        mem[70],
        mem[71],
        mem[72],
        mem[73],
        mem[74],
        mem[75],
        mem[76],
        mem[77],
        mem[78],
        mem[79],
        mem[80],
        mem[81],
        mem[82],
        mem[83],
        mem[84],
        mem[85],
        mem[86],
        mem[87],
        mem[88],
        mem[89],
        mem[90],
        mem[91],
        mem[92],
        mem[93],
        mem[94],
        mem[95],
        mem[96],
        mem[97],
        mem[98],
        mem[99],
        mem[100],
        mem[101],
        mem[102],
        mem[103],
        mem[104],
        mem[105],
        mem[106],
        mem[107],
        mem[108],
        mem[109],
        mem[110],
        mem[111],
        mem[112],
        mem[113],
        mem[114],
        mem[115],
        mem[116],
        mem[117],
        mem[118],
        mem[119],
        mem[120],
        mem[121],
        mem[122],
        mem[123],
        mem[124],
        mem[125],
        mem[126],
        mem[127],
        mem[128],
        mem[129],
        mem[130],
        mem[131],
        mem[132],
        mem[133],
        mem[134],
        mem[135],
        mem[136],
        mem[137],
        mem[138],
        mem[139],
        mem[140],
        mem[141],
        mem[142],
        mem[143],
        mem[144],
        mem[145],
        mem[146],
        mem[147],
        mem[148],
        mem[149],
        mem[150],
        mem[151],
        mem[152],
        mem[153],
        mem[154],
        mem[155],
        mem[156],
        mem[157],
        mem[158],
        mem[159],
        mem[160],
        mem[161],
        mem[162],
        mem[163],
        mem[164],
        mem[165],
        mem[166],
        mem[167],
        mem[168],
        mem[169],
        mem[170],
        mem[171],
        mem[172],
        mem[173],
        mem[174],
        mem[175],
        mem[176],
        mem[177],
        mem[178],
        mem[179],
        mem[180],
        mem[181],
        mem[182],
        mem[183],
        mem[184],
        mem[185],
        mem[186],
        mem[187],
        mem[188],
        mem[189],
        mem[190],
        mem[191],
        mem[192],
        mem[193],
        mem[194],
        mem[195],
        mem[196],
        mem[197],
        mem[198],
        mem[199],
        mem[200],
        mem[201],
        mem[202],
        mem[203],
        mem[204],
        mem[205],
        mem[206],
        mem[207],
        mem[208],
        mem[209],
        mem[210],
        mem[211],
        mem[212],
        mem[213],
        mem[214],
        mem[215],
        mem[216],
        mem[217],
        mem[218],
        mem[219],
        mem[220],
        mem[221],
        mem[222],
        mem[223],
        mem[224],
        mem[225],
        mem[226],
        mem[227],
        mem[228],
        mem[229],
        mem[230],
        mem[231],
        mem[232],
        mem[233],
        mem[234],
        mem[235],
        mem[236],
        mem[237],
        mem[238],
        mem[239],
        mem[240],
        mem[241],
        mem[242],
        mem[243],
        mem[244],
        mem[245],
        mem[246],
        mem[247],
        mem[248],
        mem[249],
        mem[250],
        mem[251],
        mem[252],
        mem[253],
        mem[254],
        mem[255]} = {24'b100000000000000011111111,
                     24'b100000110000001011111111,
                     24'b100001100000010011111111,
                     24'b100010010000011011111111,
                     24'b100011000000100011111111,
                     24'b100011110000101011111111,
                     24'b100100100000110011111111,
                     24'b100101010000111011111111,
                     24'b100110000001000011111111,
                     24'b100110110001001011111111,
                     24'b100111100001010011111111,
                     24'b101000100001011011111111,
                     24'b101001010001100011111111,
                     24'b101001110001101011111111,
                     24'b101010100001110011111111,
                     24'b101011010001111011111111,
                     24'b101100000010000011111111,
                     24'b101100110010001011111111,
                     24'b101101100010010011111111,
                     24'b101110010010011011111111,
                     24'b101111000010100011111111,
                     24'b101111100010101011111111,
                     24'b110000010010110011111111,
                     24'b110001000010111011111111,
                     24'b110001100011000011111111,
                     24'b110010010011001011111111,
                     24'b110010110011010011111111,
                     24'b110011100011011011111111,
                     24'b110100000011100011111111,
                     24'b110100110011101011111111,
                     24'b110101010011110011111111,
                     24'b110101110011111011111111,
                     24'b110110100100000011111111,
                     24'b110111000100001011111111,
                     24'b110111100100010011111111,
                     24'b111000000100011011111111,
                     24'b111000100100100011111111,
                     24'b111001000100101011111111,
                     24'b111001100100110011111111,
                     24'b111010000100111011111111,
                     24'b111010100101000011111111,
                     24'b111010110101001011111111,
                     24'b111011010101010011111111,
                     24'b111011100101011011111111,
                     24'b111100000101100011111111,
                     24'b111100010101101011111111,
                     24'b111100110101110011111111,
                     24'b111101000101111011111111,
                     24'b111101010110000011111111,
                     24'b111101100110001011111111,
                     24'b111110000110010011111111,
                     24'b111110010110011011111111,
                     24'b111110100110100011111111,
                     24'b111110100110101011111111,
                     24'b111110110110110011111111,
                     24'b111111000110111011111111,
                     24'b111111010111000011111111,
                     24'b111111010111001011111111,
                     24'b111111100111010011111111,
                     24'b111111100111011011111111,
                     24'b111111100111100011111111,
                     24'b111111110111101011111111,
                     24'b111111110111110011111111,
                     24'b111111110111111011111111,
                     24'b111111111000000011111111,
                     24'b111111111000000111111111,
                     24'b111111111000001111111111,
                     24'b111111111000010111111111,
                     24'b111111101000011111111111,
                     24'b111111101000100111111111,
                     24'b111111101000101111111111,
                     24'b111111011000110111111111,
                     24'b111111011000111111111111,
                     24'b111111001001000111111111,
                     24'b111110111001001111111111,
                     24'b111110101001010111111111,
                     24'b111110101001011111111111,
                     24'b111110011001100111111111,
                     24'b111110001001101111111111,
                     24'b111101101001110111111111,
                     24'b111101011001111111111111,
                     24'b111101001010000111111111,
                     24'b111100111010001111111111,
                     24'b111100011010010111111111,
                     24'b111100001010011111111111,
                     24'b111011101010100111111111,
                     24'b111011011010101111111111,
                     24'b111010111010110111111111,
                     24'b111010101010111111111111,
                     24'b111010001011000111111111,
                     24'b111001101011001111111111,
                     24'b111001001011010111111111,
                     24'b111000101011011111111111,
                     24'b111000001011100111111111,
                     24'b110111101011101111111111,
                     24'b110111001011110111111111,
                     24'b110110101011111111111111,
                     24'b110101111100000111111111,
                     24'b110101011100001111111111,
                     24'b110100111100010111111111,
                     24'b110100001100011111111111,
                     24'b110011101100100111111111,
                     24'b110010111100101111111111,
                     24'b110010011100110111111111,
                     24'b110001101100111111111111,
                     24'b110001001101000111111111,
                     24'b110000011101001111111111,
                     24'b101111101101010111111111,
                     24'b101111001101011111111111,
                     24'b101110011101100111111111,
                     24'b101101101101101111111111,
                     24'b101100111101110111111111,
                     24'b101100001101111111111111,
                     24'b101011011110000111111111,
                     24'b101010101110001111111111,
                     24'b101001111110010111111111,
                     24'b101001011110011111111111,
                     24'b101000101110100111111111,
                     24'b100111101110101111111111,
                     24'b100110111110110111111111,
                     24'b100110001110111111111111,
                     24'b100101011111000111111111,
                     24'b100100101111001111111111,
                     24'b100011111111010111111111,
                     24'b100011001111011111111111,
                     24'b100010011111100111111111,
                     24'b100001101111101111111111,
                     24'b100000111111110111111111,
                     24'b100000001111111100000000,
                     24'b011111001111110100000000,
                     24'b011110011111101100000000,
                     24'b011101101111100100000000,
                     24'b011100111111011100000000,
                     24'b011100001111010100000000,
                     24'b011011011111001100000000,
                     24'b011010101111000100000000,
                     24'b011001111110111100000000,
                     24'b011001001110110100000000,
                     24'b011000011110101100000000,
                     24'b010111011110100100000000,
                     24'b010110101110011100000000,
                     24'b010110001110010100000000,
                     24'b010101011110001100000000,
                     24'b010100101110000100000000,
                     24'b010011111101111100000000,
                     24'b010011001101110100000000,
                     24'b010010011101101100000000,
                     24'b010001101101100100000000,
                     24'b010000111101011100000000,
                     24'b010000011101010100000000,
                     24'b001111101101001100000000,
                     24'b001110111101000100000000,
                     24'b001110011100111100000000,
                     24'b001101101100110100000000,
                     24'b001101001100101100000000,
                     24'b001100011100100100000000,
                     24'b001011111100011100000000,
                     24'b001011001100010100000000,
                     24'b001010101100001100000000,
                     24'b001010001100000100000000,
                     24'b001001011011111100000000,
                     24'b001000111011110100000000,
                     24'b001000011011101100000000,
                     24'b000111111011100100000000,
                     24'b000111011011011100000000,
                     24'b000110111011010100000000,
                     24'b000110011011001100000000,
                     24'b000101111011000100000000,
                     24'b000101011010111100000000,
                     24'b000101001010110100000000,
                     24'b000100101010101100000000,
                     24'b000100011010100100000000,
                     24'b000011111010011100000000,
                     24'b000011101010010100000000,
                     24'b000011001010001100000000,
                     24'b000010111010000100000000,
                     24'b000010101001111100000000,
                     24'b000010011001110100000000,
                     24'b000001111001101100000000,
                     24'b000001101001100100000000,
                     24'b000001011001011100000000,
                     24'b000001011001010100000000,
                     24'b000001001001001100000000,
                     24'b000000111001000100000000,
                     24'b000000101000111100000000,
                     24'b000000101000110100000000,
                     24'b000000011000101100000000,
                     24'b000000011000100100000000,
                     24'b000000011000011100000000,
                     24'b000000001000010100000000,
                     24'b000000001000001100000000,
                     24'b000000001000000100000000,
                     24'b000000001000000000000000,
                     24'b000000000111111000000000,
                     24'b000000000111110000000000,
                     24'b000000000111101000000000,
                     24'b000000010111100000000000,
                     24'b000000010111011000000000,
                     24'b000000010111010000000000,
                     24'b000000100111001000000000,
                     24'b000000100111000000000000,
                     24'b000000110110111000000000,
                     24'b000001000110110000000000,
                     24'b000001010110101000000000,
                     24'b000001010110100000000000,
                     24'b000001100110011000000000,
                     24'b000001110110010000000000,
                     24'b000010010110001000000000,
                     24'b000010100110000000000000,
                     24'b000010110101111000000000,
                     24'b000011000101110000000000,
                     24'b000011100101101000000000,
                     24'b000011110101100000000000,
                     24'b000100010101011000000000,
                     24'b000100100101010000000000,
                     24'b000101000101001000000000,
                     24'b000101010101000000000000,
                     24'b000101110100111000000000,
                     24'b000110010100110000000000,
                     24'b000110110100101000000000,
                     24'b000111010100100000000000,
                     24'b000111110100011000000000,
                     24'b001000010100010000000000,
                     24'b001000110100001000000000,
                     24'b001001010100000000000000,
                     24'b001010000011111000000000,
                     24'b001010100011110000000000,
                     24'b001011000011101000000000,
                     24'b001011110011100000000000,
                     24'b001100010011011000000000,
                     24'b001101000011010000000000,
                     24'b001101100011001000000000,
                     24'b001110010011000000000000,
                     24'b001110110010111000000000,
                     24'b001111100010110000000000,
                     24'b010000010010101000000000,
                     24'b010000110010100000000000,
                     24'b010001100010011000000000,
                     24'b010010010010010000000000,
                     24'b010011000010001000000000,
                     24'b010011110010000000000000,
                     24'b010100100001111000000000,
                     24'b010101010001110000000000,
                     24'b010110000001101000000000,
                     24'b010110100001100000000000,
                     24'b010111010001011000000000,
                     24'b011000010001010000000000,
                     24'b011001000001001000000000,
                     24'b011001110001000000000000,
                     24'b011010100000111000000000,
                     24'b011011010000110000000000,
                     24'b011100000000101000000000,
                     24'b011100110000100000000000,
                     24'b011101100000011000000000,
                     24'b011110010000010000000000,
                     24'b011111000000001000000000};
                  
assign data = mem[address];
endmodule