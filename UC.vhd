
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
			when "000001" => ALUOP <= "000001";
			when "000101" => ALUOP <= "000101";
			when "000010" => ALUOP <= "000010";
			when "000110" => ALUOP <= "000110";
			when "000011" => ALUOP <= "000011";
			when "000111" => ALUOP <= "000111";
			when others   => ALUOP <= "000000";
		end case;
end process;
	

end Behavioral;

