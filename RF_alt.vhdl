library ieee;
use ieee.std_logic_1164.all;

entity RF is
	port(
		clk: in std_logic;
		RF_AD_IN: in std_logic_vector(2 downto 0);
		RF_AD_OUT1: in std_logic_vector(2 downto 0);
		RF_AD_OUT2: in std_logic_vector(2 downto 0);
		RF_rst: in std_logic;
		RF_DA_IN: in std_logic_vector(15 downto 0);
		RF_DA_OUT1: out std_logic_vector(15 downto 0);
		RF_DA_OUT2: out std_logic_vector(15 downto 0);
		RF_WR: in std_logic
	);
end RF;

architecture RF_bhv of RF is
	signal R0: std_logic_vector(15 downto 0);
	signal R1: std_logic_vector(15 downto 0);
	signal R2: std_logic_vector(15 downto 0);
	signal R3: std_logic_vector(15 downto 0);
	signal R4: std_logic_vector(15 downto 0);
	signal R5: std_logic_vector(15 downto 0);
	signal R6: std_logic_vector(15 downto 0);
	signal R7: std_logic_vector(15 downto 0);
begin
	read_proc: process(RF_AD_OUT1, RF_AD_OUT2, clk)
	begin
		if(clk 'event and clk = '0') then
			if(RF_AD_OUT1 = "000") then
				RF_DA_OUT1 <= R0;
			end if;
			if(RF_AD_OUT1 = "001") then
				RF_DA_OUT1 <= R1;
			end if;
			if(RF_AD_OUT1 = "010") then
				RF_DA_OUT1 <= R2;
			end if;
			if(RF_AD_OUT1 = "011") then
				RF_DA_OUT1 <= R3;
			end if;
			if(RF_AD_OUT1 = "100") then
				RF_DA_OUT1 <= R4;
			end if;
			if(RF_AD_OUT1 = "101") then
				RF_DA_OUT1 <= R5;
			end if;
			if(RF_AD_OUT1 = "110") then
				RF_DA_OUT1 <= R6;
			end if;
			if(RF_AD_OUT1 = "111") then
				RF_DA_OUT1 <= R7;
			end if;
			if(RF_AD_OUT2 = "000") then
				RF_DA_OUT2 <= R0;
			end if;
			if(RF_AD_OUT2 = "001") then
				RF_DA_OUT2 <= R1;
			end if;
			if(RF_AD_OUT2 = "010") then
				RF_DA_OUT2 <= R2;
			end if;
			if(RF_AD_OUT2 = "011") then
				RF_DA_OUT2 <= R3;
			end if;
			if(RF_AD_OUT2 = "100") then
				RF_DA_OUT2 <= R4;
			end if;
			if(RF_AD_OUT2 = "101") then
				RF_DA_OUT2 <= R5;
			end if;
			if(RF_AD_OUT2 = "110") then
				RF_DA_OUT2 <= R6;
			end if;
			if(RF_AD_OUT2 = "111") then
				RF_DA_OUT2 <= R7;
			end if;
		end if;
	end process;
	
	write_proc: process(RF_AD_IN, RF_WR, RF_rst, clk)
	begin
		if(RF_rst = '1') then
			R0 <= "0000000000000000";
			R1 <= "0000000000000000";
			R2 <= "0000000000000000";
			R3 <= "0000000000000000";
			R4 <= "0000000000000000";
			R5 <= "0000000000000000";
			R6 <= "0000000000000000";
			R7 <= "0000000000000000";
		else
			if(clk 'event and clk = '0') then
				if(RF_WR = '1') then
					if(RF_AD_IN = "000") then
						R0 <= RF_DA_IN;
					end if;
					if(RF_AD_IN = "001") then
						R1 <= RF_DA_IN;
					end if;
					if(RF_AD_IN = "010") then
						R2 <= RF_DA_IN;
					end if;
					if(RF_AD_IN = "011") then
						R3 <= RF_DA_IN;
					end if;
					if(RF_AD_IN = "100") then
						R4 <= RF_DA_IN;
					end if;
					if(RF_AD_IN = "101") then
						R5 <= RF_DA_IN;
					end if;
					if(RF_AD_IN = "110") then
						R6 <= RF_DA_IN;
					end if;
					if(RF_AD_IN = "111") then
						R7 <= RF_DA_IN;
					end if;
				end if;
			end if;
		end if;
	end process;
end RF_bhv;
		