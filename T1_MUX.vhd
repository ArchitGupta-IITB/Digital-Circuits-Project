library ieee;
use ieee.std_logic_1164.all;

entity T1_MUX is 
    port(
        --select signal
        S_T1 : in std_logic_vector(1 downto 0);

        -- input data
        RF_DA_OUT1_T1 : in std_logic_vector(15 downto 0);
        ALUC_T1: in std_logic_vector(15 downto 0);
        SE16_6_T1  : in std_logic_vector(15 downto 0);

        --output data
        T1_IN : out std_logic_vector(15 downto 0)

    );
end T1_MUX;

architecture arch of T1_MUX is    
    signal T1_IN_TEMP: std_logic_vector(15 downto 0);
begin
    --writing to register when write_enable is set
    MUX: process(S_T1, RF_DA_OUT1_T1, ALUC_T1, SE16_6_T1)
    
    begin
	case S_T1 is
         when "00" =>
         T1_IN_TEMP <= RF_DA_OUT1_T1;
         when "01" =>
         T1_IN_TEMP <= ALUC_T1;
         when "10" =>
         T1_IN_TEMP <= SE16_6_T1;
         when others => 
			T1_IN_TEMP <= RF_DA_OUT1_T1;
    end case;    
    end process MUX;
	T1_IN <= T1_IN_TEMP; 
end arch;