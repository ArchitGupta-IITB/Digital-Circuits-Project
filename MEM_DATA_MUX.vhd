library ieee;
use ieee.std_logic_1164.all;

entity MEM_DATA_MUX is 
    port(
        --select signal
        S_MEM_DATA : in std_logic;

        -- input data
        RF_DA_IN  : in std_logic_vector(15 downto 0);
        RF_DA_OUT1: in std_logic_vector(15 downto 0);

        --output data
        MEM_DATA_IN : out std_logic_vector(15 downto 0)

    );
end MEM_DATA_MUX;

architecture arch of MEM_DATA_MUX is    
    signal MEM_DATA_IN_TEMP: std_logic_vector(15 downto 0);
begin
    --writing to register when write_enable is set
    MUX: process(S_MEM_DATA, RF_DA_IN, RF_DA_OUT1)
    
    begin
	case S_MEM_DATA is
         when '0' =>
         MEM_DATA_IN_TEMP <= RF_DA_IN;
         when '1' =>
         MEM_DATA_IN_TEMP <= RF_DA_OUT1;
         
    end case;    
    end process MUX;
	MEM_DATA_IN <= MEM_DATA_IN_TEMP; 
end arch;