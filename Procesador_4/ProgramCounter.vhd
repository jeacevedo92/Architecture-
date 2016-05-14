
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( Pcin : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Pcout : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

begin
process(clk, rst, Pcin)
	begin
	if(rst = '1') then 
		Pcout <= (others=>'0');
	else
		if(rising_edge(clk)) then
			Pcout <= Pcin;
		end if;
	end if;
end process;

end Behavioral;

