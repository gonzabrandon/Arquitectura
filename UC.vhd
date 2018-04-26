
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity UC is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture Behavioral of UC is

begin
PROCESS (OP3) is
	begin 
		case OP3 is 
				WHEN "000001" =>    ALUOP <= "000001"; --add
				WHEN "000101" =>    ALUOP <= "000101"; --addn
				WHEN "000010" =>    ALUOP <= "000010"; --or
				WHEN "000110" =>    ALUOP <= "000110"; --orn
				WHEN "000011" =>    ALUOP <= "000011"; --xor
				WHEN "010111" =>    ALUOP <= "010111"; --xnor
				WHEN "000000" =>    ALUOP <= "000000"; --ad
				WHEN "000100" =>    ALUOP <= "000100"; --sub
				WHEN  OTHERS  =>    ALUOP <= "000000"; --nada 
		end case;
end process;
	

end Behavioral;

