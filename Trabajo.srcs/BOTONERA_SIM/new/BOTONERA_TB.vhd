library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BOTONERA_TB is
    --  Port ( );
end BOTONERA_TB;

architecture Behavioral of BOTONERA_TB is
    component BOTONERA

        generic(
            NUM_PISOS : positive := 4;       --numero de pisod del ascensor, incluye el bajo
            NUM_CICLOS : positive := 32     --numero de ciclos a dejar para evitar el rebote
        );

        port(
            BOT_IN : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de boton
            BOT_OUT: out std_logic_vector (NUM_PISOS - 1 downto 0); --salida de boton estable

            CLK : in std_logic;     --RELOJ EN flanco positivo
            CE: in std_logic;       --habilitacion de chip a '1'
            RST_N: in std_logic     --renincio asincrono con valor a '0'

        );

    end component;

    constant N_PRUEBAS : integer := 4;      --numero de pruebas a realizar
    constant N_REBOTES : integer := 5;  --numero de rebotes

    constant N_PISOS : positive := 6;       --numero de pisos
    constant N_CICLOS : positive := 70;     --numero de ciclos antirrebote
    
    constant CLK_PERIOD : time := 10 ns;        --periodo de reloj
    constant DELAY : time := 0.1 * CLK_PERIOD;  --retraso estandar

    signal BOT_IN : std_logic_vector (N_PISOS -1 downto 0) := (others => '0');  --entrada de piso
    signal BOT_OUT : std_logic_vector (N_PISOS -1 downto 0);                    --salida de piso

    signal CLK : std_logic := '0';      --reloj
    signal RST_N : std_logic := '1';    --reset



begin

    prueba_botonera: BOTONERA generic map(
            NUM_PISOS => N_PISOS,      --numero de pisod del ascensor, incluye el bajo
            NUM_CICLOS => N_CICLOS   --numero de ciclos a dejar para evitar el rebote
        )
        port map(
            BOT_IN => BOT_IN,   --emtrada de boton
            BOT_OUT => BOT_OUT, --salida de boton estable

            CLK => CLK,     --RELOJ EN flanco positivo
            CE => CLK,     --habilitacion de chip a '1'
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

        --bucle prueba cada piso de 0 a n-1
        for i in BOT_IN'reverse_range loop
            --hace cada  j en un piso i
            for j in 1 to N_PRUEBAS loop
                --genera rebotes en prueba j de piso i
                for k in 1 to N_REBOTES loop
                    BOT_IN(i) <= '1';
                    wait for CLK_PERIOD;
                    BOT_IN(i) <= '0';
                    wait for CLK_PERIOD;

                end loop;

                wait until BOT_OUT(i) = '1' for 100 * N_CICLOS * CLK_PERIOD;
                wait for DELAY;
                assert BOT_OUT(i) = '1'
                report "[ERROR]: no ha cambiado el pulso del boton " & integer'image(i) & ". en prueba  " & integer'image(j) & "."
                severity FAILURE;

            end loop;
        end loop;
        
        

        wait for 100 * CLK_PERIOD;

        --forzar finalizacion de la simulacion
        assert FALSE
        report "[SUCCESS]: Simulacion correcta"
        severity FAILURE;

    end process;


end Behavioral;
