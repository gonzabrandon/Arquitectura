
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         ALUOP : IN  std_logic_vector(5 downto 0);
         CRS1 : IN  std_logic_vector(31 downto 0);
         CRS2 : IN  std_logic_vector(31 downto 0);
         DRW : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ALUOP : std_logic_vector(5 downto 0) := (others => '0');
   signal CRS1 : std_logic_vector(31 downto 0) := (others => '0');
   signal CRS2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DRW : std_logic_vector(31 downto 0);
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          ALUOP => ALUOP,
          CRS1 => CRS1,
          CRS2 => CRS2,
          DRW => DRW
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		aluop <= "000001";
		crs1 <= "00000000000000000000000000000000";
		crs2 <= "00000000000000000000000000001111";
      wait for 100 ns;	
		aluop <= "000101";
		crs1 <= "00000000000000000000000000000000";
		crs2 <= "00000000000000000000000000001111";
      wait for 100 ns;	
		aluop <= "000010";
		crs1 <= "00000000000000000000000000000000";
		crs2 <= "00000000000000000000000000001111";
      wait for 100 ns;	
		aluop <= "000110";
		crs1 <= "00000000000000000000000000000000";
		crs2 <= "00000000000000000000000000001111";
      wait for 100 ns;	
		aluop <= "000011";
		crs1 <= "00000000000000000000000000000000";
		crs2 <= "00000000000000000000000000001111";
      wait for 100 ns;	
		aluop <= "000111";
		crs1 <= "00000000000000000000000000000000";
		crs2 <= "00000000000000000000000000001111";
      

      -- insert stimulus here 

      wait;
   end process;

END;
