library ieee;
use ieee.std_logic_1164.all;

entity RF is 
    port(
        --to store the register number for each address
        ADDR : in std_logic_vector(2 downto 0);;

        -- input data
        D7 : in std_logic_vector(15 downto 0);
        D6 : in std_logic_vector(15 downto 0);
        D5 : in std_logic_vector(15 downto 0);
        D4 : in std_logic_vector(15 downto 0);
        D3 : in std_logic_vector(15 downto 0);
        D2 : in std_logic_vector(15 downto 0);
        D1 : in std_logic_vector(15 downto 0);
        D0 : in std_logic_vector(15 downto 0);

        --output data
        DOUT : out std_logic_vector(15 downto 0);

    );
end entity;

architecture arch of RF is    
    signal DOUT_TEMP: std_logic;
begin
    --writing to register when write_enable is set
    MUX: process(ADDR, D7, D6, D5, D4, D3, D2, D1, D0)
    DOUT_TEMP<= "0000000000000000"
    begin
	case ADDR is
         when "000" =>
         DOUT_TEMP <= D0;
         when "001" =>
         DOUT_TEMP <= D1;
         when "010" =>
         DOUT_TEMP <= D2;
         when "011" =>
         DOUT_TEMP <= D3;
         when "100" =>
         DOUT_TEMP <= D4;
         when "101" =>
         DOUT_TEMP <= D5;
         when "110" =>
         DOUT_TEMP <= D6;
         when "111" =>
         DOUT_TEMP <= D7;

    end process MUX;
	DOUT <= DOUT_TEMP; 
end arch;