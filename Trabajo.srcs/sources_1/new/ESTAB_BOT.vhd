
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ESTAB_BOT is

    generic(
        NUM_CICLOS : positive := 32     --numero de ciclos a dejar para evitar el rebote
    );

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

    component DBNCR is
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

    signal SYNCHRNZR_2_EDGEDTCTR : std_logic;   --senal del sincronizador al detector de flancos
    signal EDGEDTCTR_2_DBNCR : std_logic;       --senal del detector de flancos al antirrebota 

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
            EDGE => EDGEDTCTR_2_DBNCR,                    --salioda de marca de flanco negativa

            CLK => CLK ,                        --RELOJ EN flanco positivo
            CE => CE,                           --habilitacion de chip a '1'
            RST_N => RST_N                      --renincio asincrono con valor a '0'
        );

    ANTIRREBOTE: DBNCR
        generic map(
            N_CICLOS => NUM_CICLOS --numero ciclos espera a validar senal
        )

        port map(
            PRE_D => EDGEDTCTR_2_DBNCR,   --entrada de flanco
            POST_D => BOT_OUT,--flanco de salida;

            CLK => CLK,    --RELOJ EN flanco positivo
            CE => CE,      --habilitacion de chip a '1'
            RST_N => RST_N  --renincio asincrono con valor a '0'
        );


end Behavioral;
