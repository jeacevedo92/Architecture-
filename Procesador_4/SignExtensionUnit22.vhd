
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity SignExtensionUnit22 is
    Port ( disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
           seudisp22 : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExtensionUnit22;

architecture Behavioral of SignExtensionUnit22 is

begin

	process(disp22)
	begin
		seudisp22(21 downto 0) <= disp22;
		if(disp22(21) = '1')then
			seudisp22(31 downto 22) <= (others=>'1');
		else
			seudisp22(31 downto 22) <= (others=>'0');
		end if;
	end process;

end Behavioral;

