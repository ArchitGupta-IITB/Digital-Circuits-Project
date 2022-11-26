library ieee;
use ieee.std_logic_1164.all;

entity MEM_ADD_MUX is 
    port(
        --select signal
        S_MEM_ADD : in std_logic_vector(1 downto 0);

        -- input data
        RF_DA_OUT1_MEM_ADD : in std_logic_vector(15 downto 0);
        T1_MEM_ADD: in std_logic_vector(15 downto 0);
        RF_DA_OUT2_MEM_ADD  : in std_logic_vector(15 downto 0);

        --output data
        MEM_ADD_IN : out std_logic_vector(15 downto 0)

    );
end MEM_ADD_MUX;

architecture arch of MEM_ADD_MUX is    
    signal MEM_ADD_IN_TEMP: std_logic_vector(15 downto 0);
begin
    --writing to register when write_enable is set
    MUX: process(S_MEM_ADD, RF_DA_OUT1_MEM_ADD, T1_MEM_ADD, RF_DA_OUT2_MEM_ADD)
    
    begin
	case S_MEM_ADD is
         when "00" =>
         MEM_ADD_IN_TEMP <= RF_DA_OUT1_MEM_ADD;
         when "01" =>
         MEM_ADD_IN_TEMP <= T1_MEM_ADD;
         when "10" =>
         MEM_ADD_IN_TEMP <= RF_DA_OUT2_MEM_ADD;
         
    end case;    
    end process MUX;
	MEM_ADD_IN <= MEM_ADD_IN_TEMP; 
end arch;