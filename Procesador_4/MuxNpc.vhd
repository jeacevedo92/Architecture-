library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MuxNpc is
    Port ( PcSource : in  STD_LOGIC_VECTOR (1 downto 0);
           Pcdisp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           Pcdisp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           Pc : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOut : in  STD_LOGIC_VECTOR (31 downto 0);
           toNpc : out  STD_LOGIC_VECTOR (31 downto 0));
end MuxNpc;

architecture Behavioral of MuxNpc is

begin
process(Pcsource,Pcdisp30,Pcdisp22,Pc,AluOut)
	begin 
	case (pcSource) is 
      when "00" =>
         toNpc <= Pcdisp30 ;
      when "01" =>
         toNpc <= Pcdisp22 ;
      when "10" =>
         toNpc <= Pc ;
      when others =>
         toNpc <= AluOut;
   end case;

end process;

end Behavioral;

