library ieee;
use iee.std_logic_1164.all;

entity PEN is
	port( PEN_I: in std_logic_vector(7 downto 0);PEN_O: out std_logic(2 downto 0));
end entity PEN;

architecture PEN_bhv of PEN is

begin
 if( pen_i(7)='1')  
	pen_o<="000";
 elsif( pen_i(6)='1')  
	pen_o<="001";
 elsif( pen_i(5)='1')  
   pen_o<="010";
 elsif(pen_i(4)='1')  
   pen_o<="011";
 elsif(pen_i(3)='1')  
   pen_o<="100";
 elsif(pen_i(2)='1')  
   pen_o<="101";
 elsif(pen_i(1)='1')  
	pen_o<="110";
 elsif(pen_i(0)='1')  
   pen_o<="111";
 end if;    
end architecture pen_bhv;
