library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Movimiento is
    Port ( 
        clk       : in  STD_LOGIC;           -- Reloj de entrada (por ejemplo, 50 MHz)
        reset     : in  STD_LOGIC;           -- Señal de reset (para inicializar el contador)
        mI0       : out STD_LOGIC;
        mI1       : out STD_LOGIC;
        mD0       : out STD_LOGIC;
        mD1       : out STD_LOGIC;
        vmI       : out STD_LOGIC;
        vmD       : out STD_LOGIC;
        led       : out STD_LOGIC          -- Señal para controlar el LED
    );
end Movimiento;

architecture Behavioral of Movimiento is

    signal      pwm_counter : integer range 0 to 2499 := 0;  -- Contador para 1 kHz con reloj de 50 MHz
    constant pwm_duty_cycle : integer := 1000; --40%
    signal     mode_counter : integer range 0 to 5;  -- Contador para cambiar el modo 
    signal             clk2 : STD_LOGIC;
    signal 	      count : integer range 0 to 49999999;
    signal             modo : STD_LOGIC_VECTOR(2 downto 0);

begin
    	 -- Generación de señales PWM para vmI y vmD
	 process(clk,reset)
	 begin

		if reset = '0' then
			count <= 0;
			clk2 <= 0;
		elsif rising_edge(clk) then

			if count = 49999999 then
				clk2 <= not (clk2);
				count <= 0;
			else
            		count <= count + 1;  -- Incrementar el contador solo si no se ha llegado al máximo
        		end if;
		end if;

	 end process;
	 
	 


    process(clk, reset)
    begin
        if reset = '0' then
            pwm_counter <= 0;  -- Resetea el contador cuando se activa el reset
        elsif rising_edge(clk) then

            -- Incrementa el contador de PWM en cada flanco de reloj
            if pwm_counter = 2499 then
                pwm_counter <= 0;  -- Resetea el contador
            else
                pwm_counter <= pwm_counter + 1;  -- Incrementa el contador
            end if;

            -- Generación de la señal PWM
            if pwm_counter < pwm_duty_cycle then
                vmI <= '1';  -- Señal encendida
		vmD <= '1';
            else
                vmI <= '0';  -- Señal apagada
		vmD <= '0';
            end if;

        end if;
    end process;




    -- Generación de las señales de control del motor basadas en el modo
    process(clk2, reset)
    begin
        if reset = '0' then
            -- Asignación por defecto en caso de reset
            mI0 <= '0';
            mI1 <= '0';
            mD0 <= '0';
            mD1 <= '0';
            modo <= "000";  -- Modo por defecto (Parar)
            led <= '1';  -- Enciende el LED cuando se activa el reset
	    mode_counter <= 0;

        elsif rising_edge(clk2) then
            case mode_counter is
                when 0 =>  -- "000" - Parar
                    modo <= "000";
                when 1 =>  -- "001" - Avanzar
                    modo <= "001";
                when 2 =>  -- "010" - Girar a la derecha
                    modo <= "010";
                when 3 =>  -- "011" - Girar a la izquierda
                    modo <= "011";
                when 4 =>  -- "111" - Retroceder
                    modo <= "111";
                when others =>  -- Reiniciar el contador de modo
                    mode_counter <= 0;
            end case;
            
            -- Incrementar el contador de modo cada ciclo
            if mode_counter = 4 then
                mode_counter <= 0;  -- Reinicia el contador después de 5 modos
            else
                mode_counter <= mode_counter + 1;  -- Incrementa el contador de modo
            end if;

            -- Asignar las señales de control de acuerdo al valor de 'modo'
            case modo is
                when "000" =>  -- Parar
                    mI0 <= '0';
                    mI1 <= '0';
                    mD0 <= '0';
                    mD1 <= '0';
		    led <= '0';

                    
                when "001" =>  -- Avanzar
                    mI0 <= '0';
                    mI1 <= '1';
                    mD0 <= '0';
                    mD1 <= '1';
		    led <= '1';

                    
                when "010" =>  -- Girar a la derecha
                    mI0 <= '0';
                    mI1 <= '1';
                    mD0 <= '1';
                    mD1 <= '0';
		    led <= '0';
                    
                when "011" =>  -- Girar a la izquierda
                    mI0 <= '1';
                    mI1 <= '0';
                    mD0 <= '0';
                    mD1 <= '1';
	            led <= '1';
                    
                when "111" =>  -- Retroceder
                    mI0 <= '1';
                    mI1 <= '0';
                    mD0 <= '1';
                    mD1 <= '0';
		    led <= '0';
                    
                when others =>  -- Caso por defecto
                    mI0 <= '0';
                    mI1 <= '0';
                    mD0 <= '0';
                    mD1 <= '0';
            end case;

        end if;
    end process;

end Behavioral;

