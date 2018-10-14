module move_elevator(
    input clk,
    input reset,
    input pulse,
    input [2:0] set,
    output reg [2:0] pos,
    output reg static,
    output reg dir
    );
    
    parameter pos_init = 0;
    
    initial
    begin
    pos = pos_init;
    static = 1;
    end
    
    always @ (posedge clk)
    begin
        if (pulse)
        begin
            if (!static)
            begin
                if (dir)
                begin
                    if (pos != 6)
                    begin
                        pos = pos + 1;
                    end
                end
                else
                begin
                    if (pos != 0)
                    begin
                        pos = pos - 1;
                    end
                end
            end
        
            if (set != pos)
            begin
                dir = set > pos;
                static = 0;
            end
            else
            begin
                static = 1;
            end
        end
        
        if (reset)
        begin
            pos = pos_init;
            static = 1;
        end
    end
    
endmodule