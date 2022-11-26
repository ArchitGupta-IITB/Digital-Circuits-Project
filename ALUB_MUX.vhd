library ieee;
use ieee.std_logic_1164.all;

entity ALUB_MUX is 
    port(
        --select signal
        S_ALU_B : in std_logic_vector(1 downto 0);

        -- input data
        PLUS1 : in std_logic_vector(15 downto 0);
        T2_ALUB: in std_logic_vector(15 downto 0);
        SE16_6_ALUB  : in std_logic_vector(15 downto 0);
        SE16_9_ALUB : in std_logic_vector(15 downto 0);
        --output data
        ALUB_IN : out std_logic_vector(15 downto 0)

    );
end ALUB_MUX;

architecture arch of ALUB_MUX is    
    signal ALUB_IN_TEMP: std_logic_vector(15 downto 0);
begin
    --writing to register when write_enable is set
    MUX: process(PLUS1, T2_ALUB, SE16_6_ALUB, SE16_9_ALUB, S_ALU_B)
    
    begin
	case S_ALU_B is
         when "00" =>
         ALUB_IN_TEMP <= PLUS1;
         when "01" =>
         ALUB_IN_TEMP <= T2_ALUB;
         when "10" =>
         ALUB_IN_TEMP <= SE16_6_ALUB;
         when "11" =>
         ALUB_IN_TEMP <= SE16_9_ALUB;
    end case;    
    end process MUX;
	ALUB_IN <= ALUB_IN_TEMP; 
end arch;