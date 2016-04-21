LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Procesador3_tb IS
END Procesador3_tb;
 
ARCHITECTURE behavior OF Procesador3_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador_3
    PORT(
         Clk : IN  std_logic;
         rst : IN  std_logic;
         Alu_Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal Alu_Result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador_3 PORT MAP (
          Clk => Clk,
          rst => rst,
          Alu_Result => Alu_Result
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
      -- hold reset state for 100 ns.
		
		rst <= '1';
      wait for 100 ns;	
		
		rst <= '0';

      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
