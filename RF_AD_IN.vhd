library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity RF_AD_IN is
 port(
    ADDR: in std_logic_vector(2 downto 0);
    D: in std_logic_vector(15 downto 0);

    DOUT0: out std_logic_vector(15 downto 0);
    DOUT1: out std_logic_vector(15 downto 0);
    DOUT2: out std_logic_vector(15 downto 0);
    DOUT3: out std_logic_vector(15 downto 0);
    DOUT4: out std_logic_vector(15 downto 0);
    DOUT5: out std_logic_vector(15 downto 0);
    DOUT6: out std_logic_vector(15 downto 0);
    DOUT7: out std_logic_vector(15 downto 0);

 );
end RF_AD_IN;
 
architecture bhv of RF_AD_IN is
begin
process (ADDR, D) is
begin
 case ADDR is
    when "000" =>
    DOUT0 <= D;
    when "001" =>
    DOUT1 <= D;
    when "010" =>
    DOUT2 <= D;
    when "011" =>
    DOUT3 <= D;
    when "100" =>
    DOUT4 <= D;
    when "101" =>
    DOUT5 <= D;
    when "110" =>
    DOUT6 <= D;
    when "111" =>
    DOUT7 <= D;
 end case;  
end process;
end bhv;
