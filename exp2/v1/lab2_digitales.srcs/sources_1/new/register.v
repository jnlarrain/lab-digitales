`timescale 1ns / 1ps


module register(
    input clk, load, up, down,
    input [7:0] data_in,
    output [23:0] data_out
    );
endmodule


//architecture Behavioral of Reg is

//signal reg : std_logic_vector(15 downto 0) := (others => '0'); -- Señales del registro. Parten en 0.

//begin

//reg_prosses : process (clock)           -- Proceso sensible a clock.
//        begin
//          if (rising_edge(clock)) then  -- Condición de flanco de subida de clock.
//            if (load = '1') then
//                reg <= datain;          -- Si load = 1, carga la entrada de datos en el registro.
//            elsif (up = '1') then
//                reg <= reg + 1;         -- Si load = 0 y up = 1 incrementa el registro en 1.
//            elsif (down = '1') then
//                reg <= reg - 1;         -- Si load = 0, up = 0 y down = 1 decrementa el registro en 1.
//            else        
//            end if;
//          else 
//          end if;
//        end process;
        
//dataout <= reg;                         -- Los datos del registro salen sin importar el estado de clock.
            
//end Behavioral;