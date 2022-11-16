----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2022 17:38:51
-- Design Name: 
-- Module Name: ESTAB_BOT_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ESTAB_BOT_TB is
    --  Port ( );
end ESTAB_BOT_TB;

architecture Behavioral of ESTAB_BOT_TB is
    component ESTAB_BOT
        port(
            BOT_IN: in std_logic;   --emtrada de boton
            BOT_OUT: out std_logic; --salida de boton estable

            CLK : in std_logic;     --RELOJ EN flanco positivo
            CE: in std_logic;       --habilitacion de chip a '1'
            RST_N: in std_logic     --renincio asincrono con valor a '0'
        );
    end component;

    constant N_PRUEBAS : integer := 4; --numero de pruebas

    constant CLK_PERIOD : time := 10 ns;        --periodo de reloj
    constant DELAY : time := 0.1 * CLK_PERIOD;    --retraso estandar

    signal BOT_IN : std_logic := '0';   --entrada boton
    signal BOT_OUT: std_logic;          --salida signal

    signal CLK : std_logic := '0';      --signal
    signal RST_N : std_logic := '1';    --reinicio

begin

    PRUEBA_ESTABILIAZDOR: ESTAB_BOT
        port map(
            BOT_IN => BOT_IN,
            BOT_OUT => BOT_OUT,
            CLK => CLK,
            CE => CLK,
            RST_N => RST_N
        );

    CLK <= not CLK after 0.5 * CLK_PERIOD;  --onda cuadrada de reloj

    RST_N <= '0' after 0.25 * CLK_PERIOD, '1' after 1.75 * CLK_PERIOD;

    SIM: process
    begin
        --espera hasta pasar el pulso de reset
        wait until RST_N = '0';
        wait until RST_N = '1';

        for i in 1 to N_PRUEBAS loop
            --espera a estar durante el reloj a 1
            wait for 5 * CLK_PERIOD;
            wait until CLK = '1';
            wait for DELAY;

            BOT_IN <= '1';

            --espera un ciclo de reloj
            wait for CLK_PERIOD;

            BOT_IN <= '0';

            --espera hasta que cambie el pulso
            wait until BOT_OUT <= '1' for 100 * CLK_PERIOD;
            wait for DELAY;
            assert BOT_OUT = '1'
            report "[ERROR]: no ha cambiado el pulso"
            severity FAILURE;

        end loop;
        
         for i in 1 to N_PRUEBAS loop
            --espera a estar durante el reloj a 1
            wait for 5 * CLK_PERIOD;
            wait until CLK = '1';
            wait for DELAY;

            BOT_IN <= '1';

            --espera un ciclo de reloj
            wait for 10*CLK_PERIOD;

            BOT_IN <= '0';

            --espera hasta que cambie el pulso
            wait until BOT_OUT <= '1' for 100 * CLK_PERIOD;
            wait for DELAY;
            assert BOT_OUT = '1'
            report "[ERROR]: no ha cambiado el pulso"
            severity FAILURE;

        end loop;
        
        --ahora con pulsos mas largos

        --margen para acabar
        wait for 100 * CLK_PERIOD;

        --forzar finalizacion de la simulacion
        assert FALSE
        report "[SUCCESS]: Simulacion correcta"
        severity FAILURE;

    end process;


end Behavioral;
