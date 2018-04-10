
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX is
    Port ( CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           outSEU : in  STD_LOGIC_VECTOR (31 downto 0);
           I : in  STD_LOGIC;
           outMUX : out  STD_LOGIC_VECTOR(31 downto 0));
end MUX;

architecture Behavioral of MUX is

begin

PROCESS (CRS2, outSEU, I) IS
       BEGIN
         CASE I IS
           WHEN '0' => outMUX <= (others => '0');
           WHEN '1' => outMUX <= CRS2;
           WHEN OTHERS => outMUX <= (others => '0');
         END CASE;
       END PROCESS;

end Behavioral;

