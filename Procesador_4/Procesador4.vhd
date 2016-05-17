
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador4 is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador4;

architecture Behavioral of Procesador4 is

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

	COMPONENT ControlUnit
		PORT(
			Op : IN std_logic_vector(1 downto 0);
			Op2 : IN std_logic_vector(2 downto 0);
			Op3 : IN std_logic_vector(5 downto 0);
			icc : IN std_logic_vector(3 downto 0);
			cond : IN std_logic_vector(3 downto 0);          
			rfDest : OUT std_logic;
			rfSource : OUT std_logic_vector(1 downto 0);
			wrEnMem : OUT std_logic;
			wrEnRF : OUT std_logic;
			pcSource : OUT std_logic_vector(1 downto 0);
			AluOp : OUT std_logic_vector(5 downto 0)
			);
	END COMPONENT;

	COMPONENT DataMemory
	PORT(
		crd : IN std_logic_vector(31 downto 0);
		WrenMem : IN std_logic;
		RdenMem : IN std_logic;
		AluResult : IN std_logic_vector(31 downto 0);
		Clk : IN std_logic;
		Reset : IN std_logic;          
		DatetoMem : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT InstructionMemory
	PORT(
		Address : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;          
		OutInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT MuxAlu
	PORT(
		crs2 : IN std_logic_vector(31 downto 0);
		i : IN std_logic;
		sing_ext : IN std_logic_vector(31 downto 0);          
		op2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MuxNpc
	PORT(
		PcSource : IN std_logic_vector(1 downto 0);
		Pcdisp30 : IN std_logic_vector(31 downto 0);
		Pcdisp22 : IN std_logic_vector(31 downto 0);
		Pc : IN std_logic_vector(31 downto 0);
		AluOut : IN std_logic_vector(31 downto 0);          
		toNpc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT Mux_DataToWr
	PORT(
		DataToMem : IN std_logic_vector(31 downto 0);
		AluResult : IN std_logic_vector(31 downto 0);
		Pc : IN std_logic_vector(31 downto 0);
		RfSource : IN std_logic_vector(1 downto 0);          
		DataToReg : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT Mux_RF
	PORT(
		Rd : IN std_logic_vector(5 downto 0);
		R07 : IN std_logic_vector(5 downto 0);
		RfDest : IN std_logic;          
		nrd : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PSRModifier
	PORT(
		aluResult : IN std_logic_vector(31 downto 0);
		aluOp : IN std_logic_vector(5 downto 0);
		operando1 : IN std_logic;
		reset : IN std_logic;
		operando2 : IN std_logic;          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	COMPONENT PSR
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		clk : IN std_logic;
		nCWP : IN std_logic;
		rst : IN std_logic;          
		Carry : OUT std_logic;
		CWP : OUT std_logic;
		icc : OUT std_logic_vector(3 downto 0)
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
		Rs1 : IN std_logic_vector(5 downto 0);
		Rs2 : IN std_logic_vector(5 downto 0);
		Rsd : IN std_logic_vector(5 downto 0);
		DataToWrite : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		writeEnable : IN std_logic;          
		Crs1 : OUT std_logic_vector(31 downto 0);
		Crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT SignExtensionUnit22
		PORT(
		disp22 : IN std_logic_vector(21 downto 0);          
		seudisp22 : OUT std_logic_vector(31 downto 0)
		);
		END COMPONENT;
		
	COMPONENT SignExtensionUnit
	PORT(
		Imm13 : IN std_logic_vector(12 downto 0);          
		Sign_Ext : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT WindowsManager
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		cwp : IN std_logic;          
		nrs1 : OUT std_logic_vector(5 downto 0);
		nrs2 : OUT std_logic_vector(5 downto 0);
		nrd : OUT std_logic_vector(5 downto 0);
		ncwp : OUT std_logic;
		Registro07 : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
		COMPONENT SeuDisp30
	PORT(
		Disp30 : IN std_logic_vector(29 downto 0);          
		Salida : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal adderDisp30Operand2,Crd,NpcOut,PcOut,ImOut,Seu,AluResult,Crs1,Crs2,op2,DataToMem,DataToReg,Seu22,adder1,adder2,adder3,SMuxNpc : std_logic_vector(31 downto 0);
	signal WmNrs1,WmNrs2,WmNrd,Ro7,AluOp,nRd: std_logic_vector(5 downto 0);
	signal Rfdest,Ncwp,wrEnMem,wrEnRF,Carry,SCwp,RdEnMen :std_logic;
	signal PcSource, rfSource :std_logic_vector(1 downto 0);
	signal icc,nzvc : STD_LOGIC_VECTOR(3 downto 0);
begin


Inst_PcAdder: Adder PORT MAP(
		AddIn => NpcOut,
		Increment => "00000000000000000000000000000001",
		AddOut => adder1
	);
	

Inst_Disp22Adder: Adder PORT MAP(
		AddIn => Seu22,
		Increment => PcOut,
		AddOut => adder2
	);
	
--adderDisp30Operand2 <= "00"&ImOut(29 downto 0);--OJO CON EL SIGNO

Inst_Disp30Adder: Adder PORT MAP(
		AddIn => adderDisp30Operand2,
		Increment => PcOut,
		AddOut => adder3
	);

Inst_Alu: Alu PORT MAP(
	Crs1 => Crs1,
	Crs2 => op2,
	AluOp => AluOp,
	Carry => Carry,
	AluResult => AluResult
);


Inst_ControlUnit: ControlUnit PORT MAP(
		Op => ImOut(31 downto 30),
		Op2 => ImOut(24 downto 22),
		Op3 => ImOut(24 downto 19),
		icc => icc,
		cond => ImOut(28 downto 25),
		rfDest => Rfdest,
		rfSource => rfSource,
		wrEnMem => wrEnMem,
		wrEnRF => wrEnRF,
		pcSource => PcSource,
		AluOp => AluOp
	);

Inst_DataMemory: DataMemory PORT MAP(
	crd => Crd,
	WrenMem => wrEnMem,
	RdenMem => RdEnMen,
	AluResult => AluResult,
	Clk => clk,
	Reset => reset,
	DatetoMem => DataToMem
);


Inst_InstructionMemory: InstructionMemory PORT MAP(
		Address => PcOut,
		Reset => reset,
		OutInstruction =>ImOut 
	);


Inst_MuxAlu: MuxAlu PORT MAP(
	crs2 => Crs2,
	i => ImOut(13),
	sing_ext => Seu,
	op2 => op2
);

Inst_MuxNpc: MuxNpc PORT MAP(
		PcSource => PcSource,
		Pcdisp30 => adder3,
		Pcdisp22 => adder2,
		Pc => adder1,
		AluOut => AluResult,
		toNpc => SMuxNpc
	);



Inst_Mux_DataToWr: Mux_DataToWr PORT MAP(
	DataToMem => DataToMem,
	AluResult => AluResult,
	Pc => PcOut,
	RfSource => rfSource,
	DataToReg => DataToReg
);

Inst_Mux_RF: Mux_RF PORT MAP(
		Rd => WmNrd,
		R07 => Ro7,
		RfDest => Rfdest,
		nrd => nRd
	);
Inst_PSRModifier: PSRModifier PORT MAP(
		aluResult => AluResult,
		aluOp => AluOp,
		operando1 => Crs1(31),
		reset => reset,
		operando2 => op2(31),
		nzvc => nzvc
	);
Inst_PSR: PSR PORT MAP(
		nzvc => nzvc,
		clk => clk,
		nCWP => Ncwp,
		rst => reset,
		Carry => Carry,
		CWP => SCwp,
		icc => icc
	);
	
Inst_ProgramCounter: ProgramCounter PORT MAP(
	Pcin => NpcOut,
	clk => clk,
	rst => reset,
	Pcout => PcOut
);

Inst_NextProgramCounter: ProgramCounter PORT MAP(
	Pcin => SMuxNpc,
	clk => clk,
	rst => reset,
	Pcout => NpcOut
);

Inst_RegisterFile: RegisterFile PORT MAP(
		Rs1 => WmNrs1,
		Rs2 => WmNrs2,
		Rsd => nRd,
		DataToWrite => DataToReg,
		rst => reset,
		writeEnable => wrEnRF,
		Crs1 => Crs1,
		Crs2 => Crs2
	);
	
Inst_SignExtensionUnit22: SignExtensionUnit22 PORT MAP(
	disp22 => ImOut(21 downto 0),
	seudisp22 => Seu22
);

Inst_SignExtensionUnit: SignExtensionUnit PORT MAP(
	Imm13 => ImOut(12 downto 0),
	Sign_Ext => Seu
);

Inst_WindowsManager: WindowsManager PORT MAP(
	op => ImOut(31 downto 30),
	op3 => ImOut(24 downto 19),
	rd => ImOut(29 downto 25),
	rs1 => ImOut(18 downto 14),
	rs2 => ImOut(4 downto 0),
	cwp => SCwp,
	nrs1 => WmNrs1,
	nrs2 => WmNrs2,
	nrd => WmNrd,
	ncwp => Ncwp,
	Registro07 =>Ro7 
);

Inst_SeuDisp30: SeuDisp30 PORT MAP(
		Disp30 => ImOut(29 downto 0),
		Salida => adderDisp30Operand2
	);

result <= AluResult;

end Behavioral;

