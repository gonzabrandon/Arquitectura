
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_PC IS
END tb_PC;
 
ARCHITECTURE behavior OF tb_PC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         PCAddr : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         CLK : IN  std_logic;
         PCout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal PCAddr : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal PCout : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          PCAddr => PCAddr,
          rst => rst,
          CLK => CLK,
          PCout => PCout
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
		PCAddr <= "00000000000000000000000000000001";
      wait for 100 ns;	
		rst <= '0';
		PCAddr <= "00000000000000000000000000000011";
		wait for 100 ns;
		rst <= '1';		

      -- insert stimulus here 

      wait;
   end process;

END;
