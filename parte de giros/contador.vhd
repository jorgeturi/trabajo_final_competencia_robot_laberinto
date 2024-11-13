library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Componente pwm_clock_generator que genera una señal de reloj con un ciclo de trabajo ajustable
entity pwm_clock_generator is
    Port ( clk              : in  std_logic;  -- Reloj de entrada
           reset            : in  std_logic;  -- Reset
           pwm_duty_cycle   : in  integer range 0 to 2499;  -- Ciclo de trabajo del PWM (0 a 2499)
           pwm_clk_out      : out std_logic);  -- Señal de salida PWM (simulando un reloj con ciclo de trabajo variable)
end pwm_clock_generator;

architecture Behavioral of pwm_clock_generator is
    signal pwm_counter : integer range 0 to 2499 := 0;  -- Contador para el PWM
begin
    -- Proceso para generar la señal PWM como un reloj con ciclo de trabajo ajustable
    process(clk, reset)
    begin
        if reset = '1' then
            pwm_counter <= 0;  -- Resetea el contador cuando se activa el reset
            pwm_clk_out <= '0'; -- Inicializa la salida en '0'
        elsif rising_edge(clk) then
            -- Incrementa el contador de PWM en cada flanco de reloj
            if pwm_counter = 2500 then
                pwm_counter <= 0;  -- Resetea el contador cuando llega a 2500
            else
                pwm_counter <= pwm_counter + 1;  -- Incrementa el contador
            end if;

            -- Generación de la señal de reloj PWM
            if pwm_counter < pwm_duty_cycle then
                pwm_clk_out <= '1';  -- La señal de salida está alta durante el ciclo de trabajo
            else
                pwm_clk_out <= '0';  -- La señal de salida está baja fuera del ciclo de trabajo
            end if;
        end if;
    end process;
end Behavioral;




entity avanzar is
    Port ( 
        --clk       : in  std_logic;   -- Reloj de entrada (por ejemplo, 50 MHz)
        reset     : in  std_logic;   -- Señal de reset (para inicializar el contador)
        mI0       : out std_logic;
        mI1       : out std_logic;
        mD0       : out std_logic;
        mD1       : out std_logic;
        vmI       : out std_logic;
        vmD       : out std_logic
    );
end avanzar;




architecture Behavioral of avanzar is
    -- Señales internas
    signal pwm_clk_out_mI, pwm_clk_out_mD : std_logic;  -- Salidas de las señales PWM de tipo "clock"
    signal pwm_duty_cycle : integer range 0 to 2499 := 1249;  -- Ciclo de trabajo
begin
    -- Asignación de los pines de dirección
    mI0 <= '0';
    mI1 <= '1';
    mD0 <= '0';
    mD1 <= '1';

    -- Instanciación del generador de reloj PWM para mI
    pwm_clk_gen_mI : entity work.pwm_clock_generator
        port map (
            clk => clk,                      -- Conectar la señal de reloj
            reset => reset,                  -- Conectar la señal de reset
            pwm_duty_cycle => pwm_duty_cycle, -- Ciclo de trabajo ajustable
            pwm_clk_out => pwm_clk_out_mI    -- Conectar la salida PWM para mI
        );

    -- Instanciación del generador de reloj PWM para mD
    pwm_clk_gen_mD : entity work.pwm_clock_generator
        port map (
            clk => clk,                      -- Conectar la señal de reloj
            reset => reset,                  -- Conectar la señal de reset
            pwm_duty_cycle => pwm_duty_cycle, -- Ciclo de trabajo ajustable
            pwm_clk_out => pwm_clk_out_mD    -- Conectar la salida PWM para mD
        );

    -- Asignación de las señales de salida a los pines
    vmI <= pwm_clk_out_mI;  -- Asignamos la salida pwm_clk_out_mI a mI
    vmD <= pwm_clk_out_mD;  -- Asignamos la salida pwm_clk_out_mD a mD

end Behavioral;
