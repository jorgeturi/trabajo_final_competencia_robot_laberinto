
LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY MapeoYDireccion2 IS 
	port(
			clk :  IN  STD_LOGIC;
			reset :  IN  STD_LOGIC;
			W		:  IN  STD_LOGIC_VECTOR (23 downto 0);
			Error :  OUT  STD_LOGIC;
			
			ubicacion_actual : in std_logic_vector(3 downto 0);
			direccion_siguiente: out std_logic_vector(1 downto 0)
			
			
	);

end MapeoYDireccion2;


architecture behave of MapeoYDireccion2 is


	component testBlock
		PORT
		(
			clk :  IN  STD_LOGIC;
			reset :  IN  STD_LOGIC;
			w3 :  IN  STD_LOGIC;
			w10 :  IN  STD_LOGIC;
			w7 :  IN  STD_LOGIC;
			w0 :  IN  STD_LOGIC;
			w17 :  IN  STD_LOGIC;
			w21 :  IN  STD_LOGIC;
			w1 :  IN  STD_LOGIC;
			w4 :  IN  STD_LOGIC;
			w14 :  IN  STD_LOGIC;
			w11 :  IN  STD_LOGIC;
			w8 :  IN  STD_LOGIC;
			w22 :  IN  STD_LOGIC;
			w18 :  IN  STD_LOGIC;
			w15 :  IN  STD_LOGIC;
			w6 :  IN  STD_LOGIC;
			w2 :  IN  STD_LOGIC;
			w13 :  IN  STD_LOGIC;
			w9 :  IN  STD_LOGIC;
			w20 :  IN  STD_LOGIC;
			w16 :  IN  STD_LOGIC;
			w5 :  IN  STD_LOGIC;
			w12 :  IN  STD_LOGIC;
			w23 :  IN  STD_LOGIC;
			w19 :  IN  STD_LOGIC;
			Error :  OUT  STD_LOGIC;
			REG0_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG0_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG1_N		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG1_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG1_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG2_N		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG2_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG3_N		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG3_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG3_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG4_O		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG4_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG4_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG5_N		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG5_O		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG5_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG5_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG6_O		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG6_N		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG6_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG7_N		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG7_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG7_O		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG7_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG8_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG8_O		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG9_N		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG9_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG9_O		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG11_N		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG11_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG11_O		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG12_O		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG12_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG12_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG13_O		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG13_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG13_N		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG13_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG14_O		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG14_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG14_N		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG15_O		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG15_E		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG15_N		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
			REG15_S		:	 OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END component;


signal REG0_N : std_logic_vector(3 downto 0);
signal REG0_O : std_logic_vector(3 downto 0);
signal REG1_S : std_logic_vector(3 downto 0);
signal REG1_O : std_logic_vector(3 downto 0);
signal REG1_N : std_logic_vector(3 downto 0);
signal REG2_S : std_logic_vector(3 downto 0);
signal REG2_O : std_logic_vector(3 downto 0);
signal REG3_S : std_logic_vector(3 downto 0);
signal REG3_O : std_logic_vector(3 downto 0);
signal REG3_N : std_logic_vector(3 downto 0);
signal REG4_N : std_logic_vector(3 downto 0);
signal REG4_O : std_logic_vector(3 downto 0);
signal REG4_E : std_logic_vector(3 downto 0);
signal REG5_S : std_logic_vector(3 downto 0);
signal REG5_N : std_logic_vector(3 downto 0);
signal REG5_O : std_logic_vector(3 downto 0);
signal REG5_E : std_logic_vector(3 downto 0);
signal REG6_S : std_logic_vector(3 downto 0);
signal REG6_E : std_logic_vector(3 downto 0);
signal REG6_O : std_logic_vector(3 downto 0);
signal REG7_S : std_logic_vector(3 downto 0);
signal REG7_N : std_logic_vector(3 downto 0);
signal REG7_E : std_logic_vector(3 downto 0);
signal REG7_O : std_logic_vector(3 downto 0);
signal REG8_E : std_logic_vector(3 downto 0);
signal REG8_N : std_logic_vector(3 downto 0);
signal REG9_E : std_logic_vector(3 downto 0);
signal REG9_N : std_logic_vector(3 downto 0);
signal REG9_S : std_logic_vector(3 downto 0);
signal REG10_S : std_logic_vector(3 downto 0);
signal REG10_E : std_logic_vector(3 downto 0);
signal REG11_S : std_logic_vector(3 downto 0);
signal REG11_E : std_logic_vector(3 downto 0);
signal REG11_N : std_logic_vector(3 downto 0);
signal REG12_N : std_logic_vector(3 downto 0);
signal REG12_E : std_logic_vector(3 downto 0);
signal REG12_O : std_logic_vector(3 downto 0);
signal REG13_N : std_logic_vector(3 downto 0);
signal REG13_E : std_logic_vector(3 downto 0);
signal REG13_O : std_logic_vector(3 downto 0);
signal REG13_S : std_logic_vector(3 downto 0);
signal REG14_S : std_logic_vector(3 downto 0);
signal REG14_O : std_logic_vector(3 downto 0);
signal REG14_E : std_logic_vector(3 downto 0);
signal REG15_O : std_logic_vector(3 downto 0);
signal REG15_E : std_logic_vector(3 downto 0);
signal REG15_N : std_logic_vector(3 downto 0);
signal REG15_S : std_logic_vector(3 downto 0);

signal dir0: std_logic_vector(1 downto 0);
signal dir1: std_logic_vector(1 downto 0);
signal dir2: std_logic_vector(1 downto 0);
signal dir3: std_logic_vector(1 downto 0);
signal dir4: std_logic_vector(1 downto 0);
signal dir5: std_logic_vector(1 downto 0);
signal dir6: std_logic_vector(1 downto 0);
signal dir7: std_logic_vector(1 downto 0);
signal dir8: std_logic_vector(1 downto 0);
signal dir9: std_logic_vector(1 downto 0);
signal dir11: std_logic_vector(1 downto 0);
signal dir12: std_logic_vector(1 downto 0);
signal dir13: std_logic_vector(1 downto 0);
signal dir14: std_logic_vector(1 downto 0);
signal dir15: std_logic_vector(1 downto 0);




begin


	inst_testBlock: component testBlock

	port map(
			clk => clk,
			reset => reset,
			w3 => w(3),
			w10 => w(10),
			w7 => w(7),
			w0 => w(0),
			w17 => w(17),
			w21 => w(21),
			w1 => w(1),
			w4 => w(4),
			w14 => w(14),
			w11 => w(11),
			w8 => w(8),
			w22 => w(22),
			w18 => w(18),
			w15 => w(15),
			w6 => w(6),
			w2 => w(2),
			w13 => w(13),
			w9 => w(9),
			w20 => w(20),
			w16 => w(16),
			w5 => w(5),
			w12 => w(12),
			w23 => w(23),
			w19 => w(19),
			Error => Error,
		
		REG0_S => REG0_N,
		REG0_E => REG0_O,
		REG1_N => REG1_S,
		REG1_S => REG1_N,
		REG1_E => REG1_O,
		REG2_E => REG2_O,
		REG2_N => REG2_S,
		REG3_E => REG3_O,
		REG3_N => REG3_S,
		REG3_S => REG3_N,
		REG4_E => REG4_O,
		REG4_O => REG4_E,
		REG4_S => REG4_N,
		REG5_E => REG5_O,
		REG5_N => REG5_S,
		REG5_O => REG5_E,
		REG5_S => REG5_N,
		REG6_E => REG6_O,
		REG6_N => REG6_S,
		REG6_O => REG6_E,
		REG7_E => REG7_O,
		REG7_N => REG7_S,
		REG7_O => REG7_E,
		REG7_S => REG7_N,
		REG8_O => REG8_E,
		REG8_S => REG8_N,
		REG9_N => REG9_S,
		REG9_O => REG9_E,
		REG9_S => REG9_N,
		REG11_N => REG11_S,
		REG11_O => REG11_E,
		REG11_S => REG11_N,
		REG12_E => REG12_O,
		REG12_O => REG12_E,
		REG12_S => REG12_N,
		REG13_E => REG13_O,
		REG13_N => REG13_S,
		REG13_O => REG13_E,
		REG13_S => REG13_N,
		REG14_E => REG14_O,
		REG14_N => REG14_S,
		REG14_O => REG14_E,
		REG15_O => REG15_E,
		REG15_E => REG15_O,
		REG15_N => REG15_S,
		REG15_S => REG15_N



	);

		
	process (ubicacion_actual)
	begin
	
		-- compara los alrededores de la ubicacion actual
		-- entrega SIGUIENTE DIRECCION
		

		
		-- compara entre 2
		
		-- registro 0	

				if (REG0_N < REG0_O) then
						dir0 <= "00";
					else
						dir0 <= "10";
				end if;
				
				
		-- registro 2		

				if (REG2_O < REG2_S) then
						dir2 <= "10";
					else
						dir2 <= "11";
				end if;
				
		-- registro 8
		
				if (REG8_N < REG8_E) then
						dir8 <= "00";
					else
						dir8 <= "01";
				end if;
				
		
		-- compara entre 3
		
		-- registro 3
				
				IF (REG3_N < REG3_O)  then
						if (REG3_N < REG3_S) then
							dir3 <= "00";
						else
							dir3 <= "11";
						end if;
						
					else 
						if (REG3_O < REG3_S) then
							dir3 <= "10";
						else
							dir3 <= "11";
						end if;
						
				end if;
			
			
		-- registro 1
		
				IF (REG1_N < REG1_O)  then
						if (REG1_N < REG1_S) then
							dir1 <= "00";
						else
							dir1 <= "11";
						end if;
						
					else 
						if (REG1_O < REG1_S) then
							dir1 <= "10";
						else
							dir1 <= "11";
						end if;
				end if;
				
			
			-- registro 4
		
				IF (REG4_N < REG4_O)  then
					if (REG3_N < REG4_E) then
						dir4 <= "00";
					else
						dir4 <= "01";
					end if;
					
				else 
					if (REG4_O < REG4_E) then
						dir4 <= "10";
					else
						dir4 <= "01";
					end if;
				end if;
			
			-- registro 12
	
				IF (REG12_N < REG12_O)  then
						if (REG12_N < REG12_E) then
							dir12 <= "00";
						else
							dir12 <= "01";
						end if;
						
					else 
						if (REG12_O < REG12_E) then
							dir12 <= "10";
						else
							dir12 <= "01";
						end if;
				end if;
				
			
			-- registro 6
	
				IF (REG6_S < REG6_O)  then
					if (REG6_S < REG6_E) then
						dir6 <= "11";
					else
						dir6 <= "01";
					end if;
					
				else 
					if (REG6_O < REG6_E) then
						dir6 <= "10";
					else
						dir6 <= "01";
					end if;
				end if;
				
				
			-- registro 14
	
				IF (REG14_S < REG14_O)  then
					if (REG14_S < REG14_E) then
						dir14 <= "11";
					else
						dir14 <= "01";
					end if;
					
				else 
					if (REG14_O < REG14_E) then
						dir14 <= "10";
					else
						dir14 <= "01";
					end if;
				end if;	
				
				
				
			-- registro 9
		
				IF (REG9_S < REG9_E)  then
					if (REG9_S < REG9_N) then
						dir9 <= "11";
					else
						dir9 <= "00";
					end if;
					
				else 
					if (REG9_E < REG9_N) then
						dir9 <= "01";
					else
						dir9 <= "00";
					end if;
				end if;
				

			-- registro 11
		
				IF (REG11_S < REG11_E)  then
					if (REG11_S < REG11_N) then
						dir11 <= "11";
					else
						dir11 <= "00";
					end if;
					
				else 
					if (REG11_E < REG11_N) then
						dir11 <= "01";
					else
						dir11 <= "00";
					end if;
				end if;

				
			-- registro 5
	
				IF (REG5_N < REG5_E and REG5_N < REG5_S AND REG5_N < REG5_O) then
						dir5 <= "00";
				
					ELSIF (REG5_E < REG5_N and REG5_E < REG5_S AND REG5_E < REG5_O) then
						dir5 <= "01";
					
					ELSIF (REG5_S < REG5_E and REG5_S < REG5_N AND REG5_S < REG5_O) then
						dir5 <= "11";
					
					else
						dir5 <= "10";		
					
				END IF;	
				
			
			-- registro 7
	
				IF (REG7_N < REG7_E and REG7_N < REG7_S AND REG7_N < REG7_O) then
					dir7 <= "00";
				
					ELSIF (REG7_E < REG7_N and REG7_E < REG7_S AND REG7_E < REG7_O) then
						dir7 <= "01";
					
					ELSIF (REG7_S < REG7_E and REG7_S < REG7_N AND REG7_S < REG7_O) then
						dir7 <= "11";
					
					else
						dir7 <= "10";		
						
				END IF;	
				
			-- registro 13

				IF (REG13_N < REG13_E and REG13_N < REG13_S AND REG13_N < REG13_O) then
						dir13 <= "00";
					
					ELSIF (REG13_E < REG13_N and REG13_E < REG13_S AND REG13_E < REG13_O) then
						dir13 <= "01";
					
					ELSIF (REG13_S < REG13_E and REG13_S < REG13_N AND REG13_S < REG13_O) then
						dir13 <= "11";
					
					else
						dir13 <= "10";		
						
				END IF;	
				
				
			-- registro 15
			
				IF (REG15_N < REG15_E and REG15_N < REG15_S AND REG15_N < REG15_O) then
						dir15 <= "00";
					
					ELSIF (REG15_E < REG15_N and REG15_E < REG15_S AND REG15_E < REG15_O) then
						dir15 <= "01";
					
					ELSIF (REG15_S < REG15_E and REG15_S < REG15_N AND REG15_S < REG15_O) then
						dir15 <= "11";
					
					else
						dir15 <= "10";		
						
				END IF;	
				
		case ubicacion_actual is
			when "0000" =>
				direccion_siguiente <= dir0;
			when "0001" =>
				direccion_siguiente <= dir1;
			when "0010" =>
				direccion_siguiente <= dir2;
			when "0011" =>
				direccion_siguiente <= dir3;
			when "0100" =>
				direccion_siguiente <= dir4;
			when "0101" =>
				direccion_siguiente <= dir5;
			when "0110" =>
				direccion_siguiente <= dir6;
			when "0111" =>
				direccion_siguiente <= dir7;
			when "1000" =>
				direccion_siguiente <= dir8;
			when "1001" =>
				direccion_siguiente <= dir9;
			when "1011" =>
				direccion_siguiente <= dir11;
			when "1100" =>
				direccion_siguiente <= dir12;
			when "1101" =>
				direccion_siguiente <= dir13;
			when "1110" =>
				direccion_siguiente <= dir14;
			when "1111" =>
				direccion_siguiente <= dir15;
			when others =>
				null;
		
		end case;
			

			
	end process;
			
			
			
	end behave;


