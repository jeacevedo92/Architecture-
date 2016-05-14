
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Alu is
    Port ( Crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           AluOp : in  STD_LOGIC_VECTOR (5 downto 0);
			  Carry: in STD_LOGIC;
			  
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Alu;

architecture Behavioral of Alu is

begin
process(AluOp,Crs1,Crs2)
	begin
	case (AluOp) is 
		when "000000" => --Add
			AluResult <= Crs1 + Crs2;
		when "010000" => --Addcc
			AluResult <= Crs1 + Crs2;
		when "001000" => --Addx
			AluResult <= Crs1 + Crs2 + Carry;
		when "011000" => --Addxcc
			AluResult <= Crs1 + Crs2 + Carry;
			
			
		when "000100" => --Sub
			AluResult <= Crs1 - Crs2;
		when "010100" => --Subcc
			AluResult <= Crs1 - Crs2;
		when "001100" => --Subx
			AluResult <= Crs1 - Crs2 - Carry;
		when "011100" => --Subxcc
			AluResult <= Crs1 - Crs2 - Carry;
			
			
		when "000001" => --And
			AluResult <= Crs1 and Crs2;
		when "010001" => --Andcc
			AluResult <= Crs1 and Crs2;
		when "000101" => --AndN
			AluResult <= Crs1 nand Crs2;
		when "010101" => --AndNcc
			AluResult <= Crs1 nand Crs2;
			
			
		when "000010" => --Or
			AluResult <= Crs1 or Crs2;
		when "010010" => --Orcc
			AluResult <= Crs1 or Crs2;
			
		when "000110" => --OrN
			AluResult <= Crs1 nor Crs2;
		when "010110" => --OrNcc
			AluResult <= Crs1 nor Crs2;
			
		when "000011" => --Xor
			AluResult <= Crs1 xor Crs2;
		when "010011" => --Xorcc
			AluResult <= Crs1 xor Crs2;
			
		when "000111" => --Xnor
			AluResult <= Crs1 xnor Crs2;	
		when "010111" => --Xnorcc
			AluResult <= Crs1 xnor Crs2;	
			
		when others =>
			AluResult <= (others=>'0');
	end case;
end process;

end Behavioral;

