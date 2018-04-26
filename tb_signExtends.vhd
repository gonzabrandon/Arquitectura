
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY tb_signExtends IS
END tb_signExtends;
 
ARCHITECTURE behavior OF tb_signExtends IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT signExtends
    PORT(
         entrada13 : IN  std_logic_vector(12 downto 0);
         salida32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entrada13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal salida32 : std_logic_vector(31 downto 0);
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: signExtends PORT MAP (
          entrada13 => entrada13,
          salida32 => salida32
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
		entrada13 <= "0000000000000";
      wait for 100 ns;	
		entrada13 <= "1111111111111";
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
