LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY procesador2_tb IS
END procesador2_tb;
 
ARCHITECTURE behavior OF procesador2_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT procesador2
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: procesador2 PORT MAP (
          Clk => Clk,
          Reset => Reset,
          Result => Result
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
		Reset <= '1';
      wait for 100 ns;	
		
		Reset <= '0';
      wait for Clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
