library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity motor is
    Port ( 
        clk       : in  STD_LOGIC;   -- Reloj de entrada (por ejemplo, 50 MHz)
        reset     : in  STD_LOGIC;   -- Señal de reset (para inicializar el contador)
        mI0       : out STD_LOGIC;
        mI1       : out STD_LOGIC;
        mD0       : out STD_LOGIC;
        mD1       : out STD_LOGIC;
        vmI       : out STD_LOGIC;
        vmD       : out STD_LOGIC
    );
end motor;

architecture Behavioral of motor is
    -- Parámetros para el PWM
    signal pwm_counter : integer range 0 to 2499 := 0;  -- Contador para 1 kHz con reloj de 50 MHz
    signal pwm_duty_cycle : integer range 0 to 2499 := 1249;  -- Ciclo de trabajo (50% de 50,000)
    
begin
    -- Generación de señales mI0, mI1, mD0 y mD1
    mI0 <= '0';
    mI1 <= '1';
    mD0 <= '0';
    mD1 <= '1';
    
    -- Proceso de generación de PWM con reloj
    process(clk, reset)
    begin
        if reset = '1' then
            pwm_counter <= 0;  -- Resetea el contador cuando se activa el reset
        elsif rising_edge(clk) then
            -- Incrementa el contador de PWM en cada flanco de reloj
            if pwm_counter = 2500 then
                pwm_counter <= 0;  -- Resetea el contador cuando llega a 50,000 (1 ms)
            else
                pwm_counter <= pwm_counter + 1;  -- Incrementa el contador
            end if;

            -- Generación de la señal PWM para vmI
            if pwm_counter < pwm_duty_cycle then
                vmI <= '1';  -- Señal encendida
            else
                vmI <= '0';  -- Señal apagada
            end if;

            -- Generación de la señal PWM para vmD
            if pwm_counter < pwm_duty_cycle then
                vmD <= '1';  -- Señal encendida
            else
                vmD <= '0';  -- Señal apagada
            end if;
        end if;
    end process;
end Behavioral;
