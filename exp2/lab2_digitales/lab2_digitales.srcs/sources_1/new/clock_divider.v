`timescale 1ns / 1ps

module clock_divider( 
    input clk, speed,
    output clock
    );
endmodule

// Para seleccionar velocidades


//architecture Behavioral of Clock_Divider is

//constant full_max         : std_logic_vector(26 downto 0) := "000000000000000000000000001";
//constant fast_max         : std_logic_vector(26 downto 0) := "000010111110101111000010000";
//constant normal_max       : std_logic_vector(26 downto 0) := "001011111010111100001000000";
//constant slow_max         : std_logic_vector(26 downto 0) := "101111101011110000100000000";

//signal clock_divide_max     : std_logic_vector(26 downto 0) := (others => '0');
//signal clock_divide_counter : std_logic_vector(26 downto 0) := (others => '0');
//signal internal_clock       : std_logic := '0';
    
//begin

//with speed select
//    clock_divide_max <= full_max    when "00",
//                        fast_max    when "01",
//                        normal_max  when "10",
//                        slow_max    when "11",
//                        normal_max  when others;
                        
//clock_divide : process (clk)
//    begin
//        if (rising_edge(clk)) then
//            if (clock_divide_counter >= clock_divide_max) then
//                clock_divide_counter <= (others => '0');
//                internal_clock <= not internal_clock;
//            else
//                clock_divide_counter <= clock_divide_counter + 1;
//            end if;
//        else
//                -- necesario para poder simular
//        end if;
//    end process;
    
//clock <= internal_clock;

//end Behavioral;
