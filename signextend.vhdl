library ieee;
use ieee.std_logic_1164.all;

entity se6 is  --6-bit to 16-bit extender
	port(i5, i4, i3, i2, i1, i0: in std_logic; o15, o14, o13, o12, o11, o10, o9, o8, o7, o6, o5, o4, o3, o2, o1, o0: out std_logic);
end entity se6;

architecture se6_bhv of se6 is
begin
	o15 <= '0'; --has to be replaced by 1 if we are using 2s complement
	o14 <= '0';
	o13 <= '0';
	o12 <= '0';
	o11 <= '0';
	o10 <= '0';
	o9 <= '0';
	o8 <= '0';
	o7 <= '0';
	o6 <= '0';
	o5 <= i5;
	o4 <= i4;
	o3 <= i3;
	o2 <= i2;
	o1 <= i1;
	o0 <= i0;
end architecture se6_bhv;

library ieee;
use ieee.std_logic_1164.all;

entity se9 is  --9-bit to 16-bit extender
	port(i8, i7, i6, i5, i4, i3, i2, i1, i0: in std_logic; o15, o14, o13, o12, o11, o10, o9, o8, o7, o6, o5, o4, o3, o2, o1, o0: out std_logic);
end entity se9;

architecture se9_bhv of se9 is
begin
	o15 <= '0';  --has to be replaced by 1 if we are using 2s complement
	o14 <= '0';
	o13 <= '0';
	o12 <= '0';
	o11 <= '0';
	o10 <= '0';
	o9 <= '0';
	o8 <= i8;
	o7 <= i7;
	o6 <= i6;
	o5 <= i5;
	o4 <= i4;
	o3 <= i3;
	o2 <= i2;
	o1 <= i1;
	o0 <= i0;
end architecture se9_bhv;
