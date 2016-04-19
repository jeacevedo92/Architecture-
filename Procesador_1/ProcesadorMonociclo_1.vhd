
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ProcesadorMonociclo_1 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  Alu_result : out STD_LOGIC_VECTOR (31 DOWNTO 0));
			  
end ProcesadorMonociclo_1;

architecture Behavioral of ProcesadorMonociclo_1 is

COMPONENT Adder
	PORT(
		AddIn : IN std_logic_vector(31 downto 0);
		Increment : IN std_logic_vector(31 downto 0);          
		AddOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT Alu
	PORT(
		Crs1 : IN std_logic_vector(31 downto 0);
		Crs2 : IN std_logic_vector(31 downto 0);
		AluOp : IN std_logic_vector(5 downto 0);          
		AluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT ControlUnity
	PORT(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);          
		AluOp : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
		COMPONENT InstructionMemory
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;          
		OutInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT ProgramCounter
	PORT(
		Pcin : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		Pcout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
		COMPONENT RegisterFile
	PORT(
		Rs1 : IN std_logic_vector(4 downto 0);
		Rs2 : IN std_logic_vector(4 downto 0);
		Rsd : IN std_logic_vector(4 downto 0);
		DataToWrite : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	 signal adder_to_npc,npc_to_adder, pc_to_im, im, rf_to_alu_crs1, rf_to_alu_crs2,alu_to_rf: std_logic_vector(31 downto 0);
	 signal cu_to_alu: std_logic_vector (5 downto 0);

begin

Inst_Adder: Adder PORT MAP(
		AddIn => npc_to_adder,
		Increment => "00000000000000000000000000000001",
		AddOut => adder_to_npc
	);
	
	Inst_Alu: Alu PORT MAP(
		Crs1 => rf_to_alu_crs1,
		Crs2 => rf_to_alu_crs2,
		AluOp => cu_to_alu,
		AluResult => alu_to_rf
	);
	
		Inst_ControlUnity: ControlUnity PORT MAP(
		Op => im(31 downto 30),
		Op3 => im(24 downto 19),
		AluOp => cu_to_alu
	);

	Inst_InstructionMemory: InstructionMemory PORT MAP(
		Address => pc_to_im,
		Reset => rst,
		OutInstruction => im
	);
	
		Inst_ProgramCounter: ProgramCounter PORT MAP(
		Pcin => npc_to_adder,
		clk => clk,
		rst => rst,
		Pcout => pc_to_im
	);
	
	
	Inst_NextProgramCounter: ProgramCounter PORT MAP(
		Pcin => adder_to_npc,
		clk => clk,
		rst => rst,
		Pcout => npc_to_adder
	);
	
		Inst_RegisterFile: RegisterFile PORT MAP(
		Rs1 => im(18 downto 14),
		Rs2 => im(4 downto 0),
		Rsd => im(29 downto 25),
		DataToWrite => alu_to_rf,
		Crs1 => rf_to_alu_crs1,
		Crs2 => rf_to_alu_crs2,
		rst => rst
	);
	
	Alu_result <= alu_to_rf;


end Behavioral;

