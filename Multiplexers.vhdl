library ieee;
use ieee.std_logic_1164.all;

entity ALU_A_multi is  --6-bit to 16-bit extender
	port(Input_1,Input_2,Input_3,Input_4: in std_logic_vector(15 downto 0);s1,s2: in std_logic; output_16: out std_logic_vector(15 downto 0);)
end entity ALU_A_multi;

architecture bhv of ALU_A_multi is
begin
	if(s2='0' and s1 = '0')
		output_16 <= Input_1;
	elsif(s2='0' and s1 = '1')
		output_16 <= Input_2;
	elsif(s2='1' and s1 = '0')
		output_16 <= Input_3;
	elsif(s2='1' and s1 = '1')
		output_16 <= Input_4;
	else
		output_16 <= "0000000000000000";
	end if;
end architecture bhv;
