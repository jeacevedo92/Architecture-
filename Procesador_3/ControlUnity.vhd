library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnity is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
end ControlUnity;

architecture Behavioral of ControlUnity is

begin
process(Op, Op3)
	begin
	if(Op = "10") then
		case (Op3) is 
		
		--Add instruction
			when "000000" => --Add
				AluOp <= "000000";
			when "010000" => --Addcc
				AluOp <= "010000";
			when "001000" => --Addx
				AluOp <= "001000";
			when "011000" => --Addxcc
				AluOp <= "011000";	
	
		--Sub instruction			
			when "000100" => --Sub
				AluOp <= "000100";
			when "010100" => --Subcc
				AluOp <= "010100";
			when "001100" => --Subx
				AluOp <= "001100";
			when "011100" => --Subxcc
				AluOp <= "011100";
				
		--Logical Instruction	
		--AND
			when "000001" => --And
				AluOp <= "000001";				
			when "010001" => --Andcc
				AluOp <= "010001";		
				
			when "000101" => --AndN
				AluOp <= "000101";
			when "010101" => --AndNcc
				AluOp <= "010101";
				
		--OR				
			when "000010" => --Or
				AluOp <= "000010";
			when "010010" => --Orcc
				AluOp <= "010010";
			
			when "000110" => --OrN
				AluOp <= "000110";
			when "010110" => --OrNcc
				AluOp <= "010110";
				
		--XOR							
			when "000011" => --Xor
				AluOp <= "000011";
			when "010011" => --Xorcc
				AluOp <= "010011";
			
			when "000111" => --XorN
				AluOp <= "000111";
			when "010111" => --XnorNcc
				AluOp <= "010111";
				
				
			when others =>
				AluOp <= "111111";
		end case;
	else
		AluOp <= "111111";
	end if;
end process;


end Behavioral;

