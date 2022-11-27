library ieee;
use ieee.std_logic_1164.all;

entity lu is
	port(
		lu_in: in std_logic_vector(7 downto 0);
		lu_en: in std_logic;
		lu_out: out std_logic_vector(7 downto 0);
		pen_o: in std_logic_vector(2 downto 0)
	);
end lu;

architecture lu_bhv of lu is
begin
	lu_out(7) <= lu_in(7) and (pen_o(2) or pen_o(1) or pen_o(0) or (not lu_en));
	lu_out(6) <= lu_in(6) and (pen_o(2) or pen_o(1) or (not pen_o(0)) or (not lu_en));
	lu_out(5) <= lu_in(5) and (pen_o(2) or (not pen_o(1)) or pen_o(0) or (not lu_en));
	lu_out(4) <= lu_in(4) and (pen_o(2) or (not pen_o(1)) or (not pen_o(0)) or (not lu_en));
	lu_out(3) <= lu_in(3) and ((not pen_o(2)) or pen_o(1) or pen_o(0) or (not lu_en));
	lu_out(2) <= lu_in(2) and ((not pen_o(2)) or pen_o(1) or (not pen_o(0)) or (not lu_en));
	lu_out(1) <= lu_in(1) and ((not pen_o(2)) or (not pen_o(1)) or pen_o(0) or (not lu_en));
	lu_out(0) <= lu_in(0) and ((not pen_o(2)) or (not pen_o(1)) or (not pen_o(0)) or (not lu_en));
end lu_bhv;
	