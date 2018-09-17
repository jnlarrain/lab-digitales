`timescale 1ns / 1ps

module high_flow_detector(
    input [6:0] qty_v,
    input [6:0] qty_h,
    input qty_amb,
    output high_flow
    );
    
    assign high_flow = (qty_h > 5) | (qty_v + qty_amb > 5);
endmodule
