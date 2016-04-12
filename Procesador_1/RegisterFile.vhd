
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rsd : in  STD_LOGIC_VECTOR (4 downto 0);
           DataToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  rst: in STD_LOGIC);
end RegisterFile;

architecture Behavioral of RegisterFile is 

    type ram_type is array (39 downto 0) of std_logic_vector (31 downto 0);                 
    signal RAM : ram_type := (X"00011111", X"00000010", X"00000011", X"00000100", X"00000101", X"00000111",
                             X"00001000", X"00001001", X"00001010", X"00001010", X"00001011", X"00001100",
									  X"00001101", X"00001110", X"00001111", X"00010000", X"00010001", X"00010010",
									  X"00010011", X"00010100", X"00010101", X"00010111", X"00011000", X"00011001",
									  X"00011010", X"00011011", X"00011100", X"00011101", X"00011110", X"00011111",
									  X"00001000", X"00001001", X"00001010", X"00001010", X"00001011", X"00001001",
									  X"00001010", X"00001010", X"00001011", X"00001011");                        	
	
begin

		process(Rs1,Rs2,Rsd,DataToWrite,rst)
			begin	
			
					if(rst = '1')then
						Crs1 <= (others => '0');
						Crs2 <= (others => '0');
					else
						Crs1 <= RAM(conv_integer(Rs1));
						Crs2 <= RAM(conv_integer(Rs2));
						if (rsd /= "00000")then
								RAM(conv_integer(Rsd))<= DataToWrite;
						end if;
					end if;
		end process;
end Behavioral;


