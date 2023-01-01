library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Comparador is
end tb_Comparador;

architecture tb of tb_Comparador is

    component Comparador
        port (PA          : in natural;
              PD          : in natural;
              CLK         : in std_logic;
              PA_MAYOR_PD : out std_logic;
              PA_MENOR_PD : out std_logic;
              PA_IGUAL_PD : out std_logic);
    end component;

    signal PA          : natural;
    signal PD          : natural;
    signal CLK         : std_logic;
    signal PA_MAYOR_PD : std_logic;
    signal PA_MENOR_PD : std_logic;
    signal PA_IGUAL_PD : std_logic;

    constant TbPeriod : time := 1000 ns; -- periodo de simulacion
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : Comparador
    port map (PA          => PA,
              PD          => PD,
              CLK         => CLK,
              PA_MAYOR_PD => PA_MAYOR_PD,
              PA_MENOR_PD => PA_MENOR_PD,
              PA_IGUAL_PD => PA_IGUAL_PD);

    -- generar el reloj
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- Asignación de reloj
    CLK <= TbClock;

    stimuli : process
    begin
        -- Inicializar las entradas
        PA <= 0;
        PD <= 0;

        -- Comprobar las salidas 
        for i in 1 to 6 loop
        PA <= 6 - i;
        PD <=  i;
        wait for 2 * TbPeriod;
        end loop;
        wait for 100 * TbPeriod;

       -- forzar el fin 
       assert FALSE
       report "[SUCCESS] Testbench completed"
       severity FAILURE;
    end process;

end tb;
