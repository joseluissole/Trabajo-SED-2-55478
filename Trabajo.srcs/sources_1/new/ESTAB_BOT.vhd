
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ESTAB_BOT is

    port(
        BOT_IN: in std_logic;   --emtrada de botn
        BOT_OUT: out std_logic; --salida de boton estable

        CLK : in std_logic;     --RELOJ EN flanco positivo
        CE: in std_logic;       --habilitacion de chip a '1'
        RST_N: in std_logic     --renincio asincrono con valor a '0'

    );

end ESTAB_BOT;

architecture Behavioral of ESTAB_BOT is

    component SYNCHRNZR
        port (

            ASYNC_IN : in std_logic;    --Entrada asinctrcrona
            SYNC_OUT : out std_logic;   --Salida sincrona

            CLK : in std_logic;         --RELOJ EN flanco positivo
            CE: in std_logic;           --habilitacion de chip a '1'
            RST_N: in std_logic         --renincio asincrono con valor a '0'

        );
    end component;

    component EDGEDTCTR is
        port (

            SYNC_IN : in std_logic; --entrada sincrona
            EDGE : out std_logic;   --salioda de marca de flanco negativa

            CLK : in std_logic;     --RELOJ EN flanco positivo
            CE: in std_logic;       --habilitacion de chip a '1'
            RST_N: in std_logic     --renincio asincrono con valor a '0'
        );
    end component;

    signal SYNCHRNZR_2_EDGEDTCTR : std_logic;

begin

    SINCRONIZADO: SYNCHRNZR
        port map (

            ASYNC_IN => BOT_IN,                 --Entrada asinctrcrona
            SYNC_OUT => SYNCHRNZR_2_EDGEDTCTR,  --Salida sincrona

            CLK => CLK,                         --RELOJ EN flanco positivo
            CE => CE,                           --habilitacion de chip a '1'
            RST_N => RST_N                      --renincio asincrono con valor a '0'

        );

    FLANCO: EDGEDTCTR
        port map (

            SYNC_IN => SYNCHRNZR_2_EDGEDTCTR,   --entrada sincrona
            EDGE => BOT_OUT,                    --salioda de marca de flanco negativa

            CLK => CLK ,                        --RELOJ EN flanco positivo
            CE => CE,                           --habilitacion de chip a '1'
            RST_N => RST_N                      --renincio asincrono con valor a '0'
        );


end Behavioral;
