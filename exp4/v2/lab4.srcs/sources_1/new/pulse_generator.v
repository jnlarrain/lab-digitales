`timescale 1ns / 1ps

module pulse_generator(
    input clk,
    output pulse
    ); 
    reg [28:0] counter;
    
    parameter max_count = 300000000;
    
    always @ (posedge clk)
        if (counter >= max_count)
            counter <= 0;
        else
            counter <= counter + 1;
            
    assign pulse = counter == 0;
endmodule
