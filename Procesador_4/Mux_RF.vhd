library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_RF is
    Port ( Rd : in  STD_LOGIC_VECTOR (5 downto 0);
           R07 : in  STD_LOGIC_VECTOR (5 downto 0);
           RfDest : in  STD_LOGIC;
			  nrd : out STD_LOGIC_VECTOR (5 downto 0));
end Mux_RF;

architecture Behavioral of Mux_RF is

begin

process(RD, R07, RfDest)
	begin
		if(RfDest = '0') then
			nrd <= Rd;
		else
			nrd <= R07;
		end if;			
	end process;

end Behavioral;

