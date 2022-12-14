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
        PLANTA_D : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de boton
        PLANTA_A : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de planta

        MOTOR	: out std_logic_vector(1 downto 0);
        PUERTA	: out std_logic;

        CLK : in std_logic;     --RELOJ EN flanco positivo
        RST_N: in std_logic     --renincio asincrono con valor a '0'

    );
end TOP;

architecture Behavioral of TOP is
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
    	generic(
    		N : positive := 4;
    	);
        Port (
            PA          : in STD_LOGIC_VECTOR(N-1 downto 0);    -- Entrada de piso actual
            PD          : in STD_LOGIC_VECTOR(N-1 downto 0);    -- Entrada de piso deseado

            PA_MAYOR_PD : out STD_LOGIC; -- PA > PD
            PA_MENOR_PD : out STD_LOGIC; -- PA < PD
            PA_IGUAL_PD : out STD_LOGIC  -- PA = PD
        );
    end component;

    signal PUERTA_I : std_logic;

    signal PA_MAYOR_PD_I : STD_LOGIC; -- PA > PD
    signal PA_MENOR_PD_I :  STD_LOGIC; -- PA < PD
    signal PA_IGUAL_PD_I : STD_LOGIC;  -- PA = PD


begin
        
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
            PA          => PLANTA_A,   -- Entrada de piso actual
            PD          => PLANTA_D,   -- Entrada de piso deseado

            PA_MAYOR_PD => PA_MAYOR_PD_I, -- PA > PD
            PA_MENOR_PD => PA_MENOR_PD_I, -- PA < PD
            PA_IGUAL_PD => PA_IGUAL_PD_I  -- PA = PD
        );
    
    PUERTA <= PUERTA_I;

end Behavioral;