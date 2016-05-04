LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY DataMemoryTB IS
END DataMemoryTB;
 
ARCHITECTURE behavior OF DataMemoryTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DataMemory
    PORT(
         crd : IN  std_logic_vector(31 downto 0);
         WrenMem : IN  std_logic;
         RdenMem : IN  std_logic;
         AluResult : IN  std_logic_vector(31 downto 0);
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         DatetoMem : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal crd : std_logic_vector(31 downto 0) := (others => '0');
   signal WrenMem : std_logic := '0';
   signal RdenMem : std_logic := '0';
   signal AluResult : std_logic_vector(31 downto 0) := (others => '0');
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal DatetoMem : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DataMemory PORT MAP (
          crd => crd,
          WrenMem => WrenMem,
          RdenMem => RdenMem,
          AluResult => AluResult,
          Clk => Clk,
          Reset => Reset,
          DatetoMem => DatetoMem
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
		
		Reset <= '1';
		RdenMem <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		Reset <= '0';
		RdenMem <= '1';
		WrenMem <= '1';
		crd <= "00000000000000000000000000000111";
		AluResult <= "00000000000000000000000000000111";
		
		wait for Clk_period*10;
		Reset <= '0';
		RdenMem <= '1';
		WrenMem <= '0';
		crd <= "00000000000000000000000000000000";
		AluResult <= "00000000000000000000000000000111";
		
		wait for Clk_period*10;
      -- insert stimulus here 

      wait;
   end process;

END;
