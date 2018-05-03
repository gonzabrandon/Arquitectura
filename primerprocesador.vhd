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
		PCAddr : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;
		CLK : IN std_logic;          
		PCout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT sumador
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		S : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT signExtends
	PORT(
		entrada13 : IN std_logic_vector(12 downto 0);
		salida32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT rf
	PORT(
		--clk : IN std_logic;
		rst : IN std_logic;
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		DWR : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT UC
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUX 
	PORT(
		CRS2 : IN std_logic_vector(31 downto 0);
		outSEU : IN std_logic_vector(31 downto 0);
		I : IN std_logic;
		outMUX : OUT std_logic_vector(31 downto 0)
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

	-- datapath signals
	signal out_adder: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_npcout: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_pcout: std_logic_vector(31 downto 0):=(others=>'0');
	-- im signals
	signal im_out: STD_LOGIC_VECTOR(31 downto 0):=(others=>'0');
	-- seu signals
	signal aux_seuout: std_logic_vector(31 downto 0):=(others=>'0');
	-- rf signals
	signal aux_crs1: std_logic_vector(31 downto 0):=(others=>'0');
	signal aux_crs2: std_logic_vector(31 downto 0):=(others=>'0');
	-- uc signals
	signal aux_aluop: std_logic_vector(5 downto 0):=(others=>'0');
	-- mux signals
	signal aux_muxout: std_logic_vector(31 downto 0):=(others=>'0');
	-- alu signals
	signal aux_aluout: std_logic_vector(31 downto 0):=(others=>'0');

begin
	inst_adder: sumador PORT MAP(
		A => "00000000000000000000000000000001",
		B => aux_pcout,
		S => out_adder
		);
		
	inst_npc: PC PORT MAP(
		PCAddr => out_adder,
		rst => rst,
		CLK => CLK,
		PCout => aux_npcout
		);
		
	inst_pc: PC PORT MAP(
		PCAddr => aux_npcout,
		rst => rst,
		clk => CLK,
		PCout => aux_pcout
		);
	
	inst_im: instructionMemory PORT MAP(
		--clk => CLK,
		reset => rst,
		address => aux_pcout,
		outInstruction => im_out
	);
	
	inst_seu: signExtends PORT MAP(
		entrada13 => im_out(12 downto 0),
		salida32 => aux_seuout
		);
		
	inst_rf: rf PORT MAP(
		RS1 => im_out(18 downto 14),
		RS2 => im_out(4 downto 0),
		RD => im_out(29 downto 25),
		DWR => aux_aluout,
		RST => rst,
		CRS1 => aux_crs1,
		CRS2 => aux_crs2
		);
	
	inst_uc: UC PORT MAP(
		OP => im_out(31 downto 30),
		OP3 => im_out(24 downto 19),
		ALUOP => aux_aluop
		);
	
	inst_mux: MUX PORT MAP(
		CRS2 => aux_crs2,
		outSEU => aux_seuout,
		I => im_out(13),
		outMUX => aux_muxout
		);
		
	inst_alu: ALU PORT MAP(
		CRS1 => aux_crs1,
		CRS2 => aux_muxout,
		ALUOP => aux_aluop,
		DWR => aux_aluout
		);
	
	resultado <= aux_aluout;

end Behavioral;
