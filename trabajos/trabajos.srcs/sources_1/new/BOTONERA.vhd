library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity BOTONERA is

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

 end entity BOTONERA;

architecture Behavioral of BOTONERA is

    component ESTAB_BOT
        generic(
            NUM_CICLOS : positive := 32     --numero de ciclos a dejar para evitar el rebote
        );
        port(
            BOT_IN: in std_logic;   --emtrada de boton
            BOT_OUT: out std_logic; --salida de boton estable

            CLK : in std_logic;     --RELOJ EN flanco positivo
            CE: in std_logic;       --habilitacion de chip a '1'
            RST_N: in std_logic     --renincio asincrono con valor a '0'
        );
    end component;

begin

--generacion de botones de 0 a n-1
BOTONES_ASCENSOR: for i in BOT_IN'reverse_range generate
    BOTON_i: ESTAB_BOT generic map (
            NUM_CICLOS => NUM_CICLOS
            )
        port map(
            BOT_IN => BOT_IN(i),
            BOT_OUT => BOT_OUT(i),
            CLK => CLK,
            CE => CE,
            RST_N => RST_N
        );

end generate;


end Behavioral;
