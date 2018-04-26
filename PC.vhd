
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity PC is
    Port ( PCAddr : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           PCout : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end PC;

architecture Behavioral of PC is

begin
	process(CLK,rst)
	begin
	   if (rising_edge(clk)) then
			if(rst = '1') then
				PCout <= "00000000000000000000000000000000";
			
			else 
				PCout <= PCAddr;
				
			end if;
		end if;
		
	end process;

end Behavioral;

