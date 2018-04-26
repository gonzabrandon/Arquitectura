
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY tb_UC IS
END tb_UC;
 
ARCHITECTURE behavior OF tb_UC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UC
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         ALUOP : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal OP : std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal ALUOP : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: UC PORT MAP (
          OP => OP,
          OP3 => OP3,
          ALUOP => ALUOP
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      OP <= "10";
		OP3 <= "000001";
      wait for 100 ns;	
		OP <= "10";
		OP3 <= "000111";


      -- insert stimulus here 

      wait;
   end process;

END;
