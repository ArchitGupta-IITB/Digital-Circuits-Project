library ieee;
use ieee.std_logic_1164.all;

entity IR is
	port(
		IR_IN: in std_logic_vector(15 downto 0);
		IR_IN07: in std_logic_vector(7 downto 0);
		IR_EN: in std_logic;
		IR_EN07: in std_logic;
		IR_53: out std_logic_vector(2 downto 0);
		IR_86: out std_logic_vector(2 downto 0);
		IR_119: out std_logic_vector(2 downto 0);
		IR_50: out std_logic_vector(5 downto 0);
		IR_70: out std_logic_vector(7 downto 0);
		IR_80: out std_logic_vector(8 downto 0);
		opcode: out std_logic_vector(3 downto 0)
	);
end IR;

architecture IR_bhv of IR is
	signal IR_store: std_logic_vector(15 downto 0):= "0000000000000000";

	begin
	write_proc: process(IR_EN,IR_EN07)
	begin
		if(IR_EN = '1') then
			IR_store <= IR_IN;
		elsif(IR_EN07 = '1') then
			IR_store(7 downto 0) <= IR_IN07;
		end if;
	end process;

	IR_53 <= IR_store(5 downto 3);
	IR_86 <= IR_store(8 downto 6);
	IR_119 <= IR_store(11 downto 9);
	IR_50 <= IR_store(5 downto 0);
	IR_70 <= IR_store(7 downto 0);
	IR_80 <= IR_store(8 downto 0);
	opcode<= IR_store(15 downto 12);
end IR_bhv;
