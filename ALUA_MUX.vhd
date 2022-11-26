library ieee;
use ieee.std_logic_1164.all;

entity ALUA_MUX is 
    port(
        --select signal
        S_ALU_A : in std_logic;

        -- input data
        RF_DA_OUT1_ALUA : in std_logic_vector(15 downto 0);
        T1_ALUA : in std_logic_vector(15 downto 0);

        --output data
        ALUA_IN : out std_logic_vector(15 downto 0)

    );
end ALUA_MUX;

architecture arch of ALUA_MUX is    
    signal ALUA_IN_TEMP: std_logic_vector(15 downto 0);
begin
    --writing to register when write_enable is set
    MUX: process(RF_DA_OUT1_ALUA, T1_ALUA, S_ALU_A)
    
    begin
	case S_ALU_A is
         when '0' =>
         ALUA_IN_TEMP <= RF_DA_OUT1_ALUA;
         when '1' =>
         ALUA_IN_TEMP <= T1_ALUA;
    end case;    
    end process MUX;
	ALUA_IN <= ALUA_IN_TEMP; 
end arch;