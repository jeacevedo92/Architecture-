library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DataMemory is
    Port ( crd : in  STD_LOGIC_VECTOR (31 downto 0);
           WrenMem : in  STD_LOGIC;
           RdenMem : in  STD_LOGIC;
           AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           DatetoMem : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is

type ram_type is array (0 to 63) of std_logic_vector (31 downto 0);
signal ramMemory : ram_type:=(others => x"00000000");
begin

process(clk)
	begin
		if(rising_edge(clk))then
			if(RdenMem = '1') then
				if(Reset = '1')then
					DatetoMem <= (others => '0');
					ramMemory <= (others => x"00000000");
				else
					if(WrenMem = '0')then
						DatetoMem <= ramMemory(conv_integer(AluResult(5 downto 0)));
					else
						ramMemory(conv_integer(AluResult(5 downto 0))) <= crd;
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

