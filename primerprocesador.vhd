
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity primerprocesador is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           resultado : out  STD_LOGIC_vector (31 downto 0));
end primerprocesador;

architecture Behavioral of primerprocesador is
COMPONENT PC
	PORT(
		PCAddr : IN std_logic_vector(3 downto 0);
		rst : IN std_logic;
		CLK : IN std_logic;          
		PCout : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT sumador
	PORT(
		A : IN std_logic_vector(3 downto 0);
		B : IN std_logic_vector(3 downto 0);          
		S : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(3 downto 0);
		reset : IN std_logic;
		clkFPGA : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RF
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		writeEnable : IN std_logic;
		DWR : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0);
		crd : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT UC
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU
	PORT(
		CRS1 : IN std_logic_vector(31 downto 0);
		CRS2 : IN std_logic_vector(31 downto 0);
		ALUOP : IN std_logic_vector(5 downto 0);
		DWR : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	signal addressToNPC, PCToAdderToInstruccionMemory,auxNextInstruction : std_logic_vector(3 downto 0);
	signal auxInstruccion,auxDataToWrite,auxContentRegisterSource1,auxContentRegisterDestination,auxContentRegisterSource2: std_logic_vector(31 downto 0);
	signal auxWriteEnable: std_logic;
	signal auxAluOP: std_logic_vector(5 downto 0);
	signal rfDest,wrEnMem,carry : std_logic:='0';
	signal rfSource,pcSource: std_logic_vector(1 downto 0):="00";

begin
	Inst_nPC: PC PORT MAP(
		PCAddr => addressToNPC,
		rst => rst,
		CLK => clk,
		PCout => auxNextInstruction
	);

	Inst_PC: PC PORT MAP(
		PCAddr => auxNextInstruction,
		rst => rst,
		CLK => clk,
		PCout => PCToAdderToInstruccionMemory 
	);

	Inst_adder: sumador PORT MAP(
		A => "0001",
		B => PCToAdderToInstruccionMemory,
		S => addressToNPC
	);
	
	Inst_instructionMemory: instructionMemory PORT MAP(
		address => PCToAdderToInstruccionMemory,
		reset => rst,
		clkFPGA => clk,
		outInstruction => auxInstruccion
	);

	Inst_registerFile: RF PORT MAP(
		clk => clk,
		rst => rst,
		rs1 => auxInstruccion(18 downto 14),
		rs2 => auxInstruccion(4 downto 0),
		rd => auxInstruccion(29 downto 25),
		writeEnable => auxWriteEnable,
		DWR => auxDataToWrite,
		crs1 => auxContentRegisterSource1,
		crs2 => auxContentRegisterSource2,
		crd => auxContentRegisterDestination 
	);
	
	Inst_unidadControl: UC PORT MAP(
		op => auxInstruccion(31 downto 30),
		op3 => auxInstruccion(24 downto 19),
		ALUOP => auxAluOP
	);

	Inst_ALU: ALU PORT MAP(
		CRS1 => auxContentRegisterSource1,
		CRS2 => auxContentRegisterSource2,
		ALUOP => auxAluOP,
		DWR => auxDataToWrite
	);

	resultado <= auxDataToWrite;

end Behavioral;

