`timescale 1ns / 1ps

module clk_mgmt(
    input clk,
    input [1:0] sel,
    output clk_out
    );
    
    reg [26:0] counter;
    wire [26:0] max_count;
    
    assign max_count = sel[1] ? (sel[0] ? 100000 : 1000000) : (sel[0] ? 5000000 : 10000000);
    
    always @ (posedge clk)
        if (counter >= max_count)
            counter <= 0;
        else
            counter <= counter + 1;
            
    assign clk_out = counter == 0;
endmodule
