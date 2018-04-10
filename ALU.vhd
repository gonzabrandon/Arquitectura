
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity ALU is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (5 DOWNTO 0);
           CRS1 : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           DRW : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end ALU;

architecture Behavioral of ALU is

begin

PROCESS (ALUOP,CRS1,CRS2) IS
	BEGIN 
		CASE ALUOP IS
			WHEN "000001" => DRW <= CRS1 AND CRS2;				--AND
			WHEN "000101" => DRW <= NOT (CRS1 AND CRS2);		--ANDN
			WHEN "000010" => DRW <= CRS1 OR CRS2;				--OR
			WHEN "000110" => DRW <= NOT (CRS1 OR CRS2);		--ORN
			WHEN "000011" => DRW <= CRS1 XOR CRS2;				--XOR	
			WHEN "000111" => DRW <= NOT(CRS1 XOR CRS2);		--XNOR
			WHEN OTHERS   => DRW <= (OTHERS => '0');			
		END CASE;
END PROCESS;

	
end Behavioral;

