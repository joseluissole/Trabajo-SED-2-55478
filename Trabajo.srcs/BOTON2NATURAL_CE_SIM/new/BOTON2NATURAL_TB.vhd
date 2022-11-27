library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BOTON2NATURAL_TB is
    --  Port ( );
end BOTON2NATURAL_TB;

architecture Behavioral of BOTON2NATURAL_TB is
    component BOTON2NATURAL

        generic(
            NUM_PISOS : positive := 4;       --numero de pisos del ascensor, incluye el bajo
            NUM_CICLOS : positive := 32     --numero de ciclos a dejar para evitar el rebote
        );

        port(
            BOT_IN : in std_logic_vector (NUM_PISOS - 1 downto 0);   --entrada de boton
            PISO: out natural;                                          --salida de piso en formato natural

            CLK : in std_logic;     --RELOJ EN flanco positivo
            CE: in std_logic;       --habilitacion de chip a '1'
            RST_N: in std_logic     --renincio asincrono con valor a '0'
        );

    end component;

    constant N_PRUEBAS : integer := 5;      --numero de pruebas a realizar
    constant N_REBOTES : integer := 4;  --numero de rebotes

    constant N_PISOS : positive := 4;       --numero de pisos
    constant N_CICLOS : positive := 70;     --numero de ciclos antirrebote a esperar para validar la senal

    constant CLK_PERIOD : time := 10 ns;        --periodo de reloj
    constant DELAY : time := 0.1 * CLK_PERIOD;  --retraso estandar

    signal BOT_IN : std_logic_vector (N_PISOS -1 downto 0) := (others => '0');  --entradas de piso
    signal PISO :natural;                                                    --salidas de piso en antural

    signal CLK : std_logic := '0';      --reloj
    signal RST_N : std_logic := '1';    --reset

    signal CE : std_logic := '1';


begin

    BOT: BOTON2NATURAL

        generic map(
            NUM_PISOS => N_PISOS,      --numero de pisos del ascensor, incluye el bajo
            NUM_CICLOS => N_CICLOS    --numero de ciclos a dejar para evitar el rebote
        )

        port map(
            BOT_IN => BOT_IN,   --emtrada de boton
            PISO => PISO, --salida de boton estable

            CLK  => CLK,     --RELOJ EN flanco positivo
            CE => CE,       --habilitacion de chip a '1'
            RST_N => RST_N    --renincio asincrono con valor a '0'

        );
    --pulso de reloj
    CLK <= not CLK after 0.5 * CLK_PERIOD;
    --pulso de reset
    RST_N <= '0' after 0.25 * CLK_PERIOD , '1' after 1.75 * CLK_PERIOD;

    BOTONERA_TEST:process
    begin
        --espera hasta reset
        wait until RST_N = '0';
        wait until RST_N = '1';
        wait until CLK = '1';
        wait for DELAY;

        --bucle prueba cada piso de 0 a n-1 en directa
        for i in BOT_IN'reverse_range loop
            wait for 10*CLK_PERIOD;
            CE <= '1';

            --genera rebotes en prueba j de piso i
            for j in 1 to N_REBOTES loop
                BOT_IN(i) <= '1';
                wait for CLK_PERIOD;
                BOT_IN(i) <= '0';
                wait for CLK_PERIOD;

            end loop;

            wait on PISO for 100*CLK_PERIOD + CLK_PERIOD*N_CICLOS;
            wait for DELAY;
            CE <= '0';
            
            wait for 10 * CLK_PERIOD;
            
            --comprueba efecto del chip enable

            for k in BOT_IN'reverse_range loop

                for l in 1 to N_REBOTES loop
                    BOT_IN(k) <= '1';
                    wait for CLK_PERIOD;
                    BOT_IN(k) <= '0';
                    wait for CLK_PERIOD;

                end loop;
            end loop;

            wait on PISO for 100*CLK_PERIOD + CLK_PERIOD*N_CICLOS;
            wait for DELAY;

            assert PISO = i
            report "[ERROR]: no ha cambiado el pulso del boton " & integer'image(i) & ". en prueba  " & integer'image(i) & "."
            severity FAILURE;

            wait for 10*CLK_PERIOD;
            BOT_IN <= (others => '0');

        end loop;


        --bucle prueba cada piso de 0 a n-1 en reversa
        for i in BOT_IN'range loop
            wait for 10*CLK_PERIOD;
            CE <= '1';

            --genera rebotes en prueba j de piso i
            for j in 1 to N_REBOTES loop
                BOT_IN(i) <= '1';
                wait for CLK_PERIOD;
                BOT_IN(i) <= '0';
                wait for CLK_PERIOD;

            end loop;

            wait on PISO for 100*CLK_PERIOD + CLK_PERIOD*N_CICLOS;
            wait for DELAY;
            CE <= '0';
            
            wait for 10 * CLK_PERIOD;
            
            --comprueba efecto del chip enable

            for k in BOT_IN'range loop

                for l in 1 to N_REBOTES loop
                    BOT_IN(k) <= '1';
                    wait for CLK_PERIOD;
                    BOT_IN(k) <= '0';
                    wait for CLK_PERIOD;

                end loop;
            end loop;

            wait on PISO for 100*CLK_PERIOD + CLK_PERIOD*N_CICLOS;
            wait for DELAY;

            assert PISO = i
            report "[ERROR]: no ha cambiado el pulso del boton " & integer'image(i) & ". en prueba  " & integer'image(i) & "."
            severity FAILURE;

            wait for 10*CLK_PERIOD;
            BOT_IN <= (others => '0');

        end loop;


        wait for 100 * CLK_PERIOD;

        --forzar finalizacion de la simulacion
        assert FALSE
        report "[SUCCESS]: Simulacion correcta"
        severity FAILURE;

    end process;


end Behavioral;
