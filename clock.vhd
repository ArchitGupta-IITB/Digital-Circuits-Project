LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity clock is
end entity clock;

architecture bhv of clock is
component FSM is
port(reset,clock: in std_logic);
end component FSM;

signal reset : std_logic := '0';
signal clock : std_logic := '1';
constant clk_period : time := 20 ns;
begin
	
	dut_instance: fsm port map(reset,clock);
	clock <= not clock after clk_period/2 ;
	reset <= '0' , '1' after 1000 ms;
end bhv;
	

