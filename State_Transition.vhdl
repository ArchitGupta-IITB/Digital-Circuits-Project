library ieee;
use ieee.std_logic_1164.all;


entity state_transition is
port(reset,clock, C, Z:in std_logic;
    opcode : in std_logic_vector(3 downto 0);
	condition : in std_logic_vector(1 downto 0);
		
	nextstateID : out std_logic_vector(4 downto 0)
    );
end state_transition;

architecture bhv of state_transition is
---------------Define state type here-----------------------------
type state is (rst, s1, s2,s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13,
                s14, s15, s16, s17, s18, s19, s20, s21, s22 ); -- Fill other states here
---------------Define signals of state type-----------------------

signal state_present,state_next: state:=rst;
signal outp: std_logic ;
begin
clock_proc:process(clock,reset)
    begin

        if(reset='1') then
        state_present<=rst;
        else
        if(clock='1' and clock' event) then
        state_present<=state_next;
        end if;
    end if;
end process;


state_transition_proc:process(state_present, opcode, condition, C, Z)
begin
case state_present is
    when rst=>
    state_next<=s1; -- Fill the code here

    when s1=>
    if(opcode = "0000" or opcode = "0010" or opcode = "0001"
        opcode = "0100" or opcode = "0101" or opcode = "1100") -- Fill the code here
    state_next<=s2;
   -- elsif(opcode = ) --FILL OTHER STATES HERE
    end if;
    when s2=>
    if(opcode = "0000")
        state_next<=s3; -- Fill the code here
    elsif(opcode = "0010")
        state_next<=s5;

    when s3=>
    if(opcode = "0000")
        state_next<=s4; -- Fill the code here

    when s4=>
    state_next<=s1; -- Fill the code here

    when s5=>
    state_next<=s4;

    when others =>
    y_next<=rst;
end case;
end process;

-------------------------
---------Fill rest of the code here---------
output_proc:process(state_present) ------- output process after this which will give
-------the output based on the present state and input (Mealy machine)
begin
case y_present is
when s3=>
outp<='0';
when others=>
outp<='1';
end case;
end process;

output <=outp;

end bhv;
