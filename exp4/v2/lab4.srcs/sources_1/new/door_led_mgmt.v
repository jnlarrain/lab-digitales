`timescale 1ns / 1ps


module door_led_mgmt(
    input clk,
    input pulse,
    output reg led,
    output reg close
    );
    
    reg [28:0] counter;
    
    parameter max_count = 300000000;
    
    always @ (posedge clk)
    begin
        close = 0;
        if (pulse)
        begin
            led = 1;
            counter = 0;
        end
        if (led)
        begin
            if (counter >= max_count)
            begin
                counter = 0;
                led = 0;
                close = 1;
            end
            else
            begin
                counter = counter + 1;
            end
        end
    end
    
    
endmodule
