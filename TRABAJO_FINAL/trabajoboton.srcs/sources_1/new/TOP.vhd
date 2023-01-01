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
        NUM_CICLOS : positive := 32;     --numero de ciclos a dejar para evitar el rebote
        MODULO : positive := 5000;   --modulo de la cuenta
        ANCHO : natural := 3         --ancho del contador
        
    );

    port(
        PLANTA_D : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de boton
        PLANTA_A : in std_logic_vector (NUM_PISOS - 1 downto 0);   --emtrada de planta

        MOTOR	: out std_logic_vector(1 downto 0);               --MOTOR
        PUERTA	: out std_logic;                                 --Puerta
        SEGMENTO : out std_logic_vector (6 downto 0);               --segmento
        VISUALIZADOR : out std_logic_vector (7 downto 0);           --visualizador

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
    		N : positive := 4
    	);
        Port (
            PA          : in STD_LOGIC_VECTOR(N-1 downto 0);    -- Entrada de piso actual
            PD          : in STD_LOGIC_VECTOR(N-1 downto 0);    -- Entrada de piso deseado

            PA_MAYOR_PD : out STD_LOGIC; -- PA > PD
            PA_MENOR_PD : out STD_LOGIC; -- PA < PD
            PA_IGUAL_PD : out STD_LOGIC  -- PA = PD
        );
    end component;
    
    component BOTON2BCD is
    generic (
        N_PISOS : positive := 4;     --numero de pisos entre 1 y 10
        RESET_VALUE : std_logic_vector (3 downto 0) := "1111"       --valor predeterminado para el reset del valor BCD
    );
    port(
        INPUT_INTERRUPTOR : in std_logic_vector (N_PISOS - 1 downto 0);     --entrada de los pisos
        OUTPUT_BCD : out std_logic_vector (3 downto 0);                     --salida de los pisos en BCD

        CLK : in std_logic;
        CE : in std_logic;
        RST_N : in std_logic
    );
end component;

component PTOP is
    generic(
        MODULO : positive := 5000;   --modulo de la cuenta
        ANCHO : natural := 3         --ancho del contador
    );
    port(
        RISTRA_DIGITOS : in std_logic_vector (31 downto 0); --8 digitos BC para el display
        VSUALIZADOR : out std_logic_vector (7 downto 0); --encendido visualizador
        SEGMENT : out std_logic_vector (6 downto 0); --segmento decodificado
        
        CLK : in std_logic; --reloj
        RST_N : in std_logic    --reset
    
    );
    end component;

    signal PA_DISTINTO_PD_I : std_logic;
    
    signal PD_BCD : std_logic_vector (3 downto 0);
    signal PA_BCD : std_logic_vector (3 downto 0);

    signal PA_MAYOR_PD_I : STD_LOGIC; -- PA > PD
    signal PA_MENOR_PD_I :  STD_LOGIC; -- PA < PD
    signal PA_IGUAL_PD_I : STD_LOGIC;  -- PA = PD
    
    signal RISTRA_DIGITOS : std_logic_vector (31 downto 0);


begin
        
        maq_est: MAQ_ESTADOS
        port map(
            CLK		=> CLK,
            RST_N	=> RST_N,
            A_MAY_B	=> PA_MAYOR_PD_I,
            A_MEN_B	=> PA_MENOR_PD_I,
            A_IGU_B	=> PA_IGUAL_PD_I,
            MOTOR	=> MOTOR,
            PUERTA	=> PUERTA
        );
    
    comp: Comparador
        Port  map (
            PA          => PA_BCD,   -- Entrada de piso actual
            PD          => PD_BCD,   -- Entrada de piso deseado

            PA_MAYOR_PD => PA_MAYOR_PD_I, -- PA > PD
            PA_MENOR_PD => PA_MENOR_PD_I, -- PA < PD
            PA_IGUAL_PD => PA_IGUAL_PD_I  -- PA = PD
        );
        
        actual : BOTON2BCD 
    generic map (
        N_PISOS => NUM_PISOS,    --numero de pisos entre 1 y 10
        RESET_VALUE => "1110"      --valor predeterminado para el reset del valor BCD
    )
    port map(
        INPUT_INTERRUPTOR => PLANTA_A,     --entrada de los pisos
        OUTPUT_BCD => PA_BCD,                   --salida de los pisos en BCD

        CLK => CLK,
        CE => PA_DISTINTO_PD_I,
        RST_N => RST_N
    );
    
    deseado : BOTON2BCD 
    generic map (
        N_PISOS => NUM_PISOS,    --numero de pisos entre 1 y 10
        RESET_VALUE => "0000"      --valor predeterminado para el reset del valor BCD
    )
    port map(
        INPUT_INTERRUPTOR => PLANTA_D,     --entrada de los pisos
        OUTPUT_BCD => PD_BCD,                   --salida de los pisos en BCD

        CLK => CLK,
        CE => PA_IGUAL_PD_I,
        RST_N => RST_N
    );
    
    PA_DISTINTO_PD_I <= not PA_IGUAL_PD_I;
    
    cidificador7seg: PTOP 
    generic map(
        MODULO => MODULO,   --modulo de la cuenta
        ANCHO => ANCHO        --ancho del contador
    )
    port map(
        RISTRA_DIGITOS => RISTRA_DIGITOS, --8 digitos BC para el display
        VSUALIZADOR => VISUALIZADOR,
        SEGMENT => SEGMENTO,
        
        CLK => CLK,
        RST_N => RST_N    --reset
    
    );
   
RISTRA_DIGITOS <= "110111100000" & PD_BCD & "101011100000" & PA_BCD;


end Behavioral;