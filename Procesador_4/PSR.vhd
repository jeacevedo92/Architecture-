
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PSR is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in  STD_LOGIC;
			  nCWP: in STD_LOGIC;
			  rst : in  STD_LOGIC;
			  
           Carry : out  STD_LOGIC;
			  CWP : out STD_LOGIC;
			  icc : out STD_LOGIC_VECTOR(3 downto 0));
			  
end PSR;

architecture Behavioral of PSR is

signal PSR: std_logic_vector(31 downto 0):= (others=>'0');

begin

process(clk,nzvc,nCWP)
	begin
	if(rising_edge(clk))then
			if(rst = '1') then				
				carry <= '0';
				CWP <= '0';
				icc <= "0000";
			else
				PSR(23 downto 20) <= nzvc;
				PSR(0) <= nCWP; 
				Carry <= PSR(20);				
				icc <= PSR(23 downto 20);
				CWP <= PSR(0);
			end if;
		end if;
end process;
end Behavioral;

