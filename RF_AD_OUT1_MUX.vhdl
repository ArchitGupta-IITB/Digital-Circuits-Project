library ieee;
use ieee.std_logic_1164.all;

entity RF_AD_OUT1_MUX is 
    port(
        --select signal
        S_RF_AD_OUT1 : in std_logic_vector(1 downto 0);

        -- input data
        IR86: in std_logic_vector(2 downto 0);
        IR119  : in std_logic_vector(2 downto 0);
        PEN_O : in std_logic_vector(2 downto 0);
        --output data
        RF_AD_OUT1 : out std_logic_vector(2 downto 0)

    );
end RF_AD_OUT1_MUX;

architecture arch of RF_AD_OUT1_MUX is    
    signal RF_AD_OUT1_TEMP: std_logic_vector(2 downto 0);
begin
    --writing to register when write_enable is set
    MUX: process(S_RF_AD_OUT1,IR86,IR119,PEN_O)
    
    begin
	case S_RF_AD_OUT1 is
         when "00" =>
         RF_AD_OUT1_TEMP <= "111";
         when "01" =>
         RF_AD_OUT1_TEMP <= IR86;
         when "10" =>
         RF_AD_OUT1_TEMP <= IR119;
         when "11" =>
         RF_AD_OUT1_TEMP <= PEN_O;
         
    end case;    
    end process MUX;
	RF_AD_OUT1 <= RF_AD_OUT1_TEMP; 
end arch;