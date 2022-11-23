library ieee;
use ieee.std_logic_1164.all;

entity se6 is  --6-bit to 16-bit extender
	port(i: in std_logic_vector(5 downto 0); o: out std_logic_vector(15 downto 0);
end entity se6;

architecture se6_bhv of se6 is
begin
	o(15) <= '0'; --has to be replaced by 1 if we are using 2s complement
	o(14) <= '0';
	o(13) <= '0';
	o(12) <= '0';
	o(11) <= '0';
	o(10) <= '0';
	o(9) <= '0';
	o(8) <= '0';
	o(7) <= '0';
	o(6) <= '0';
	o(5) <= i(5);
	o(4) <= i(4);
	o(3) <= i(3);
	o(2) <= i(2);
	o(1) <= i(1);
	o(0) <= i(0);
end architecture se6_bhv;

library ieee;
use ieee.std_logic_1164.all;

entity se9 is  --9-bit to 16-bit extender
	port(i: in std_logic_vector(8 downto 0); o: out std_logic_vector(15 downto 0));
end entity se9;

architecture se9_bhv of se9 is
begin
	o(15) <= '0';  --has to be replaced by 1 if we are using 2s complement
	o(14) <= '0';
	o(13) <= '0';
	o(12) <= '0';
	o(11) <= '0';
	o(10) <= '0';
	o(9) <= '0';
	o(8) <= i(8);
	o(7) <= i(7);
	o(6) <= i(6);
	o(5) <= i(5);
	o(4) <= i(4);
	o(3) <= i(3);
	o(2) <= i(2);
	o(1) <= i(1);
	o(0) <= i(0);
end architecture se9_bhv;
