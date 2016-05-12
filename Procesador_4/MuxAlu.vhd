
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MuxAlu is
    Port ( crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  i : in  STD_LOGIC;
           sing_ext : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : out  STD_LOGIC_VECTOR (31 downto 0));
end MuxAlu;

architecture Behavioral of MuxAlu is

begin
process(crs2 , i , sing_ext)
	begin
   if (i = '0') then
      op2 <= crs2;
   else
		op2 <= sing_ext; 
   end if;

	
	
end process;



end Behavioral;

