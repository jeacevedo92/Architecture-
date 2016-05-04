
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador_3 is
    Port ( Clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Alu_Result : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador_3;

architecture Behavioral of Procesador_3 is


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
		Carry : IN std_logic;          
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

	COMPONENT Mux
	PORT(
		ContentRegister : IN std_logic_vector(31 downto 0);
		Immediate : IN std_logic_vector(31 downto 0);
		ControlSignal : IN std_logic;          
		MuxOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PSRModifier
	PORT(
		aluResult : IN std_logic_vector(31 downto 0);
		operando1 : IN std_logic;
		reset : IN std_logic;
		operando2 : IN std_logic;
		aluOp : IN std_logic_vector(5 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT PSR
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		Carry : OUT std_logic
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
	
		COMPONENT SignExtensionUnit
	PORT(
		Imm13 : IN std_logic_vector(12 downto 0);          
		Sign_Ext : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal AddertoNpc,NpcOut ,PctoIm ,ImOut ,SeutoMux ,Aluresult ,Rfcrs1toAlu, Crs2toMux,MuxtoAlu: std_logic_vector(31 downto 0);
	signal CutoAlu: std_logic_vector(5 downto 0);
	signal PsrtoAlu: std_logic;
	signal PsrModifiertoPsr: std_logic_vector(3 downto 0); 
	
begin

Inst_Adder: Adder PORT MAP(
		AddIn => NpcOut,
		Increment => "00000000000000000000000000000001",
		AddOut => AddertoNpc
	);
	
Inst_Alu: Alu PORT MAP(
		Crs1 => Rfcrs1toAlu,
		Crs2 => MuxtoAlu,
		AluOp => CutoAlu,
		Carry => PsrtoAlu,
		AluResult => Aluresult
	);
	
Inst_ControlUnity: ControlUnity PORT MAP(
		Op => ImOut(31 downto 30),
		Op3 => ImOut(24 downto 19),
		AluOp => CutoAlu
	);
	
Inst_InstructionMemory: InstructionMemory PORT MAP(
		Address => PctoIm,
		Reset => rst,
		OutInstruction => ImOut
	);
	
Inst_Mux: Mux PORT MAP(
		ContentRegister => Crs2toMux,
		Immediate => SeutoMux,
		ControlSignal => ImOut(13),--revisar !!!!
		MuxOut => MuxtoAlu 
	);

	Inst_PSRModifier: PSRModifier PORT MAP(
		aluResult => Aluresult,
		operando1 => Rfcrs1toAlu(31),
		reset => rst,
		operando2 => MuxtoAlu(31),--revisar !!!!!!
		aluOp => CutoAlu,
		nzvc => PsrModifiertoPsr
	);
	
		Inst_PSR: PSR PORT MAP(
		nzvc => PsrModifiertoPsr,
		clk => Clk,
		rst => rst,
		Carry => PsrtoAlu
	);
	
	
	Inst_ProgramCounter: ProgramCounter PORT MAP(
		Pcin => NpcOut,
		clk => Clk,
		rst => rst,
		Pcout => PctoIm
	);
	
	
	Inst_NextProgramCounter: ProgramCounter PORT MAP(
		Pcin => AddertoNpc,
		clk => Clk,
		rst => rst,
		Pcout => NpcOut
	);
	
		Inst_RegisterFile: RegisterFile PORT MAP(
		Rs1 =>  ImOut(18 downto 14),
		Rs2 => ImOut(4 downto 0),
		Rsd => ImOut(29 downto 25),
		DataToWrite => Aluresult,
		Crs1 => Rfcrs1toAlu,
		Crs2 => Crs2toMux,
		rst => rst
	);
	
	Inst_SignExtensionUnit: SignExtensionUnit PORT MAP(
		Imm13 => ImOut(12 downto 0),
		Sign_Ext => SeutoMux
	);
	
	Alu_Result <=Aluresult;

end Behavioral;

