library ieee;
use ieee.std_logic_1164.all;

entity PEN is
	port( pen_i: in std_logic_vector(7 downto 0);pen_o: out std_logic_vector(2 downto 0));
end PEN;

architecture PEN_bhv of PEN is

begin
	pen_o(2) <= pen_i(0) or pen_i(1) or pen_i(2) or pen_i(3);
	pen_o(1) <= pen_i(0) or pen_i(1) or pen_i(4) or pen_i(5);
	pen_o(0) <= pen_i(0) or pen_i(2) or pen_i(4) or pen_i(6);
end pen_bhv;
