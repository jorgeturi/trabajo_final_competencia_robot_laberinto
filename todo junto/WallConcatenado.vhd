library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;


entity WallConcatenado is


PORT 
( 	
	w1: in std_logic;
	w2: in std_logic;
	w3: in std_logic;
	w4: in std_logic;
	w5: in std_logic;
	w6: in std_logic;
	w7: in std_logic;
	w8: in std_logic;
	w9: in std_logic;
	w10: in std_logic;
	w11: in std_logic;
	w12: in std_logic;
	w13: in std_logic;
	w14: in std_logic;
	w15: in std_logic;
	w16: in std_logic;
	w17: in std_logic;
	w18: in std_logic;
	w19: in std_logic;
	w20: in std_logic;
	w21: in std_logic;
	w22: in std_logic;
	w23: in std_logic;
	w24: in std_logic;
	
	wo1: out std_logic;
	wo2: out std_logic;
	wo3: out std_logic;
	wo4: out std_logic;
	wo5: out std_logic;
	wo6: out std_logic;
	wo7: out std_logic;
	wo8: out std_logic;
	wo9: out std_logic;
	wo10: out std_logic;
	wo11: out std_logic;
	wo12: out std_logic;
	wo13: out std_logic;
	wo14: out std_logic;
	wo15: out std_logic;
	wo16: out std_logic;
	wo17: out std_logic;
	wo18: out std_logic;
	wo19: out std_logic;
	wo20: out std_logic;
	wo21: out std_logic;
	wo22: out std_logic;
	wo23: out std_logic;
	wo24: out std_logic;
	
	clk: in std_logic;
	reset: out std_logic
	
);

end WallConcatenado;


 
architecture behave of WallConcatenado is

 -- CREA VARIABLES PARA FLIP FLOP TIPO D
COMPONENT d_ff
	PORT(D : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 Q : OUT STD_LOGIC
	);
END COMPONENT;

	
b2v_inst1 : d_ff
PORT MAP(D => w1,
		 clk => clk,
		 reset => reset,
		 Q => O1);


b2v_inst2 : d_ff
PORT MAP(D => w2,
		 clk => clk,
		 reset => reset,
		 Q => O2);
	
	
b2v_inst3 : d_ff
PORT MAP(D => w3,
		 clk => clk,
		 reset => reset,
		 Q => O1);


b2v_inst4 : d_ff
PORT MAP(D => w4,
		 clk => clk,
		 reset => reset,
		 Q => O2);
	
	
b2v_inst4 : d_ff
PORT MAP(D => w5,
		 clk => clk,
		 reset => reset,
		 Q => O1);


b2v_inst5 : d_ff
PORT MAP(D => w6,
		 clk => clk,
		 reset => reset,
		 Q => O2);
	
b2v_inst : d_ff
PORT MAP(D => D1,
		 clk => clk,
		 reset => reset,
		 Q => O1);


b2v_inst1 : d_ff
PORT MAP(D => D2,
		 clk => clk,
		 reset => reset,
		 Q => O2);
	
b2v_inst : d_ff
PORT MAP(D => D1,
		 clk => clk,
		 reset => reset,
		 Q => O1);


b2v_inst1 : d_ff
PORT MAP(D => D2,
		 clk => clk,
		 reset => reset,
		 Q => O2);
	
b2v_inst : d_ff
PORT MAP(D => D1,
		 clk => clk,
		 reset => reset,
		 Q => O1);


b2v_inst1 : d_ff
PORT MAP(D => D2,
		 clk => clk,
		 reset => reset,
		 Q => O2);
	
	
end behave;



