library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

--Código para el bloque de acción. Responde a entrada x proveniente de control. Ejecuta cada acción 
--correspondiente por un tiempo dado. Falta agregar un segundo timer, ya que girar y avanzar no toman 
--el mismo tiempo. Ademas habría que incluir la entrada del sensor de linea, para confirmar el avance.


entity accion is

	port (clk 		: in std_logic;
			reset 	: in std_logic;
			x			: in std_logic_vector (1 downto 0);			  --señal de control
			E 			: out std_logic;									  --señal de enable (vuelve a control)
	
			M0D 		: out std_logic;
			M1D 		: out std_logic;
			M0I 		: out std_logic;
			M1I 		: out std_logic;
			Hab_D		: out std_logic;
			Hab_I		: out std_logic;
	
			ADC_SCLK : out std_logic;                            --salidas del bloque para ADC 
			ADC_CS_N : out std_logic;                                                
			ADC_DIN  : out std_logic;                            
			ADC_DOUT : in std_logic);
	
end accion;

architecture behave of accion is

	component avance is 
	
		port (clk 		: in std_logic;
				reset 	: in std_logic;
				ADC_DOUT : in std_logic;
				
				M0D_avance 		: out std_logic;						  --las 4 salidas a los motores son distintas 
				M1D_avance 		: out std_logic;						  --a las salidas globales ya que se eligen o no
				M0I_avance 		: out std_logic;
				M1I_avance 		: out std_logic;
				Hab_D				: out std_logic;
				Hab_I				: out std_logic;
			
				ADC_SCLK : out std_logic;                        --salidas del bloque para ADC 
				ADC_CS_N : out std_logic;                                                
				ADC_DIN  : out std_logic);
	
	end component avance;
	
	--component linea is 
	
		--port ();
	
	--end component linea;
	
	constant countA_limit    : integer 	:= 35000000; 			 -- cuenta maxima del timer para avanzar luego de cruzar linea
   signal 	countA        	 : integer 	:= 0;      				 -- conteo del timer para avanzar
   signal 	timerA_status   : std_logic := '0'; 				 -- estado del timer para avanzar
	
	constant countG_limit    : integer 	:= 50; 			 		 -- cuenta maxima del timer para girar
   signal 	countG       	 : integer 	:= 0;      				 -- conteo del timer para girar
   signal 	timerG_status   : std_logic := '0'; 				 -- estado del timer para girar
	
	signal M0D_avance : std_logic;									 --para conectar el bloque avance al resto
	signal M1D_avance : std_logic;
	signal M0I_avance : std_logic;
	signal M1I_avance : std_logiC;
	
	
	--aca iran las señales para conectar 'linea' 
	--signal SL : std_logiC;
	
	
	
	
	
	
	
	-- 	designacion de acciones posibles x:
	
	-- 	00 avanzar
	-- 	01 girar a la derecha
	-- 	10 girar a la izquierda
	-- 	11 quieto => llegada
	
	
	
	
begin

	inst_avance: component avance													--instancia el componente avance
	
	port map (clk 			=> clk,
				 reset 		=> reset,
				 ADC_DOUT 	=> ADC_DOUT,
				 
				 M0D_avance => M0D_avance,
				 M1D_avance => M1D_avance,
				 M0I_avance => M0I_avance,
				 M1I_avance => M1I_avance,
				 Hab_D 		=> Hab_D,
				 Hab_I 		=> Hab_I,
				 
				 ADC_SCLK 	=> ADC_SCLK,
				 ADC_CS_N 	=> ADC_CS_N,
				 ADC_DIN 	=> ADC_DIN);				
	
	process (clk, reset)
	
	begin
		
		if reset = '1' then													--quieto
		
			M0D 			 <= '1';
			M1D 			 <= '0'; 
			M0I 			 <= '1'; 
			M1I 			 <= '0'; 
			E   			 <= '0';
			
			countA 		  <= 0;
         timerA_status <= '0';
			countG 		  <= 0;
         timerG_status <= '0';
			
		elsif rising_edge(clk) then
		 
			if timerA_status = '1' then									--el timer de avance esta activo
                
				if countA = countA_limit then								--el timer de avance terminó
                 
					E 				  <= '1'; 
					timerA_status <= '0';
					countA 		  <= 0;
					
				else
                    
					countA <= countA + 1;
					
				end if;
				
			elsif timerG_status = '1' then								--el timer de giro esta activo
				
				if countG = countG_limit then								--el timer de giro terminó
                 
					E 				  <= '1'; 
					timerG_status <= '0';
					countG 		  <= 0;
					
				else
                    
					countG <= countG + 1;
					
				end if;
				
			else											--no hay ningun timer activo
			
				case x is
			  
					when "11" => 						--quieto (solo ocurre al llegar)
					
						M0D <= '0';
						M1D <= '0'; 
						M0I <= '0'; 
						M1I <= '0'; 
						E 	 <= '0';		
						 
					when "01" =>						--girar a la derecha
						 
						M0D <= '0';
						M1D <= '1'; 
						M0I <= '1'; 
						M1I <= '0';
						
						E 				  <= '0';			--inicia el timer de giro
                  timerG_status <= '1';			

					when "10" =>						--girar a la izquierda
						 
						M0D <= '1';
						M1D <= '0'; 
						M0I <= '0'; 
						M1I <= '1';
						
						E 				  <= '0';			--inicia el timer de giro
                  timerG_status <= '1';
						 
					when "00" =>						--avanzar
						 
						M0D <= M0D_avance;
						M1D <= M1D_avance; 
						M0I <= M0I_avance; 
						M1I <= M1I_avance;
						
						E 				  <= '0';			--inicia el timer de avance 
                  timerA_status <= '1';
					
				end case;
			
			end if;
			
		end if;
		 
	end process;
				
end behave;




