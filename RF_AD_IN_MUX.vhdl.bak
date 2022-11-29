library ieee;
use ieee.std_logic_1164.all;

entity RF_AD_IN_MUX is 
    port(
        --select signal
        S_RF_AD_IN : in std_logic_vector(2 downto 0);

        -- input data
        IR53: in std_logic_vector(2 downto 0);
        IR86: in std_logic_vector(2 downto 0);
        IR119  : in std_logic_vector(2 downto 0);
        PEN_O : in std_logic_vector(2 downto 0);
        --output data
        RF_AD_IN : out std_logic_vector(2 downto 0)

    );
end RF_AD_IN_MUX;

architecture arch of RF_AD_IN_MUX is    
    signal RF_AD_IN_TEMP: std_logic_vector(2 downto 0);
begin
    --writing to register when write_enable is set
    MUX: process(S_RF_AD_IN,IR53,IR86,IR119,PEN_O)
    
    begin
	case S_RF_AD_IN is
         when "000" =>
         RF_AD_IN_TEMP <= "111";
         when "001" =>
         RF_AD_IN_TEMP <= IR53;
         when "010" =>
         RF_AD_IN_TEMP <= IR86;
         when "011" =>
         RF_AD_IN_TEMP <= IR119;
         when "100" =>
         RF_AD_IN_TEMP <= PEN_O;
         
    end case;    
    end process MUX;
	RF_AD_IN <= RF_AD_IN_TEMP; 
end arch;