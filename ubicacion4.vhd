LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ubicacion4 is

	port (SD  : in std_logic;																-- sensores
			SI	 : in std_logic;
			SF  : in std_logic;
			SL  : in std_logic;
			clk : in std_logic;

			
			E 		 : in std_logic;															-- señal de enable proveniente de 'accion'
			x 		 : in std_logic_vector (1 downto 0);								-- entrada de orden 
			reset  : in std_logic;
			
			posicion_out    : out std_logic_vector (3 downto 0);					--
			orientacion_out : out std_logic_vector (1 downto 0);					-- salidas hacia bloque de desicion
			E_delay_out     : out std_logic;												-- a fines de simular nada mas
			
			W 			 		 : out std_logic_vector (23 downto 0));				-- ubicacion de las paredes --> hacia bloque 'mapa'
	

end ubicacion4;

architecture behave of ubicacion4 is

		signal posicion 	 : std_logic_vector (3 downto 0) := "0000";			-- inicia en la casilla 0
		signal orientacion : std_logic_vector (1 downto 0) := "00";				-- mirando al norte
		signal E_delay     : std_logic 							:= '1';				-- señal demorada para el proceso de actualizar posicion
		
		constant count_limit    : integer 	 := 3; 			 		 				-- cuenta maxima del timer para el delay
		signal 	count        	: integer 	 := 0;      				 			-- conteo del timer para el delay
		signal 	timer_status   : std_logic  := '0'; 					 			-- estado del timer para el delay
		
		signal E_anterior       : std_logic := '0'; 									-- Para registrar flanco de E
		signal E_flanco 			: std_logic := '0'; 									-- Flanco de E
		

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
	
	
------------------------------------------------------------------------------------------------------------------------
	
	
	process(clk, reset)
	
	begin
		
		if reset = '1' then
			  
			timer_status  <= '0';
			count	 		 <= 0;
			E_delay 		 <= '1';
			E_anterior 	 <= '0';
			E_flanco 		 <= '0';
			  
		elsif rising_edge(clk) then
		 
			E_flanco 		<= E and not E_anterior; 					--detecta flanco de E
			E_anterior 		<= E;

			If E_flanco = '1' then 
			
				timer_status <= '1';	
				
				case orientacion is											--orientacion actual respecto a orientacion anterior y movimiento realizado
		
					when "00" => 												--estaba apuntando al norte y...
				
						case x is
						
							when "00" => orientacion <= "00";			--avancé, sigo apuntando al norte 
							
							when "01" => orientacion <= "01";			--gire a la derecha, ahora apunto al este
																		
							when "10" => orientacion <= "10";			--gire a la izquierda, ahora apunto al oeste
							
							when "11" => orientacion <= "00";
							
						end case;
								
					when "01" => 												--estaba apuntando al este y...
				
						case x is
						
							when "00" => orientacion <= "01";			--avancé, sigo apuntando al este 
							
							when "01" => orientacion <= "11";			--gire a la derecha, ahora apunto al sur
																		
							when "10" => orientacion <= "00";			--gire a la izquierda, ahora apunto al norte
							
							when "11" => orientacion <= "00";
							
						end case;
				
					when "10" => 												--estaba apuntando al oeste y...
				
						case x is
						
							when "00" => orientacion <= "10";			--avancé, sigo apuntando al oeste 
							
							when "01" => orientacion <= "00";			--gire a la derecha, ahora apunto al norte
																		
							when "10" => orientacion <= "11";			--gire a la izquierda, ahora apunto al sur
							
							when "11" => orientacion <= "00";
							
						end case;
				
					when "11" => 												--estaba apuntando al sur y...
				
						case x is
						
							when "00" => orientacion <= "11";			--avancé, sigo apuntando al sur 
							
							when "01" => orientacion <= "10";			--gire a la derecha, ahora apunto al oeste
																		
							when "10" => orientacion <= "01";			--gire a la izquierda, ahora apunto al este
							
							when "11" => orientacion <= "00";
							
						end case;
			
				end case;
					
			end if;

			if timer_status = '1' then									--para originar la seañal E_delay
			  
				if count = count_limit then
	
					timer_status <= '0';
					count <= 0;
					E_delay <= '1';
						
				else
						
					count <= count + 1;
					E_delay <= '0';
						
				end if;
					
			else
			  
				E_delay <= '1';
			   
			end if;
		
		end if;
		
		E_delay_out	<= E_delay;											--a fin de simular
		
	end process;

	
--------------------------------------------------------------------------------------------------------------------------
		
	
	process (SL)															--proceso para actualizar posicion al cruzar linea

	begin
	
		if rising_edge (SL) then										--entro solo si cruzo linea
			
			case posicion is												--posicion actual respecto posicion anterior 
			
				when "0000" =>												--estoy en casilla 0
			
					case orientacion is
				
						when "10" => posicion <= "0100";				--me movi al oeste y fui a la casilla 4
																	
						when "00" => posicion <= "0001";				--me movi al norte y fui a la casilla 1
				
						when others => posicion <= "0000";

					end case;					
			
				when "0001" =>												--estoy en casilla 1
			
					case orientacion is
						
						when "10" => posicion <= "0101";				--me movi al oeste y fui a la casilla 5
																	
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

					end case;

			end case;
	
		end if;
	
		posicion_out 	 <= posicion;
		orientacion_out <= orientacion;
	
	end process;
	
	
-----------------------------------------------------------------------------------------------------------	

	
	process (E_delay)														--proceso para registrar paredes

	begin
	
		if rising_edge (E_delay) then

			case posicion is												--posicion actual respecto posicion anterior 
			
				when "0000" =>												--estoy en casilla 0
			
					case orientacion is
				
						when "00" => W(3) <= SF;							

						when "10" => W(0) <= SF;	
						
						when others => null;						
					
					end case;					
			
				when "0001" =>												--estoy en casilla 1
			
					case orientacion is			
						
						when "00" => W(10) <= SF;				
						
						when "11" => W(3) <= SF;	
						
						when "01" => null;				

						when "10" => W(7) <= SF;												
						
					end case;
			
				when "0010" =>												--estoy en casilla 2
			
					case orientacion is
					
						when "11" => W(17) <= SF;	
						
						when "10" => W(21) <= SF;	
						
						when others => null;												
						
					end case;

				when "0011" =>												--estoy en casilla 3
			
					case orientacion is
					
						when "00" => W(17) <= SF;				
						
						when "11" => W(10) <= SF;	
						
						when "01" => null;				

						when "10" => W(14) <= SF;
						
					end case;	
						
				when "0100" =>												--estoy en casilla 4					
					
					case orientacion is
					
						when "00" => W(4) <= SF;				
						
						when "11" => null;	
						
						when "01" => W(0) <= SF;				

						when "10" => W(1) <= SF;

					end case;		
			
				when "0101" =>												--estoy en casilla 5					
					
					case orientacion is
					
						when "00" => W(11) <= SF;				
						
						when "11" => W(4) <= SF;	
						
						when "01" => W(7) <= SF;				

						when "10" => W(8) <= SF;				
						
					end case;
					
				when "0110" =>												--estoy en casilla 6					
					
					case orientacion is
					
						when "00" => null;				
						
						when "11" => W(18) <= SF;	
						
						when "01" => W(21) <= SF;				

						when "10" => W(22) <= SF;

					end case;
					
				when "0111" =>												--estoy en casilla 7					
					
					case orientacion is
					
						when "00" => W(18) <= SF;				
						
						when "11" => W(11) <= SF;	
						
						when "01" => W(14) <= SF;				

						when "10" => W(15) <= SF;					
						
					end case;
					
				when "1000" =>												--estoy en casilla 8					
					
					case orientacion is
					
						when "00" => W(6) <= SF;				
						
						when "11" => null;	
						
						when "01" => W(2) <= SF;				

						when "10" => null;
					
					end case;
	
				when "1001" =>												--estoy en casilla 9					
					
					case orientacion is
					
						when "00" => W(13) <= SF;				
						
						when "11" => W(6) <= SF;	
						
						when "01" => W(9) <= SF;				

						when "10" => null;

					end case;
	
				when "1010" =>												--estoy en casilla 10					
					
					case orientacion is
					
						when "00" => null;				
						
						when "11" => W(20) <= SF;	
						
						when "01" => W(23) <= SF;				

						when "10" => null;

					end case;	
					
				when "1011" =>												--estoy en casilla 11					
					
					case orientacion is
					
						when "00" => W(20) <= SF;				
						
						when "11" => W(13) <= SF;	
						
						when "01" => W(16) <= SF;				

						when "10" => null;

					end case;	
					
				when "1100" =>												--estoy en casilla 12					
					
					case orientacion is
					
						when "00" => W(5) <= SF;				
						
						when "11" => null;	
						
						when "01" => W(1) <= SF;				

						when "10" => W(2) <= SF;

					end case;	
					
				when "1101" =>												--estoy en casilla 13					
					
					case orientacion is
					
						when "00" => W(12) <= SF;				
						
						when "11" => W(5) <= SF;	
						
						when "01" => W(8) <= SF;				

						when "10" => W(9) <= SF;						
						
					end case;
					
				when "1110" =>												--estoy en casilla 14					
					
					case orientacion is
					
						when "00" => null;				
						
						when "11" => W(19) <= SF;	
						
						when "01" => W(22) <= SF;				

						when "10" => W(23) <= SF;

					end case;
					
				when "1111" =>												--estoy en casilla 15					
					
					case orientacion is

						when "00" => W(19) <= SF;				
						
						when "11" => W(12) <= SF;	
						
						when "01" => W(15) <= SF;				

						when "10" => W(16) <= SF;
						
					end case;

			end case;

		end if;

	end process;

end behave;