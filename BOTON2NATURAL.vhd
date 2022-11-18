library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BOTON2NATURAL is
    generic(
        NUM_PISOS : positive := 4;       --numero de pisos del ascensor, incluye el bajo
        NUM_CICLOS : positive := 32     --numero de ciclos a dejar para evitar el rebote
    );

    port(
        BOT_IN : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de boton
        PISO: out natural; --salida de piso en formato natural

        CLK : in std_logic;     --RELOJ EN flanco positivo
        CE: in std_logic;       --habilitacion de chip a '1'
        RST_N: in std_logic     --renincio asincrono con valor a '0'

    );
end BOTON2NATURAL;

architecture Behavioral of BOTON2NATURAL is
    component BOTONERA is

        generic(
            NUM_PISOS : positive := 4;       --numero de pisos del ascensor, incluye el bajo
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

    component ENC_INTEGER is
        generic(
            N_PISOS : positive := 4     --numero de pisos incluyendo el bajo
        );

        port(
            BOT_IN : in std_logic_vector (N_PISOS - 1 downto 0);   --botonera de entrada
            PISO : out natural              --salida de piso como natural, solo de 0 a n-1

        );

    end component;

    signal BOT2ENC : std_logic_vector (BOT_IN'range);

begin

    BOT: BOTONERA

        generic map(
            NUM_PISOS => NUM_PISOS,      --numero de pisos del ascensor, incluye el bajo
            NUM_CICLOS => NUM_CICLOS    --numero de ciclos a dejar para evitar el rebote
        )

        port map(
            BOT_IN => BOT_IN,   --emtrada de boton
            BOT_OUT => BOT2ENC, --salida de boton estable

            CLK  => CLK,     --RELOJ EN flanco positivo
            CE => CE,       --habilitacion de chip a '1'
            RST_N => RST_N    --renincio asincrono con valor a '0'

        );

    ENC: ENC_INTEGER
        generic map(
            N_PISOS => NUM_PISOS     --numero de pisos incluyendo el bajo
        )

        port map(
            BOT_IN => BOT2ENC,   --botonera de entrada
            PISO => PISO             --salida de piso como natural, solo de 0 a n-1

        );


end Behavioral;
