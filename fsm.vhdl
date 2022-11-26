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

component ALUA_MUX is 
port(
    S_ALU_A : in std_logic;
    RF_DA_OUT1 : in std_logic_vector(15 downto 0);
    T1 : in std_logic_vector(15 downto 0);ALUA_IN : out std_logic_vector(15 downto 0));
end component ALUA_MUX;

component ALUB_MUX is 
    port(
        --select signal
        S_ALU_B : in std_logic_vector(1 downto 0);

        -- input data
        PLUS1 : in std_logic_vector(15 downto 0);
        T2: in std_logic_vector(15 downto 0);
        SE16_6: in std_logic_vector(15 downto 0);
        SE16_9: in std_logic_vector(15 downto 0);
        --output data
        ALUB_IN : out std_logic_vector(15 downto 0)
    );
end component ALUB_MUX;

component ALU is
    port (
        ALU_A: in std_logic_vector(15 downto 0);
        ALU_B: in std_logic_vector(15 downto 0);
		alu_control: in std_logic_vector(1 downto 0);
        ALU_C: out std_logic_vector(15 downto 0);
		C: out std_logic;
		Z: out std_logic
    ) ;
end component ALU;

component IR_MUX is 
    port(
        --select signal
        S_IR : in std_logic;

        -- input data
        MEM_DATA_IR: in std_logic_vector(15 downto 0);
        LU_IR  : in std_logic_vector(15 downto 0);

        --output data
        IR_IN : out std_logic_vector(15 downto 0)

    );
end component IR_MUX;


signal state_present,state_next: state:=s1;
signal S_ALU_A, S_IR, S_T2, S_MEM_DATA, S_IR, C, Z: std_logic;
signal S_ALU_B, S_ALU, S_RF_AD_OUT1, S_RF_DA_IN, S_T1, S_MEM_ADD, alu_control: std_logic_vector(1 downto 0);
signal S_RF_AD_IN: std_logic_vector(2 downto 0);
signal ALUA_IN,ALUB_IN, ALU_C, RF_DA_OUT1,T1,T2, SE16_6, SE16_9, IR, MEM_DATA : std_logic_vector(15 downto 0);
signal PLUS1: std_logic_vector(15 downto 0);

begin
ALU_A: ALUA_MUX port(S_ALU_A,RF_DA_OUT1,T1,ALUA_IN);
ALU_B: ALUB_MUX port(S_ALU_B, PLUS1,T2,SE16_6,SE16_9,ALUB_IN);
ALU_C: ALU port(ALUA_IN, ALUB_IN,alu_control, ALU_C, C, Z);
IR_M: IR_MUX port(S_IR, MEM_DATA, )
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
