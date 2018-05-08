--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:54:27 05/03/2018
-- Design Name:   
-- Module Name:   C:/Users/sebas/OneDrive/Escritorio/arquitectura/VHDL/PSR/psr_tb.vhd
-- Project Name:  PSR
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY psr_tb IS
END psr_tb;
 
ARCHITECTURE behavior OF psr_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         nzvc : IN  std_logic_vector(3 downto 0);
         nCWP : IN  std_logic_vector(4 downto 0);
         CWP : OUT  std_logic_vector(4 downto 0);
         carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
   signal nCWP : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal CWP : std_logic_vector(4 downto 0);
   signal carry : std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          clock => clock,
          reset => reset,
          nzvc => nzvc,
          nCWP => nCWP,
          CWP => CWP,
          carry => carry
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
reset <= '1';	
wait for 2 ns;	
		reset <= '0';
		nzvc <= "0001";
		wait for 10 ns;
		nzvc <= "0000";
		
		wait for 10 ns;
		nzvc <= "0101";
		ncwp <= "00001";
		
		wait for 10 ns;
		nzvc <= "0000";
		
		wait for 10 ns;
		nzvc <= "0111";
		wait for 10 ns;
		
		nzvc <= "0010";
		ncwp <= "00000";
		
		wait for 10 ns;
		reset <= '1';
		nzvc <= "0101";
		
		wait for 10 ns;
		ncwp <= "00001";
		nzvc <= "0010";
		reset <= '0';
		
		wait for 10 ns;
		nzvc <= "1001";
      wait;
   end process;

END;
