library ieee;
use ieee.std_logic_1164.all;


entity state_transition is
port(reset,clock:in std_logic;
output: out std_logic);
end state_transition;

architecture bhv of state_transition is
---------------Define state type here-----------------------------
type state is (rst,start_state,s2,s3); -- Fill other states here
---------------Define signals of state type-----------------------

signal state_present,state_next: state:=rst;
signal outp: std_logic ;
begin
clock_proc:process(clock,reset)
begin

if(reset='1') then
y_present<=rst;
else
if(clock='1' and clock' event) then
y_present<=y_next;
end if;
end if;
end process;
state_transition_proc:process(y_present)
begin
case y_present is
when rst=>
y_next<=s1; -- Fill the code here

when s1=>
y_next<=s2; -- Fill the code here

when s2=>
y_next<=s3; -- Fill the code here

when s3=>
y_next<=s0; -- Fill the code here

when s0=>
y_next<=s1; -- Fill the code here

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
