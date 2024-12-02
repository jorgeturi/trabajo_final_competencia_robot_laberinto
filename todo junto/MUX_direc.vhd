library ieee;
use ieee. std_logic_1164.all;

entity MUX_direc is

port (
		C1: in std_logic;
		C2: in std_logic;
		C3: in std_logic;
		
		direc: out std_logic_vector (1 downto 0)
);

end MUX_direc;


architecture behave of MUX_direc is




 begin
	process (C1,C2,C3)
	begin
		if C3 = '1' then
			direc <= C1 & C3;
		else
			direc <= C2 & C3;
		end if;
	
	end process;
 
 end behave;