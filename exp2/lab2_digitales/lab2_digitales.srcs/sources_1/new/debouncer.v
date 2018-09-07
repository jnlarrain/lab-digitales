// Source: fpga4student

module debouncer(input pb_1, clk, output pb_out);
wire slow_clk_en;
wire Q1, Q2 ,Q2_bar;
clock_enable u1(clk, pb_1, slow_clk_en);
my_dff_en d1(clk ,slow_clk_en, pb_1, Q1);
my_dff_en d2(clk, slow_clk_en, Q1, Q2);
assign Q2_bar = ~Q2;
assign pb_out = Q1 & Q2_bar;
endmodule
// Slow clock enable for debouncing button 
module clock_enable(input Clk_100M, pb_1, output slow_clk_en);
    reg [26:0]counter=0;
    always @(posedge Clk_100M, negedge pb_1)
    begin
     if(pb_1==0)
              counter <= 0;
            else
       counter <= (counter>=249999)?0:counter+1;
    end
    assign slow_clk_en = (counter == 249999)?1'b1:1'b0;
endmodule
// D-flip-flop with clock enable signal for debouncing module 
module my_dff_en(input DFF_CLOCK, clock_enable,D, output reg Q=0);
    always @ (posedge DFF_CLOCK) begin
  if(clock_enable==1) 
           Q <= D;
    end
endmodule 