library ieee;
use iee.std_logic_1164.all;

entity pen is
	port(o2, o1, o0: out std_logic; i7, i6, i5, i4, i3, i2, i1, i0: in std_logic);
end entity pen;

architecture pen_bhv of pen is
begin
 	--I have assumed the lower priority bits to be 'don't care' conditions
 	if(i7 = '0' and i6 = '0' and i5 = '0' and i4 = '0' and i3 = '0' and i2 = '0' and i1 = '0' and i0 = '1') then
		o2 <= '0';
		o1 <= '0';
		o0 <= '0';
	end if;
	
	if(i7 = '0' and i6 = '0' and i5 = '0' and i4 = '0' and i3 = '0' and i2 = '0' and i1 = '1') then
		o2 <= '0';
		o1 <= '0';
		o0 <= '1';
	end if;
	
	if(i7 = '0' and i6 = '0' and i5 = '0' and i4 = '0' and i3 = '0' and i2 = '1') then
		o2 <= '0';
		o1 <= '1';
		o0 <= '0';
	end if;
	
	if(i7 = '0' and i6 = '0' and i5 = '0' and i4 = '0' and i3 = '1') then
		o2 <= '0';
		o1 <= '1';
		o0 <= '1';
	end if;
	
	if(i7 = '0' and i6 = '0' and i5 = '0' and i4 = '1') then
		o2 <= '1';
		o1 <= '0';
		o0 <= '0';
	end if;
	
	if(i7 = '0' and i6 = '0' and i5 = '1') then
		o2 <= '1';
		o1 <= '0';
		o0 <= '1';
	end if;
	
	if(i7 = '0' and i6 = '1') then
		o2 <= '1';
		o1 <= '1';
		o0 <= '0';
	end if;
	
	if(i7 = '1') then
		o2 <= '1';
		o1 <= '1';
		o0 <= '1';
	end if;
    
end architecture pen_bhv;
