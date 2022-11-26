library ieee;
use ieee.std_logic_1164.all;

entity RF_DA_IN_MUX is 
    port(
        --select signal
        S_RF_DA_IN : in std_logic_vector(1 downto 0);

        -- input data
        ALU_C : in std_logic_vector(15 downto 0);
        T1 : in std_logic_vector(15 downto 0);
        MEM_DATA: in std_logic_vector(15 downto 0);
        RF_DA_OUT1: in std_logic_vector(15 downto 0); 
        --output data
        RF_DA_IN : out std_logic_vector(15 downto 0)

    );
end RF_DA_IN_MUX;

architecture arch of RF_DA_IN_MUX is    
    signal RF_DA_IN_TEMP: std_logic_vector(15 downto 0);
begin
    --writing to register when write_enable is set
    MUX: process(RF_DA_IN_TEMP,ALU_C, MEM_DATA, RF_DA_OUT1, T1, S_RF_DA_IN)
    
    begin
	case S_RF_DA_IN is
         when "00" =>
         RF_DA_IN_TEMP <= ALU_C;
         when "01" =>
         RF_DA_IN_TEMP <= T1;
         when "10" =>
         RF_DA_IN_TEMP <= MEM_DATA;
         when "11" =>
         RF_DA_IN_TEMP <= RF_DA_OUT1;
    end case;    
    end process MUX;
	RF_DA_IN <= RF_DA_IN_TEMP; 
end arch;