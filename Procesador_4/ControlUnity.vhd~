library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnity is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
			  Op2 : in  STD_LOGIC_VECTOR (2 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  icc: in STD_LOGIC_VECTOR (3 downto 0);
			  cond: in STD_LOGIC_VECTOR (3 downto 0);
			  
			  rdenMem : out STD_LOGIC;
			  rfDest : out  STD_LOGIC;
			  rfSource : out  STD_LOGIC_VECTOR (1 downto 0);
			  wrEnMem : out  STD_LOGIC;
           wrEnRF : out  STD_LOGIC;	
			  pcSource : out STD_LOGIC_VECTOR (1 downto 0);
           AluOp : out  STD_LOGIC_VECTOR (5 downto 0));
			  
end ControlUnity;

architecture Behavioral of ControlUnity is

begin
process(Op, Op2, Op3, icc, cond)
	begin
		if(Op = "00")then
			if(Op2 = "010")then
				case cond is
					when "1000" => --branch always
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp => "111111";
					when "1001" => --branch not equal
						if(not(icc(2)) = '1')then --not Z
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
       					AluOp => "111111";
						else
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
							AluOp => "111111";
						end if;
					when "0001" => --branch equal
						if(icc(2) = '1')then --Z
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
							AluOp => "111111";
						else
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
							AluOp => "111111";
						end if;
					when "1010" => --branch greater
						if((not(icc(2) or (icc(3) xor icc(1)))) = '1')then --not(Z or (N xor V))
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
							AluOp => "111111";
						else
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
							AluOp => "111111";
						end if;
					when "0010" => --branch less or equal
						if((icc(2) or (icc(3) xor icc(1))) = '1')then  --Z or (N xor V)
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
							AluOp => "111111";
						else
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
							AluOp => "111111";
						end if;
					when "1011" => --branch greater or equal
						if((not(icc(3) xor icc(1))) = '1')then --not (N xor V)
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
							AluOp => "111111";
						else
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
							AluOp => "111111";
						end if;
					when "0011" => --branch less
						if((icc(3) xor icc(1)) = '1')then --(N xor V)
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
							AluOp => "111111";
						else
							rfDest => ;
							rfSource => ;
							wrEnMen => ;
							wrEnRF => ;
							rdenMem=>;
		   				pcSource =>;
							AluOp => "111111";
						end if;
					when others =>
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
		   			pcSource =>;
						AluOp => "111111";
				end case;
			else
				if(Op2 = "100")then -- NOP
					rfDest => ;
					rfSource => ;
					wrEnMen => ;
					wrEnRF => ;
					rdenMem=>;
		   		pcSource =>;
					AluOp => "111111";
				end if;
			end if;
		else
			if(Op = "10")then
				case Op3 is
					--Add instruction
					when "000000" => --Add
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "000000";
					when "010000" => --Addcc
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "010000";
					when "001000" => --Addx
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "001000";
					when "011000" => --Addxcc
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "011000";	
			
				--Sub instruction			
					when "000100" => --Sub
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "000100";
					when "010100" => --Subcc
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "010100";
					when "001100" => --Subx
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "001100";
					when "011100" => --Subxcc
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "011100";
						
				--Logical Instruction	
				--AND
					when "000001" => --And
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "000001";				
					when "010001" => --Andcc
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "010001";		
						
					when "000101" => --AndN
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "000101";
					when "010101" => --AndNcc
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "010101";
						
				--OR				
					when "000010" => --Or
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "000010";
					when "010010" => --Orcc
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "010010";
					
					when "000110" => --OrN
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "000110";
					when "010110" => --OrNcc
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "010110";
						
				--XOR							
					when "000011" => --Xor
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "000011";
					when "010011" => --Xorcc
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "010011";
					
					when "000111" => --XorN
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "000111";
					when "010111" => --XnorNcc
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "010111";
						
					when "111100" => -- SAVE
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "111100";
							
					when "111101" => -- RESTORE
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "111101";
						
					when others =>
						rfDest => ;
						rfSource => ;
						wrEnMen => ;
						wrEnRF => ;
						rdenMem=>;
						pcSource =>;
						AluOp <= "111111";
				end case;
			end if;
		end if;
						
end process;

end Behavioral;

