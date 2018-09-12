`timescale 1ns / 1ps

module clock_divider( 
    input clk,
    input [1:0] speed,
    output clock
    );


reg [26:0] clock_divide_max;
reg [26:0] clock_divide_counter;
reg internal_clock;

// diferentes velocidad del clock como constantes
wire [26:0] full_max    = 'b000000000000000000000000100;
wire [26:0] fast_max    = 'b000010111110101111000010000;
wire [26:0] normal_max  = 'b001011111010111100001000000;
wire [26:0] slow_max    = 'b101111101011110000100000000;



always @(*)
begin
clock_divide_max = speed[1] ? (speed[0] ? full_max : fast_max) : (speed[0] ? normal_max : slow_max);
end


always @(clk)
if(clock_divide_counter > clock_divide_max) clock_divide_counter = 'b0;
else if (clock_divide_counter == clock_divide_max) internal_clock = ~internal_clock;
else clock_divide_counter = clock_divide_counter + 1;


assign clock = internal_clock;
endmodule

