module debouncer(



);
endmodule




//entity Debouncer is
//    Generic ( DEBNC_CLOCKS : INTEGER range 2 to (INTEGER'high) := 2**16;
//          PORT_WIDTH : INTEGER range 1 to (INTEGER'high) := 5);
//    Port ( clk : in  std_logic;
//           datain : in  std_logic_vector ((PORT_WIDTH - 1) downto 0);
//           dataout : out  std_logic_vector ((PORT_WIDTH - 1) downto 0));
//end Debouncer;

//architecture Behavioral of Debouncer is
//constant CNTR_WIDTH : integer := natural(ceil(LOG2(real(DEBNC_CLOCKS))));
//constant CNTR_MAX : std_logic_vector((CNTR_WIDTH - 1) downto 0) := std_logic_vector(to_unsigned((DEBNC_CLOCKS - 1), CNTR_WIDTH));
//type VECTOR_ARRAY_TYPE is array (integer range <>) of std_logic_vector((CNTR_WIDTH - 1) downto 0);

//signal sig_cntrs_ary : VECTOR_ARRAY_TYPE (0 to (PORT_WIDTH - 1)) := (others=>(others=>'0'));

//signal sig_out_reg : std_logic_vector((PORT_WIDTH - 1) downto 0) := (others => '0');

//begin

//debounce_process : process (clk)
//begin
//   if (rising_edge(clk)) then
//   for index in 0 to (PORT_WIDTH - 1) loop
//      if (sig_cntrs_ary(index) = CNTR_MAX) then
//         sig_out_reg(index) <= not(sig_out_reg(index));
//      else
//            -- necesario para poder simular
//      end if;
//   end loop;
//   else
//        -- necesario para poder simular
//   end if;
//end process;

//counter_process : process (clk)
//begin
//	if (rising_edge(clk)) then
//	for index in 0 to (PORT_WIDTH - 1) loop
	
//		if ((sig_out_reg(index) = '1') xor (datain(index) = '1')) then
//			if (sig_cntrs_ary(index) = CNTR_MAX) then
//				sig_cntrs_ary(index) <= (others => '0');
//			else
//				sig_cntrs_ary(index) <= sig_cntrs_ary(index) + 1;
//			end if;
//		else
//			sig_cntrs_ary(index) <= (others => '0');
//		end if;
		
//	end loop;
	
//	else
//	       -- necesario para poder simular
//	end if;
//end process;

//dataout <= sig_out_reg;

//end Behavioral;
