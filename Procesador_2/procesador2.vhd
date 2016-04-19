library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity procesador2 is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador2;

architecture Behavioral of procesador2 is

	COMPONENT ProgramCounter
	PORT(
		Pcin : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		rst : IN std_logic;          
		Pcout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Adder
	PORT(
		AddIn : IN std_logic_vector(31 downto 0);
		Increment : IN std_logic_vector(31 downto 0);          
		AddOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT InstructionMemory
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;          
		OutInstruction : OUT std_logic_vector(31 downto 0)
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
	
	COMPONENT ControlUnity
	PORT(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);          
		AluOp : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SignExtensionUnit
	PORT(
		Imm13 : IN std_logic_vector(12 downto 0);          
		Sign_Ext : OUT std_logic_vector(31 downto 0)
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
	
	COMPONENT Alu
	PORT(
		Crs1 : IN std_logic_vector(31 downto 0);
		Crs2 : IN std_logic_vector(31 downto 0);
		AluOp : IN std_logic_vector(5 downto 0);          
		AluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal nPCToPCAndAdder, AdderTonPC, PCToIM, IMOut, RFCrs1ToALU, RFCrs2ToMux, SEUToMux, MuxToAlu, AluResultP: std_logic_vector(31 downto 0);
	signal CUToALU: std_logic_vector(5 downto 0);

begin

	Inst_ProgramCounter: ProgramCounter PORT MAP(
		Pcin => nPCToPCAndAdder,
		clk => Clk,
		rst => Reset,
		Pcout => PCToIM
	);
	
	Inst_NextProgramCounter: ProgramCounter PORT MAP(
		Pcin => AdderTonPC,
		clk => Clk,
		rst => Reset,
		Pcout => nPCToPCAndAdder
	);
	
	Inst_Adder: Adder PORT MAP(
		AddIn => nPCToPCAndAdder,
		Increment => "00000000000000000000000000000001",
		AddOut => AdderTonPC
	);
	
	Inst_InstructionMemory: InstructionMemory PORT MAP(
		Address => PCToIM,
		Reset => Reset,
		OutInstruction => IMOut
	);
	
	Inst_RegisterFile: RegisterFile PORT MAP(
		Rs1 => IMOut(18 downto 14),
		Rs2 => IMOut(4 downto 0),
		Rsd => IMOut(29 downto 25),
		DataToWrite => AluResultP,
		Crs1 => RFCrs1ToALU,
		Crs2 => RFCrs2ToMux,
		rst => Reset
	);
	
	Inst_ControlUnity: ControlUnity PORT MAP(
		Op => IMOut(31 downto 30),
		Op3 => IMOut(24 downto 19),
		AluOp => CUToALU
	);
	
	Inst_SignExtensionUnit: SignExtensionUnit PORT MAP(
		Imm13 => IMOut(12 downto 0),
		Sign_Ext => SEUToMux
	);
	
	Inst_Mux: Mux PORT MAP(
		ContentRegister => RFCrs2ToMux,
		Immediate => SEUToMux,
		ControlSignal => IMOut(13),
		MuxOut => MuxToAlu
	);
	
	Inst_Alu: Alu PORT MAP(
		Crs1 => RFCrs1ToALU,
		Crs2 => MuxToAlu,
		AluOp => CUToALU,
		AluResult => AluResultP
	);
	
	Result <= AluResultP;


end Behavioral;

