library ieee;
use ieee.std_logic_1164.all;

entity reg is
	port(
		reg_in: in std_logic_vector(15 downto 0);
		reg_out: out std_logic_vector(15 downto 0);
		reg_en: in std_logic;
		clk: in std_logic
	);
end reg;

architecture reg_bhv of reg is
	signal reg_data: std_logic_vector(15 downto 0):= "0000000000000000";
begin
	reg_out <= reg_data;
	
	write_proc: process(reg_en, clk)
	begin
		if(reg_en = '1') then
			if(clk 'event and clk = '0') then
				reg_data <= reg_in;
			end if;
		end if;
	end process;
end reg_bhv;