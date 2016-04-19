
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSR is
    Port ( nzvc : in  STD_LOGIC_VECTOR (4 downto 0);
           c : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

begin

process(nzvc)
	begin
	
	c<=nzvc(0);
end process;
end Behavioral;

