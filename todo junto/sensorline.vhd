library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sensorline is
    Port(
        CLK     : in STD_LOGIC;                  -- Señal de reloj principal
        RESET   : in STD_LOGIC;                  -- Señal de reset
        SENSOR  : in STD_LOGIC;                  -- Sensor que detecta la línea
		  PULSO	 : out STD_LOGIC						 -- Pulso de salida
  --        LEDS    : out STD_LOGIC_VECTOR(4 downto 0);  -- Salida para el contador
  --		  LEDS_STATE    : out STD_LOGIC_VECTOR(1 downto 0);  -- led estados
    );
end sensorline;

architecture Behavioral of sensorline is
	 constant MAX_VAL   	 : integer := 200;
	 signal cuenta1		 : integer range 0 to 49999;
	 signal cuenta2		 : integer range 0 to 49999;
	 -- Build an enumerated type for the state machine
	 type state_type is (s0, s1, s2, s3);
	 -- Etiqueta de state_type
	 signal state   : state_type;
--  signal cnt_lineas    : integer range 0 to 31;  -- Contador de líneas 
	 signal sal				 : STD_LOGIC_VECTOR(1 downto 0);
	 
begin
	-- Logic to advance to the next state
	process (CLK, RESET)
	begin
		if RESET = '0' then
			state <= s0;
--			cnt_lineas <= 0;
			cuenta1 <= 0;
			cuenta2 <= 0;
			PULSO <= '0';
		elsif (rising_edge(CLK)) then
			case state is 
				when s0=> --Estado de retencion
					if SENSOR = '1' then
						state <= s0;
					else
						state <= s1;
					end if;
					
				when s1=> --Estado de retencion para captar una linea negra
					if cuenta1 < MAX_VAL then
						cuenta1 <= cuenta1 + 1;
					else
						cuenta1 <= 0;
						if SENSOR = '1' then
							state <= s0;
						else
--							cnt_lineas <= cnt_lineas+1;
							state <= s2;
							PULSO <= '1';
						end if;
					end if;
				when s2=>
					if SENSOR = '1' then
						state <= s3;
					else
						state <=	s2;
					end if;
			
				when s3=>
					if cuenta2 < MAX_VAL then
						cuenta2 <= cuenta2 + 1;
					else
						cuenta2 <= 0;
						if SENSOR = '1' then
							PULSO <= '0';
							state <= s0;
						else
							state <= s2;
						end if;
					end if;
			end case;
			
		end if;
		
	end process;

		
	
	-- Output depends solely on the current state
	process (state)
	begin
		case state is
			when s0 =>
				sal <= "00";
			when s1 =>
				sal <= "01";
			when s2 =>
				sal <= "10";
			when s3 =>
				sal <= "11";
		end case;
	end process;
	
	
--Asignar el valor final del contador a la salida LEDS
--    LEDS <= STD_LOGIC_VECTOR(to_unsigned(cnt_lineas,5));
--	 LEDS_STATE<=sal;
	 
end Behavioral;
