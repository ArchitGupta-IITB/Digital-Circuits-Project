library ieee;
use ieee.std_logic_1164.all;

entity zero_checker is
	port(
		zero_in: in std_logic_vector(7 downto 0);
		zero_flag: out std_logic
	);
end zero_checker;

architecture zero_checker_bhv of zero_checker is
begin
	zero_flag <= not(zero_in(7) or zero_in(6) or zero_in(5) or zero_in(4) or zero_in(3) or zero_in(2) or zero_in(1) or zero_in(0));
end zero_checker_bhv;