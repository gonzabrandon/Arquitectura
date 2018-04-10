
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ppal is
    Port ( rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Addrsalida : inout  STD_LOGIC_VECTOR (31 downto 0));
end ppal;


architecture Behavioral of ppal is

COMPONENT PC
    PORT(
         PCAddr : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         CLK : IN  std_logic;
         PCout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

COMPONENT sumador
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         S : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

signal nPC : std_logic_vector (31 downto 0);
signal other : std_logic_vector (31 downto 0);

begin

instan_PC : PC port map(
	PCAddr => nPC,
	rst => rst,
	CLK => CLK,
	PCout => Addrsalida
	);
	
instan_sum : sumador port map (
	A => "00000000000000000000000000000100",
	b => nPC,
	S => other
	);
	
intan_nPC : PC port map(
	PCAddr => other,
	rst => rst,
	CLK => CLK,
	PCout => nPC
	);	 
	 

end Behavioral;

