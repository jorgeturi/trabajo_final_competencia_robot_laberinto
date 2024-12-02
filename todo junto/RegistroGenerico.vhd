library ieee;
use ieee. std_logic_1164.all;
use ieee. std_logic_arith.all;
use ieee. std_logic_unsigned.all;


entity RegistroGenerico is
PORT 
( 	
	D, RS: in std_logic_vector(3 downto 0);
	clk,reset: in std_logic;
	
	Q: out std_logic_vector(3 downto 0)
);

end RegistroGenerico;


 -- CREA REGISTRO GENERICO, LUEGO EN ESQUEMATICO
architecture behave of RegistroGenerico is
 
 
signal D_bus, Q_bus, RS_bus: std_logic_vector(3 downto 0):= (others=>'0');


begin

	
	process (clk,reset)
	begin
	-- FLANCO ALTO
		if (reset = '0') then
			Q_bus(3) <= RS_bus(3);
			Q_bus(2) <= RS_bus(2);
			Q_bus(1) <= RS_bus(1);
			Q_bus(0) <= RS_bus(0);
			
		elsif (clk = '1' and clk'EVENT) then
			Q_bus(3) <= D_bus(3);
			Q_bus(2) <= D_bus(2);
			Q_bus(1) <= D_bus(1);
			Q_bus(0) <= D_bus(0);
			
		end if;
	
	end process;
	
	RS_bus <= RS;
	D_bus <= D;
	
	Q <= Q_bus;
	
	
end behave;

	
		