----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:28:19 03/31/2016 
-- Design Name: 
-- Module Name:    Alu - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu is
    Port ( Crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is

begin
process(AluOp)
	begin
	case (AluOp) is 
		when "000000" => --Add
			AluResult <= Crs1 + Crs2;
		when "000001" => --Sub
			AluResult <= Crs1 - Crs2;
		when "000010" => --And
			AluResult <= Crs1 and Crs2;
		when "000011" => --AndN
			AluResult <= Crs1 nand Crs2;
		when "000100" => --Or
			AluResult <= Crs1 or Crs2;
		when "000101" => --OrN
			AluResult <= Crs1 nor Crs2;
		when "000110" => --Xor
			AluResult <= Crs1 xor Crs2;
		when "000111" => --Xnor
			AluResult <= Crs1 xnor Crs2;
		when others =>
			AluResult <= (others=>'1');
	end case;
end process;

end Behavioral;

