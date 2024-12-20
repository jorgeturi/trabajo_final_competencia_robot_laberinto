LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ubicacion2 is

	port (SD : in std_logic;
			SI	: in std_logic;
			SF : in std_logic;
			SL : in std_logic;
			
			E 		 : in std_logic;
			x 		 : in std_logic_vector (1 downto 0);
			reset  : in std_logic;
			
			posicion_out    : out std_logic_vector (3 downto 0);
			orientacion_out : out std_logic_vector (1 downto 0);
			E_delay_out     : out std_logic);
	

end ubicacion2;

architecture behave of ubicacion2 is

		signal posicion 	 : std_logic_vector (3 downto 0) := "0000";			-- inicia en la casilla 0
		signal orientacion : std_logic_vector (1 downto 0) := "00";				-- mirando al norte
		signal E_delay     : std_logic 							:= '0';

	begin 
	
	--numeracion de casillas del tablero
	
	--				10  14  6  2
	--				11  15  7  3
	--				9   13  5  1
	--				8   12  4  0		
	
	--numeracion de orientaciones
	
	--				este					  : 01
	-- 			oeste					  : 10
	-- 			norte 				  : 00
	--				sur					  : 11
	
	--numeracion de movimientos
	
	--				giré a la derecha   : 01
	-- 			gire a la izquierda : 10
	-- 			avancé 				  : 00
	--				retrocedí			  : 11
	
	

	process (E, reset)													--proceso para actualizar orientacion

	begin
	
		if rising_edge (E) then
		
			E_delay <= '1';
		
			case orientacion is											--orientacion actual respecto a orientacion anterior y movimiento realizado
		
				when "00" => 												--estaba apuntando al norte y...
			
					case x is
					
						when "00" => orientacion <= "00";			--avancé, sigo apuntando al norte 
						
						when "01" => orientacion <= "01";			--gire a la derecha, ahora apunto al este
																	
						when "10" => orientacion <= "10";			--gire a la izquierda, ahora apunto al oeste

						when "11" => orientacion <= "11";			--retrocedi, ahora apunto al sur					
						
					end case;
							
				when "01" => 												--estaba apuntando al este y...
			
					case x is
					
						when "00" => orientacion <= "01";			--avancé, sigo apuntando al este 
						
						when "01" => orientacion <= "11";			--gire a la derecha, ahora apunto al sur
																	
						when "10" => orientacion <= "00";			--gire a la izquierda, ahora apunto al norte

						when "11" => orientacion <= "10";				--retrocedi, ahora apunto al oeste					
						
					end case;
			
				when "10" => 												--estaba apuntando al oeste y...
			
					case x is
					
						when "00" => orientacion <= "10";			--avancé, sigo apuntando al oeste 
						
						when "01" => orientacion <= "00";			--gire a la derecha, ahora apunto al norte
																	
						when "10" => orientacion <= "11";			--gire a la izquierda, ahora apunto al sur

						when "11" => orientacion <= "11";			--retrocedi, ahora apunto al este					
						
					end case;
			
				when "11" => 												--estaba apuntando al sur y...
			
					case x is
					
						when "00" => orientacion <= "11";			--avancé, sigo apuntando al sur 
						
						when "01" => orientacion <= "10";			--gire a la derecha, ahora apunto al oeste
																	
						when "10" => orientacion <= "01";			--gire a la izquierda, ahora apunto al este

						when "11" => orientacion <= "00";			--retrocedi, ahora apunto al norte					
						
					end case;
			
			end case;
		
		end if;
		
		if E = '0' then 
		
			E_delay <= '0';
		
		end if;
	
	end process;	
			
--------------------------------------------------------------------------------------------------------------------------
		
	process (E_delay, reset)													--proceso para actualizar posicion

	begin
	
		if rising_edge (E_delay) then
			
			case posicion is												--posicion actual respecto a orientacion y posicion anterior 
			
				when "0000" =>												--estoy en casilla 0
			
					case orientacion is
				
						when "10" => posicion <= "0100";				--me movi al oeste y fui a la casilla 4
																	
						when "00" => posicion <= "0001";				--me movi al norte y fui a la casilla 1
				
						when others => posicion <= "0000";

					end case;					
			
				when "0001" =>												--estoy en casilla 1
			
					case orientacion is
						
						when "10" => posicion <= "0101";				--me movi al este y fui a la casilla 5
																	
						when "00" => posicion <= "0011";				--me movi al norte y fui a la casilla 3
				
						when "11" => posicion <= "0000";				--me movi al sur y fui a la casilla 0
						
						when others => posicion <= "0000";

					end case;
			
				when "0010" =>												--estoy en casilla 2
			
					case orientacion is
											
						when "10" => posicion <= "0110";				--me movi al oeste y fui a la casilla 6
																					
						when "11" => posicion <= "0011";				--me movi al sur y fui a la casilla 3
						
						when others => posicion <= "0000";

					end case;

				when "0011" =>												--estoy en casilla 3
			
					case orientacion is
											
						when "10" => posicion <= "0111";				--me movi al oeste y fui a la casilla 7
																	
						when "00" => posicion <= "0010";				--me movi al norte y fui a la casilla 2
				
						when "11" => posicion <= "0001";				--me movi al sur y fui a la casilla 1
						
						when others => posicion <= "0000";

					end case;	
						
				when "0100" =>												--estoy en casilla 4					
					
					case orientacion is
					
						when "01" => posicion <= "0000";				--me movi al este y fui a la casilla 0
						
						when "10" => posicion <= "1100";				--me movi al oeste y fui a la casilla 12
																	
						when "00" => posicion <= "0101";				--me movi al norte y fui a la casilla 5
										
						when others => posicion <= "0000";

					end case;		
			
				when "0101" =>												--estoy en casilla 5					
					
					case orientacion is
					
						when "01" => posicion <= "0001";				--me movi al este y fui a la casilla 1
						
						when "10" => posicion <= "1101";				--me movi al oeste y fui a la casilla 13
																	
						when "00" => posicion <= "0111";				--me movi al norte y fui a la casilla 7

						when "11" => posicion <= "0100";				--me movi al sur y fui a la casilla 4						
						
						when others => posicion <= "0000";

					end case;
					
				when "0110" =>												--estoy en casilla 6					
					
					case orientacion is
					
						when "01" => posicion <= "0010";				--me movi al este y fui a la casilla 2
						
						when "10" => posicion <= "1110";				--me movi al oeste y fui a la casilla 14
																	
						when "11" => posicion <= "0111";				--me movi al sur y fui a la casilla 7
										
						when others => posicion <= "0000";

					end case;
					
				when "0111" =>												--estoy en casilla 7					
					
					case orientacion is
					
						when "01" => posicion <= "0011";				--me movi al este y fui a la casilla 3
						
						when "10" => posicion <= "1111";				--me movi al oeste y fui a la casilla 15
																	
						when "00" => posicion <= "0110";				--me movi al norte y fui a la casilla 6

						when "11" => posicion <= "0101";				--me movi al sur y fui a la casilla 5						
						
						when others => posicion <= "0000";

					end case;
					
				when "1000" =>												--estoy en casilla 8					
					
					case orientacion is
					
						when "01" => posicion <= "1100";				--me movi al este y fui a la casilla 12
																							
						when "00" => posicion <= "1001";				--me movi al norte y fui a la casilla 9
						
						when others => posicion <= "0000";

					end case;
	
				when "1001" =>												--estoy en casilla 9					
					
					case orientacion is
					
						when "01" => posicion <= "1101";				--me movi al este y fui a la casilla 13
																							
						when "00" => posicion <= "1011";				--me movi al norte y fui a la casilla 11
						
						when "11" => posicion <= "1000";				--me movi al sur y fui a la casilla 8												
						
						when others => posicion <= "0000";

					end case;
	
				when "1010" =>												--estoy en casilla 10					
					
					case orientacion is
					
						when "01" => posicion <= "1110";				--me movi al este y fui a la casilla 14
																													
						when "11" => posicion <= "1011";				--me movi al sur y fui a la casilla 11												
						
						when others => posicion <= "0000";

					end case;	
					
				when "1011" =>												--estoy en casilla 11					
					
					case orientacion is
					
						when "01" => posicion <= "1111";				--me movi al este y fui a la casilla 15
																													
						when "00" => posicion <= "1010";				--me movi al norte y fui a la casilla 10
						
						when "11" => posicion <= "1001";				--me movi al sur y fui a la casilla 9														
						
						when others => posicion <= "0000";

					end case;	
					
				when "1100" =>												--estoy en casilla 12					
					
					case orientacion is
					
						when "01" => posicion <= "0100";				--me movi al este y fui a la casilla 4

						when "10" => posicion <= "1000";				--me movi al oeste y fui a la casilla 8
																													
						when "00" => posicion <= "1101";				--me movi al norte y fui a la casilla 13
												
						when others => posicion <= "0000";

					end case;	
					
				when "1101" =>												--estoy en casilla 13					
					
					case orientacion is
					
						when "01" => posicion <= "0101";				--me movi al este y fui a la casilla 5
						
						when "10" => posicion <= "1001";				--me movi al oeste y fui a la casilla 9
																	
						when "00" => posicion <= "1111";				--me movi al norte y fui a la casilla 15

						when "11" => posicion <= "1100";				--me movi al sur y fui a la casilla 12						
						
						when others => posicion <= "0000";

					end case;
					
				when "1110" =>												--estoy en casilla 14					
					
					case orientacion is
					
						when "01" => posicion <= "0110";				--me movi al este y fui a la casilla 6
						
						when "10" => posicion <= "1010";				--me movi al oeste y fui a la casilla 10
																	
						when "11" => posicion <= "1111";				--me movi al sur y fui a la casilla 15
										
						when others => posicion <= "0000";

					end case;
					
				when "1111" =>												--estoy en casilla 15					
					
					case orientacion is
					
						when "01" => posicion <= "0111";				--gme movi al este y fui a la casilla 7
						
						when "10" => posicion <= "1011";				--me movi al oeste y fui a la casilla 11
																	
						when "00" => posicion <= "1110";				--me movi al norte y fui a la casilla 14

						when "11" => posicion <= "1101";				--me movi al sur y fui a la casilla 13						
						
						when others => posicion <= "0000";

					end case;

			end case;
	
		end if;
	
		posicion_out 	 <= posicion;
		orientacion_out <= orientacion;
		E_delay_out 	 <= E_delay;
	
	end process;

end behave;