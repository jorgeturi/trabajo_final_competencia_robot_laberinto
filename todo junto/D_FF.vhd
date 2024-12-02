library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;


entity D_FF is
PORT 
( 	
	D,clk,reset: in std_logic;
	Q: out std_logic
);

end D_FF;


 -- CREA FLIP FLOP TIPO D
architecture behave of D_FF is
 
begin

	process (clk,reset)
	begin
		if reset='0' then
			Q <= '0';
	
		elsif (clk= '1' and clk'EVENT) then
			Q <= D;
			
		end if;
	
	end process;

end behave;

	
		