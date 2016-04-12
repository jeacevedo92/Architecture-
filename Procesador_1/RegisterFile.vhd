
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RegisterFile is
    Port ( Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           Rsd : in  STD_LOGIC_VECTOR (4 downto 0);
           DataToWrite : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
			  rst: in STD_LOGIC;
end RegisterFile;

architecture arqRegisterFile of RegisterFile is

    type rom_type is array (39 downto 0) of std_logic_vector (31 downto 0);                 
    signal ROM : rom_type := (X"11111", X"00010", X"00011", X"00100", X"00101", X"00111",
                             X"01000", X"01001", X"01010", X"01010", X"01011", X"01100",
									  X"01101", X"01110", X"01111", X"10000", X"10001", X"10010",
									  X"10011", X"10100", X"10101", X"10111", X"11000", X"11001",
									  X"11010", X"11011", X"11100", X"11101", X"11110'", X"11111",
									  X"01000", X"01001", X"01010", X"01010", X"01011");                        

    signal rdata : std_logic_vector(19 downto 0);
begin

architecture Behavioral of RegisterFile is

begin

		process(Rs1,Rs2,Rsd,DataToWrite,rst)
			begin	
					if(rst = '1')then
						Crs1 <= (others => '0');
						Crs2 <= (others => '0');
					else
						Crs1 <= ROM(conv_integer(Rs1));
						Crs2 <= ROM(conv_integer(Rs2));
						if (rsd /= "00000")then
								ROM(conv_integer(Rsd))<= DataToWrite;
						end if;
					end if;
		end process;
end Behavioral;


