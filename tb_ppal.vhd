
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ppal IS
END tb_ppal;
 
ARCHITECTURE behavior OF tb_ppal IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ppal
    PORT(
         rst : IN  std_logic;
         CLK : IN  std_logic;
         Addrsalida : INOUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal Addrsalida : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ppal PORT MAP (
          rst => rst,
          CLK => CLK,
          Addrsalida => Addrsalida
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1';
      wait for 100 ns;
		rst <= '0';

      -- insert stimulus here 

      wait;
   end process;

END;
