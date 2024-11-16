library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sensorline is
    Port(
        CLK     : in STD_LOGIC;        -- Señal de reloj principal
        RESET   : in STD_LOGIC;        -- Señal de reset
        SENSOR  : in STD_LOGIC;        -- Sensor que detecta la línea
        LEDS    : out STD_LOGIC_VECTOR(7 downto 0)  -- Salida para el contador
    );
end sensorline;

architecture Behavioral of sensorline is
    signal prev_sensor   : STD_LOGIC := '1';  -- Guardar valor previo de SENSOR
    signal clk_divider   : STD_LOGIC_VECTOR(23 downto 0) := (others => '0');  -- Contador de 24 bits
    signal CLK2          : STD_LOGIC := '0';  -- Señal de reloj 2 (frecuencia dividida)
    signal counter       : UNSIGNED(7 downto 0) := (others => '0');  -- Contador de líneas
    signal line_detected : BOOLEAN := FALSE;  -- Bandera para verificar si la línea sigue presente

--proceso para dividir la frecuencia del reloj
  process(CLK, RESET)
begin
    if RESET = '0' then
        clk_divider <= (others => '0');  -- Inicializar el contador a cero
        CLK2 <= '0';  -- Inicializar CLK2 a 0
    elsif rising_edge(CLK) then
        if unsigned(clk_divider) = (others => '1') then
            clk_divider <= (others => '0');  -- Reiniciar el contador a 0
            CLK2 <= not CLK2;  -- Toggle de CLK2 cuando llega al valor máximo (2^24 - 1)
        else
            clk_divider <= std_logic_vector(unsigned(clk_divider) + 1);  -- Sumar 1 al contador
        end if;
    end if;
end process;

    -- Proceso para la detección de la línea con CLK 
    process(CLK, RESET)
    begin
        if RESET = '0' then
            prev_sensor <= '1';  -- Inicializar el valor de prev_sensor
            counter <= (others => '0');  -- Inicializar el contador de líneas
            line_detected <= FALSE;  -- No se ha detectado ninguna línea aún
        elsif rising_edge(CLK) then
            -- Detectamos el flanco de bajada del SENSOR para iniciar la detección de la línea
            if prev_sensor = '1' and SENSOR = '0' then
                line_detected <= TRUE;  -- Se ha detectado una posible línea
            end if;

            prev_sensor <= SENSOR;  -- Actualizar el valor de prev_sensor para la próxima iteración
        end if;
    end process;

    -- Proceso para verificar la continuidad de la línea con CLK2
    process(CLK2, RESET)
    begin
        if RESET = '0' then
            counter <= (others => '0');  -- Inicializar el contador de líneas
        elsif rising_edge(CLK2) then
            if line_detected = TRUE then
                -- Verificar si el SENSOR sigue detectando la línea
                if SENSOR = '0' then
                    counter <= counter + 1;  -- Incrementar el contador de líneas
                end if;
                line_detected <= FALSE;  -- Reiniciar la detección de la línea para la siguiente comprobación
            end if;
        end if;
    end process;

    -- Asignar el valor final del contador a la salida LEDS
    LEDS <= STD_LOGIC_VECTOR(counter);
end Behavioral;
