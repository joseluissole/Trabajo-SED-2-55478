library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity DBNCR_TB is
    --  Port ( );
end DBNCR_TB;

architecture Behavioral of DBNCR_TB is
    component DBNCR
        generic(
            N_CICLOS: positive := 32 --numero ciclos espera a validar senal
        );

        port(
            PRE_D : in std_logic;   --entrada de flanco
            POST_D : out std_logic; --flanco de salida;

            CLK : in std_logic;     --RELOJ EN flanco positivo
            CE: in std_logic;       --habilitacion de chip a '1'
            RST_N: in std_logic     --renincio asincrono con valor a '0'
        );

    end component;
    
    constant N_PRUEBAS : integer := 5;  --numero de pruebas
    
    constant N_CICLOS : positive := 20; --numero de ciclos

    signal CLK : std_logic := '0';      --reloj
    signal RST_N : std_logic := '1';    --reset

    signal PRE_D : std_logic := '0';      --boton
    signal POST_D : std_logic;            --salida  

    constant CLK_PERIOD : time := 10 ns;    --period reloj
    constant DELAY : time := 0.1*CLK_PERIOD;    --retraso

begin
    
    PR_DBN : DBNCR generic map(
            N_CICLOS => N_CICLOS --numero ciclos espera a validar senal
        )

        port map(
            PRE_D => PRE_D,   --entrada de flanco
            POST_D => POST_D, --flanco de salida;

            CLK => CLK,    --RELOJ EN flanco positivo
            CE => CLK,       --habilitacion de chip a '1'
            RST_N => RST_N  --renincio asincrono con valor a '0'
        );
    
    
    CLK <= not CLK after 0.5*CLK_PERIOD;
    RST_N <= '0' after 0.25*CLK_PERIOD, '1' after 1.75*CLK_PERIOD;
    
    PRUEBA_DBNCR: process
    begin
        wait until RST_N = '0';
        wait until RST_N = '1';
        
        wait until CLK = '1';
        wait for DELAY;
        
         for i in 1 to N_PRUEBAS loop
         
          
            --espera a estar durante el reloj a 1
            wait for 10 * CLK_PERIOD;
            wait until CLK = '1';
            wait for DELAY;


            --simulo rebotes aritficiales
            for j in 1 to N_PRUEBAS loop
            PRE_D <= '1';

            --espera un ciclo de reloj
            wait for CLK_PERIOD;

            PRE_D <= '0';
            
            --espera un ciclo de reloj
            wait for CLK_PERIOD;
            end loop;

            --espera hasta que cambie el pulso
            wait until POST_D <= '1' for 100 * CLK_PERIOD;
            wait for DELAY;
            assert POST_D = '1'
            report "[ERROR]: no ha cambiado el pulso"
            severity FAILURE;

        end loop;
        
        --espera para finalizar
         wait for 100 * CLK_PERIOD;

        --forzar finalizacion de la simulacion
        assert FALSE
        report "[SUCCESS]: Simulacion correcta"
        severity FAILURE;

    
    end process;


end Behavioral;
