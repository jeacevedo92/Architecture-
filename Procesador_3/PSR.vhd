
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PSR is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in  STD_LOGIC;
			   rst : in  STD_LOGIC;
           Carry : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

signal PSR: std_logic_vector(31 downto 0):= (others=>'0');

begin

process(clk,nzvc)
	begin
	if(rising_edge(clk))then
			if(rst = '1') then				
				carry <= '0';
			else
				PSR(23 downto 20) <= nzvc;
				Carry <= PSR(20);
			end if;
		end if;
end process;
end Behavioral;

