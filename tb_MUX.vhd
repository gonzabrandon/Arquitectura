

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY tb_MUX IS
END tb_MUX;
 
ARCHITECTURE behavior OF tb_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         CRS2 : IN  std_logic_vector(31 downto 0);
         outSEU : IN  std_logic_vector(31 downto 0);
         I : IN  std_logic;
         outMUX : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRS2 : std_logic_vector(31 downto 0) := (others => '0');
   signal outSEU : std_logic_vector(31 downto 0) := (others => '0');
   signal I : std_logic := '0';

 	--Outputs
   signal outMUX : std_logic_vector(31 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          CRS2 => CRS2,
          outSEU => outSEU,
          I => I,
          outMUX => outMUX
        );

   -- Stimulus process
   stim_proc: process
   begin		
      
		CRS2   <= "00000000000000000000000000000000";
		outSEu <= "11111111111111111111111111111111";
		I      <= '0';		
      wait for 100 ns;	
		CRS2   <= "00011111000000000000000000000000";
		outSEu <= "11111111111110001111111111111110";
		I      <= '1';
		wait for 100 ns;	
		CRS2   <= "00011111000000000000000000000011";
		outSEu <= "00011111111110001111111111111110";
		I      <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
