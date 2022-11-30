library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity mem_blk is
	port(
		MEM_ADD: in std_logic_vector(15 downto 0);
		MEM_DATA_IN: in std_logic_vector(15 downto 0);
		--MEM_RD: in std_logic;
		MEM_WR: in std_logic;
		MEM_DATA_OUT: out std_logic_vector(15 downto 0)
	);
end entity mem_blk;

architecture mem_blk_bhv of mem_blk is
	--signals corresponding to 16-bit contents of 2^16 memory addresses need to be defined here
	type mem_vector is array (integer range <>) of std_logic_vector(15 downto 0);
	signal MEM: mem_vector(127 downto 0):=(others=>(others=>'0'));
	signal MEM_DATA_TEMP: std_logic_vector(15 downto 0);
	signal index: integer;

	
		
	begin
	--loop1: for i in 0 to 127 generate
	 --  if(i!=0 and i!=50 and i!=1 and i!=51 and i!=2) then
		--mem(i)<="0000000000000000";
		--end if;
--	end generate;
	
		
	
	

	index<=to_integer(unsigned(MEM_ADD));
	write_proc: process(index, MEM_WR, MEM_DATA_IN, MEM_ADD)
	begin
	     mem(0)<="0101000001110010";
	mem(50)<="0000000000001000";
	mem(1)<="0101010001110011";
	mem(51)<="0000000000000100";
	mem(2)<="0000000010001000";
	
		--writing at negative edge in accordance with standard set in RF
			if(MEM_WR = '1') then
				MEM(to_integer(unsigned(MEM_ADD))) <= MEM_DATA_IN;
				--if statements need to be added for the other addresses
			else
		--if(clk'event and clk = '0') then
		--	if(MEM_RD = '1') then
				MEM_DATA_OUT <= MEM(to_integer(unsigned(MEM_ADD)));
				--if statements need to be added for the other addresses
			--end if;
		end if;
	end process;
end architecture mem_blk_bhv;
		

 