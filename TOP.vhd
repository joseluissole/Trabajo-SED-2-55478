----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.12.2022 11:58:39
-- Design Name: 
-- Module Name: TOP - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP is
    generic(
        NUM_PISOS : positive := 4;       --numero de pisos del ascensor, incluye el bajo
        NUM_CICLOS : positive := 32     --numero de ciclos a dejar para evitar el rebote
    );

    port(
        ASCENSOR_IN : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de boton
        PLANTA_IN : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de planta

        MOTOR	: out std_logic_vector(1 downto 0);
        PUERTA	: out std_logic;

        CLK : in std_logic;     --RELOJ EN flanco positivo
        RST_N: in std_logic     --renincio asincrono con valor a '0'

    );
end TOP;

architecture Behavioral of TOP is
    component BOTON2NATURAL
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

    end component;

    component MAQ_ESTADOS is
        port(
            CLK		: in std_logic;
            RST_N	: in std_logic;
            A_MAY_B	: in std_logic;
            A_MEN_B	: in std_logic;
            A_IGU_B	: in std_logic;
            MOTOR	: out std_logic_vector(1 downto 0);
            PUERTA	: out std_logic
        );
    end component;

    component Comparador is
        Port (
            PA          : in NATURAL;    -- Entrada de piso actual
            PD          : in NATURAL;    -- Entrada de piso deseado

            PA_MAYOR_PD : out STD_LOGIC; -- PA > PD
            PA_MENOR_PD : out STD_LOGIC; -- PA < PD
            PA_IGUAL_PD : out STD_LOGIC  -- PA = PD
        );
    end component;

    signal PUERTA_I : std_logic;
    signal PA_I :  natural;
    signal PD_I : natural;

    signal PA_MAYOR_PD_I : STD_LOGIC; -- PA > PD
    signal PA_MENOR_PD_I :  STD_LOGIC; -- PA < PD
    signal PA_IGUAL_PD_I : STD_LOGIC;  -- PA = PD


begin

    sensor_planta: BOTON2NATURAL  generic map(
            NUM_PISOS => NUM_PISOS,       --numero de pisos del ascensor, incluye el bajo
            NUM_CICLOS => NUM_CICLOS    --numero de ciclos a dejar para evitar el rebote
        )

        port map(
            BOT_IN => ASCENSOR_IN,   --emtrada de boton
            PISO => PA_I, --salida de piso en formato natural

            CLK => CLK,    --RELOJ EN flanco positivo
            CE => CLK,       --habilitacion de chip a '1'
            RST_N => RST_N    --renincio asincrono con valor a '0'

        );
        
        boton_piso: BOTON2NATURAL  generic map(
            NUM_PISOS => NUM_PISOS,       --numero de pisos del ascensor, incluye el bajo
            NUM_CICLOS => NUM_CICLOS    --numero de ciclos a dejar para evitar el rebote
        )

        port map(
            BOT_IN => PLANTA_IN,   --emtrada de boton
            PISO => PD_I, --salida de piso en formato natural

            CLK => CLK,    --RELOJ EN flanco positivo
            CE => PUERTA_I,       --habilitacion de chip a '1'
            RST_N => RST_N    --renincio asincrono con valor a '0'

        );
        
        maq_est: MAQ_ESTADOS
        port map(
            CLK		=> CLK,
            RST_N	=> RST_N,
            A_MAY_B	=> PA_MAYOR_PD_I,
            A_MEN_B	=> PA_MENOR_PD_I,
            A_IGU_B	=> PA_IGUAL_PD_I,
            MOTOR	=> MOTOR,
            PUERTA	=> PUERTA_I
        );
    
    comp: Comparador
        Port  map (
            PA          => PA_I,   -- Entrada de piso actual
            PD          => PD_I,   -- Entrada de piso deseado

            PA_MAYOR_PD => PA_MAYOR_PD_I, -- PA > PD
            PA_MENOR_PD => PA_MENOR_PD_I, -- PA < PD
            PA_IGUAL_PD => PA_IGUAL_PD_I  -- PA = PD
        );
    
    PUERTA <= PUERTA_I;

end Behavioral;
