library ieee;
use ieee.STD_logic_1164.all;

entity VectorValorCasilla is
PORT (
		
		--registros dentro de matriz(valor de cuadrilla)
		
		int6: out std_logic_vector(3 downto 0);
		int5: out std_logic_vector(3 downto 0);
		int4: out std_logic_vector(3 downto 0);
		int3: out std_logic_vector(3 downto 0);
		int2: out std_logic_vector(3 downto 0);
		int1: out std_logic_vector(3 downto 0);
		int0: out std_logic_vector(3 downto 0);
		Vec_comp: out std_logic_vector(3 downto 0)
		
		);


end VectorValorCasilla;

architecture behave of VectorValorCasilla is

begin
		
	--6s
	int6 <= "0110";
			 
	--5s
	int5 <= "0101";
			  
	--4s
	int4 <= "0100";
			 
	--3s
	int3 <= "0011";
					 
	--2s
	int2 <= "0010";
			
			 
	--1s
	int1 <= "0001";
			
			 
	--bandera
	int0 <= "0000";
	


	--maximo posible
	Vec_comp <= "1110";
			 

end behave;

