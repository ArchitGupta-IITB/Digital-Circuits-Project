library ieee;
use ieee.std_logic_1164.all;

entity ir is
	port(
		ir_in: in std_logic_vector(15 downto 0);
		ir_en: in std_logic;
		ir_53: out std_logic_vector(2 downto 0);
		ir_86: out std_logic_vector(2 downto 0);
		ir_119: out std_logic_vector(2 downto 0);
		ir_50: out std_logic_vector(5 downto 0);
		ir_70: out std_logic_vector(7 downto 0);
		ir_80: out std_logic_vector(8 downto 0);
		clk: in std_logic
	);
end ir;

architecture ir_bhv of ir is
	signal ir_store: std_logic_vector(15 downto 0):= "0000000000000000";
begin
	ir_53 <= ir_store(5 downto 3);
	ir_86 <= ir_store(8 downto 6);
	ir_119 <= ir_store(11 downto 9);
	ir_50 <= ir_store(5 downto 0);
	ir_70 <= ir_store(7 downto 0);
	ir_80 <= ir_store(8 downto 0);
	
	write_proc: process(ir_en, clk)
	begin
		if(ir_en = '1') then
			if(clk 'event and clk = '0') then --triggered at falling edge
				ir_store <= ir_in;
			end if;
		end if;
	end process;
end ir_bhv;
