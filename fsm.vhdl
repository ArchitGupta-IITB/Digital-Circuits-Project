library ieee;
use ieee.std_logic_1164.all;


entity FSM is
port(reset,clock: in std_logic);
end FSM;

architecture bhv of FSM is
---------------Define state type here-----------------------------
type state is (s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13,
                s14, s15, s16, s17, s18, s19, s20, s21, s22 ); -- Fill other states here
---------------Define signals of state type-----------------------

component DATAPATH is
    port(reset,clock: in std_logic;
        S_ALU_A:in std_logic;
        S_ALU_B: in std_logic_vector( 1 downto 0);
        alu_control: in std_logic_vector(1 downto 0);
        
        --IR
        S_IR: in std_logic;
        IR_EN: in std_logic;
    
    
        --T1 and T2
        S_T1: in std_logic_vector( 1 downto 0);
        T1_EN: in std_logic;
        S_T2: in std_logic;
        T2_EN:in std_logic;
    
    
        --RF
        RF_reset: std_logic;
        RF_WR: in std_logic;
        S_RF_AD_OUT1: in std_logic_vector(1 downto 0);
        S_RF_AD_IN: std_logic_vector(2 downto 0);
        S_RF_DA_IN: std_logic_vector(1 downto 0);
    
        --MEM
        S_MEM_DATA: in std_logic;
        S_MEM_ADD: in std_logic_vector(1 downto 0);
        MEM_RD: in std_logic;
        MEM_WR: in std_logic;
    
        --output signals
        C:out std_logic;
        Z: out std_logic;
        Z_flag: out std_logic;
        opcode_o: out std_logic_vector(3 downto 0);
        );
    end component DATAPATH;
    


signal state_present,state_next: state:=s1;
signal S_ALU_A, S_IR, S_T2, S_MEM_DATA, C, Z, RF_WR,IR_EN,MEM_RD,MEM_WR,RF_reset: std_logic;
signal S_ALU_B, S_ALU, S_RF_AD_OUT1, S_RF_DA_IN, S_T1, S_MEM_ADD, alu_control: std_logic_vector(1 downto 0);
signal S_RF_AD_IN: std_logic_vector(2 downto 0);
signal opcode: std_logic_vector(3 downto 0);


begin
DATAPATH1: DATAPATH port map(reset,clock,S_ALU_A,S_ALU_B,alu_control,S_IR,IR_EN,S_T1,T1_EN,S_T2,T2_EN,RF_reset,RF_WR,S_RF_AD_OUT1,S_RF_AD_IN,S_RF_DA_IN,S_MEM_DATA,S_MEM_ADD,MEM_RD, MEM_WR,C,Z,Z_flag,opcode);

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


state_transition_proc:process(state_present,opcode)
begin
case state_present is
    when s1=>
    S_RF_AD_OUT1 <= "00";
    S_IR<='0';
    S_RF_AD_IN<="000";
    S_RF_DA_IN<="00";
    S_MEM_ADD<= "00";   
    S_IR<='0';
    if(opcode = "0000" or opcode = "0010" or opcode = "0001" or
        opcode = "0100" or opcode = "0101" or opcode = "1100") then-- Fill the code here
        state_next<=s2;
    elsif(opcode ="0011" ) then--FILL OTHER STATES HERE
        state_next<=s7;
    elsif(opcode = "1000") then
        state_next<=s12;
    elsif(opcode ="1001") then
        state_next<=s16;
    elsif(opcode = "0110") then
        state_next<=s18;
    elsif(opcode= "0111") then
        state_next<=s22;
    else
        state_next<=s1;
    end if;

    when s2=>
    S_RF_AD_OUT1<="01";
    S_T1<="00";
    if(opcode = "0000" or opcode = "0001") then
        state_next<=s3; -- Fill the code here
        S_T2<='0';
    elsif (opcode = "0100" or opcode = "0101") then
        state_next<=s3;
        S_T2<='1';
    elsif(opcode = "0010") then
        state_next<=s5;
        S_T2<='0';
    elsif(opcode = "1100") then
        state_next<=s11;
    else
        state_next<=s1;
    end if;
    when s3=>
    S_ALU_A<='1';
    S_ALU_B<="01";
    S_T1<="01";
    if(opcode = "0000") then
        state_next<=s4; 
    elsif(opcode = "0001") then
        state_next<=s6;
    elsif(opcode = "0100") then
        state_next<=s9;
    elsif(opcode = "0101") then
        state_next<=s10;
    else
        state_next<=s1;
    end if;
    when s4=>
        state_next<=s1;
        S_RF_AD_IN<="001"; 
        S_RF_DA_IN<="01";

    when s5=>
        state_next<=s4;
        S_ALU_A<='1';
        S_ALU_B<="01";
        S_T1<="01";

    when s6=>
        state_next<=s1;
        S_RF_AD_IN<="010";
        S_RF_DA_IN<="01";
    when s7=>
        state_next<=s8;
        S_T1<="10";    
    when s8=>
        state_next<=s1;
        S_RF_AD_IN<="011";
        S_RF_DA_IN<="01";

    when s9=>
        state_next<=s1;
        S_MEM_DATA<='0';
        S_MEM_ADD<="01";
        S_RF_DA_IN<="10";
        S_RF_AD_IN<="011";
    when s10=>
        state_next<=s1;
        S_RF_AD_OUT1<="10";
        S_MEM_ADD<="01";
        S_MEM_DATA<='1';

    when s11=>
        S_T1<="01";
        S_ALU_B<="01";
        S_ALU_A<='1';
        if( Z = '1') then
            state_next<=s12;
        else
            state_next<=s1;
        end if;
    
    when s12=>
        S_ALU_A<='0';
        S_ALU_B<="00";
        S_RF_AD_OUT1<="00";
        S_RF_AD_IN<="000";
        S_RF_DA_IN<= "00";

        if(opcode = "1100") then
            state_next<=s13;
        elsif(opcode = "1000") then
            state_next<=s14;
        else
            state_next<=s1;
        end if;

    when s13=>
        state_next<=s1;
        S_ALU_A<= '0';
        S_ALU_B<="10";
        S_RF_AD_OUT1<="00";
        S_RF_AD_IN<="000";
        S_RF_DA_IN<="00";

    when s14=>
        state_next<=s15;

        S_RF_AD_OUT1<="00";    
        S_RF_AD_IN<="011";
        S_RF_DA_IN<="11";
    
    when s15=>
        state_next<=s1;

        S_ALU_A<='0';
        S_ALU_B<="11";
        S_RF_AD_OUT1<="00";
        S_RF_AD_IN<="000";
        S_RF_DA_IN<="00";

    when s16=>
        state_next<=s17;
        S_ALU_A<='0';
        S_ALU_B<="00";
        S_RF_AD_OUT1<="00";
        S_RF_AD_IN<="011";
        S_RF_DA_IN<="00";

    when s17=>
        state_next<=s1;
        S_RF_AD_OUT1<="01";
        S_RF_AD_IN<="000";
        S_RF_DA_IN<="11";
    when s18=>
            
        if( Z_flag= '0') then
            state_next<=s19;
        else
            state_next<=s1;
        end if;
    
    when s19=>  
        state_next<=s20;
        S_RF_AD_OUT1<="10";
        S_RF_AD_IN<="100";
        S_RF_DA_IN<="10";
        S_T1<="00";
        S_MEM_ADD<="00";
        S_MEM_DATA<='0';
        S_IR<='1';
    when s20=>
        S_IR<='0';
        S_RF_DA_IN<="00";
        S_RF_AD_IN<="011";
        S_ALU_A<='1';
        S_ALU_B<="00";
        if(opcode = "0110") then
            state_next<=s18;
        elsif(opcode = "0111") then
            state_next<=s22;
        else
            state_next<=s1;
        end if;
    
    when s22=>
           
        if(Z_flag = '0') then
            state_next<=s21;
        else
            state_next<=s1;
        end if;

    when s21=>
        state_next<=s20;
        S_MEM_DATA<='1';
        S_MEM_ADD<="10";
        S_RF_AD_OUT1<="11";
        S_IR<='1';
    when others=>
        state_next<=s1;
    
end case;
end process;

-------------------------
---------Fill rest of the code here---------

end bhv;
