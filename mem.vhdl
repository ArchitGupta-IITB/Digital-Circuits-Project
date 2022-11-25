library ieee;
use ieee.std_logic_1164.all;

entity mem_blk is
	port(
		MEM_ADD: in std_logic_vector(15 downto 0);
		MEM_DATA_IN: in std_logic_vector(15 downto 0);
		MEM_RD: in std_logic;
		MEM_WR: in std_logic;
		clk: in std_logic;
		MEM_DATA_OUT: out std_logic_vector(15 downto 0);
	)
end entity mem_blk;

architecture mem_blk_bhv of mem_blk is
	--signals corresponding to 16-bit contents of 2^16 memory addresses need to be defined here
	signal MEM0: std_logic_vector(15 downto 0);
	signal MEM_DATA_TEMP: std_logic_vector(15 downto 0);
begin
	write_proc: process(MEM_ADD, MEM_WR, clk)
	begin
		if(clk'event and clk = '0') then --writing at negative edge in accordance with standard set in RF
			if(MEM_WR = '1') then
				if(MEM_ADD = "0000000000000000") then
					MEM0 <= MEM_DATA_IN;
				end if;
				--if statements need to be added for the other addresses
			end if;
		end if;
	end process;
	
	read_proc: process(MEM_ADD, MEM_RD, clk)
	begin
		if(clk'event and clk = '0') then
			if(MEM_RD = '1') then
				if(MEM_ADD = "0000000000000000") then
					MEM_DATA_TEMP <= MEM0;
				end if;
				--if statements need to be added for the other addresses
			end if;
		end if;
	end process;
	
	MEM_DATA_OUT <= MEM_DATA_TEMP when MEM_RD = '1';
end architecture mem_blk_bhv;
		
