----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:08:45 05/01/2018 
-- Design Name: 
-- Module Name:    PSR - psrArquitecture 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PSR is
    Port ( clock : in STD_LOGIC;
				reset : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           nCWP : in  STD_LOGIC_VECTOR (4 downto 0);
           CWP : out  STD_LOGIC_VECTOR (4 downto 0);
           carry : out  STD_LOGIC);
           
			  
end PSR;

architecture psrArquitecture of PSR is

signal PSRegistro: STD_LOGIC_VECTOR (31 DOWNTO 0) := "00000000000000000000000000000000";
begin	
	process(clock,reset,nzvc)
		begin		
			if(reset = '1') then
				PSRegistro <="00000000000000000000000000000000";
				
			elsif (clock'event and clock='1')then
				PSRegistro(26 downto 23) <= nzvc;
				PSRegistro(4 downto 0) <= ncwp;
		end if;
		end process;
	carry <= PSRegistro(23);
	CWP <= PSRegistro(4 downto 0);
	

end psrArquitecture;

