library ieee;
use ieee.std_logic_1164.all;


entity fsm is
port(reset,clock: in std_logic);
end fsm;

architecture bhv of fsm is
---------------Define state type here-----------------------------
type state is (s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13,
                s14, s15, s16, s17, s18, s19, s20, s21, s22 ); -- Fill other states here
---------------Define signals of state type-----------------------

signal state_present,state_next: state:=s1;

begin
clock_proc:process(clock,reset)
    begin

        if(reset='1') then
        state_present<=s1;
        else
        if(clock='1' and clock' event) then
        state_present<=state_next;
        end if;
    end if;
end process;


state_transition_proc:process(state_present)
begin
case state_present is
    when s1=>
    
    
    
    if(opcode = "0000" or opcode = "0010" or opcode = "0001"
        opcode = "0100" or opcode = "0101" or opcode = "1100") -- Fill the code here
        state_next<=s2;
    elsif(opcode ="0011" ) --FILL OTHER STATES HERE
        state_next<=s7;
    elsif(opcode = "1000")
        state_next<=s12;
    elsif(opcode ="1001")
        state_next<=s16;
    elsif(opcode = "0110")
        state_next<=s18;
    elsif(opcode= "0111")
        state_next<=s22;
    else
        state_next<=s1;
    end if;

    when s2=>
    if(opcode = "0000" or opcode = "0001" or opcode = "0100" or opcode = "0101")
        state_next<=s3; -- Fill the code here
    elsif(opcode = "0010")
        state_next<=s5;
    elsif(opcode = "1100")
        state_next<=s11;
    else
        state_next<=s1;
    
    when s3=>
    if(opcode = "0000")
        state_next<=s4; 
    elsif(opcode = "0001")
        state_next<=s6;
    elsif(opcode = "0100")
        state_next<=s9;
    elsif(opcode = "0101")
        state_next<=s10;
    else
        state_next<=s1;
    
    when s4=>
        state_next<=s1; 

    when s5=>
        state_next<=s4;
    
    when s6=>
        state_next<=s1;
    
    when s7=>
        state_next<=s8;
    
    when s8=>
        state_next<=s1;

    when s9=>
        state_next<=s1;

    when s10=>
        state_next<=s1;
    
    when s11=>
        if( z_flag = '1')
            state_next<=s12;
        else
            state_next<=s1;
        end if;
    
    when s12=>
        if(opcode = "1100")
            state_next<=s13;
        elsif(opcode = "1000")
            state_next<=s14;
        else
            state_next<=s1;
        end if;

    when s13=>
        state_next<=s1;
    
    when s14=>
        state_next<=s15;
    
    when s15=>
        state_next<=s1;
    
    when s16=>
        state_next<=s17;
    
    when s17=>
        state_next<=s1;
    
    when s18=>
        if( z_flag = '0')
            state_next<=s19;
        else
            state_next<=s1;
        end if;
    
    when s19=>  
        state_next<=s20;

    when s20=>
        if(opcode = "0110")
            state_next<=s18;
        elsif(opcode = "0111")
            state_next<=s22;
        else
            state_next<=s1;
        end if;
    
    when s22=>
        if(z_flag = '0')
            state_next<=s21;
        else
            state_next<=s1;
        end if;

    when s21=>
        state_next<=s20;
    
    when others=>
        state_next<=s1;
    
end case;
end process;

-------------------------
---------Fill rest of the code here---------

end bhv;
