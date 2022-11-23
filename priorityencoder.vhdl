library ieee;
use iee.std_logic_1164.all;

entity pen is
	port(o2, o1, o0: out std_logic; i: in std_logic_vector(7 downto 0));
end entity pen;

architecture pen_bhv of pen is
begin
 	--I have assumed the lower priority bits to be 'don't care' conditions
 	if(i(7) = '0' and i(6) = '0' and i(5) = '0' and i(4) = '0' and i(3) = '0' and i(2) = '0' and i(1) = '0' and i(0) = '1') then
		o2 <= '0';
		o1 <= '0';
		o0 <= '0';
	end if;
	
	if(i(7) = '0' and i(6) = '0' and i(5) = '0' and i(4) = '0' and i(3) = '0' and i(2) = '0' and i(1) = '1') then
		o2 <= '0';
		o1 <= '0';
		o0 <= '1';
	end if;
	
	if(i(7) = '0' and i(6) = '0' and i(5) = '0' and i(4) = '0' and i(3) = '0' and i(2) = '1') then
		o2 <= '0';
		o1 <= '1';
		o0 <= '0';
	end if;
	
	if(i(7) = '0' and i(6) = '0' and i(5) = '0' and i(4) = '0' and i(3) = '1') then
		o2 <= '0';
		o1 <= '1';
		o0 <= '1';
	end if;
	
	if(i(7) = '0' and i(6) = '0' and i(5) = '0' and i(4) = '1') then
		o2 <= '1';
		o1 <= '0';
		o0 <= '0';
	end if;
	
	if(i(7) = '0' and i(6) = '0' and i(5) = '1') then
		o2 <= '1';
		o1 <= '0';
		o0 <= '1';
	end if;
	
	if(i(7) = '0' and i(6) = '1') then
		o2 <= '1';
		o1 <= '1';
		o0 <= '0';
	end if;
	
	if(i(7) = '1') then
		o2 <= '1';
		o1 <= '1';
		o0 <= '1';
	end if;
    
end architecture pen_bhv;
