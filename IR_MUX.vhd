library ieee;
use ieee.std_logic_1164.all;

entity IR_MUX is 
    port(
        --select signal
        S_IR : in std_logic;

        -- input data
        MEM_DATA_IR: in std_logic_vector(15 downto 0);
        LU_IR  : in std_logic_vector(15 downto 0);

        --output data
        IR_IN : out std_logic_vector(15 downto 0)

    );
end IR_MUX;

architecture arch of IR_MUX is    
    signal IR_IN_TEMP: std_logic_vector(15 downto 0);
begin
    --writing to register when write_enable is set
    MUX: process(S_IR, LU_IR, MEM_DATA_IR)
    
    begin
	case S_IR is
         when '0' =>
         IR_IN_TEMP <= MEM_DATA_IR;
         when '1' =>
         IR_IN_TEMP <= LU_IR;
         
    end case;    
    end process MUX;
	IR_IN <= IR_IN_TEMP; 
end arch;