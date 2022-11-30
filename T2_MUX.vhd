library ieee;
use ieee.std_logic_1164.all;

entity T2_MUX is 
    port(
        --select signal
        S_T2 : in std_logic;

        -- input data
        RF_DA_OUT2 : in std_logic_vector(15 downto 0);
        SE16_6  : in std_logic_vector(15 downto 0);
        
        T2_EN: in std_logic;
        --output data
        T2_IN : out std_logic_vector(15 downto 0)

    );
end T2_MUX;

architecture arch of T2_MUX is    
    signal T2_IN_TEMP: std_logic_vector(15 downto 0);
begin
    --writing to register when write_enable is set
    MUX: process(S_T2, RF_DA_OUT2, SE16_6)
    
    begin
        if (T2_EN='1') then
            case S_T2 is
                when '0' =>
                T2_IN_TEMP <= RF_DA_OUT2;
                when '1' =>
                T2_IN_TEMP <= SE16_6;
            end case; 
        end if;   
    end process MUX;
	if (T2_EN='1') then
        T2_IN <= T2_IN_TEMP;
    end if; 
end arch;