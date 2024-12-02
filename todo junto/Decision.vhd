library ieee;
use ieee.std_logic_1164.ALL;

entity Decision is
	port (
		OA : in std_logic_vector(1 downto 0); --orientaciòn actual
		OD : in std_logic_vector(1 downto 0); --orientaciòn deseada
		
		x : out std_logic_vector(1 downto 0)
		);
end Decision;
		
architecture behavioral of Decision is 
	signal orientacion : std_logic_vector(3 downto 0); --4 bits para representar las dos entradas OA(2)OD(2)
	signal accion : std_logic_vector(1 downto 0); -- señal intermedia para la salida
begin
	orientacion <= OA & OD; -- combinacion de las entradas
	process(orientacion) 
	begin
		case orientacion is 
		
			when "0000" => accion <= "00"; --OA: norte, OD: norte => avanza
			when "0001" => accion <= "01"; --OA: norte, OD: este => gira hacia la derecha
			when "0010" => accion <= "10"; --OA: norte, OD: oeste => gira hacia la izquierda
			when "0011" => accion <= "01"; --OA: norte, OD: sur => gira hacia la derecha
			
			when "0100" => accion <= "10"; --OA: este, OD: norte => gira hacia la izquierda
			when "0101" => accion <= "00"; --OA: este, OD: norte => avanza
			when "0110" => accion <= "01"; --OA: este, OD: norte => gira hacia la derecha
			when "0111" => accion <= "01"; --OA: este, OD: norte => gira hacia la derecha
			
			when "1000" => accion <= "01"; --OA: oeste, OD: norte => gira hacia la derecha
			when "1001" => accion <= "01"; --OA: oeste, OD: norte => gira hacia la derecha
			when "1010" => accion <= "00"; --OA: oeste, OD: norte => avanza
			when "1011" => accion <= "10"; --OA: oeste, OD: norte => gira hacia la izquierda
			
			when "1100" => accion <= "01"; --OA: sur, OD: norte => gira hacia la derecha
			when "1101" => accion <= "10"; --OA: sur, OD: norte => gira hacia la izquierda
			when "1110" => accion <= "01"; --OA: sur, OD: norte => gira hacia la derecha
			when "1111" => accion <= "00"; --OA: sur, OD: norte => avanza
			
			-- Se toma cuando se necesita un giro de 180 como giro hacia la derecha esperando que despuès corrija debidamente
			
		end case;
	end process;
	
		x <= accion;
	
end behavioral;